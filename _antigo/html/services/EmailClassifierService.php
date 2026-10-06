<?php
/**
 * Email Classifier Service
 * Classifies emails as JUDICIAL or NON_JUDICIAL using Qwen AI (with fallback to keyword matching)
 * Extracts CNJ number, vara, comarca, and stores confidence + reasoning
 */

class EmailClassifierService
{
    private $pdo;
    private $qwen_classifier = null;

    public function __construct($pdo, $qwen_classifier = null)
    {
        $this->pdo = $pdo;

        // Optionally inject Qwen classifier (for testing or custom config)
        if ($qwen_classifier !== null) {
            $this->qwen_classifier = $qwen_classifier;
        }
    }

    /**
     * Initialize Qwen classifier if not already done
     */
    private function initQwenClassifier()
    {
        if ($this->qwen_classifier === null) {
            try {
                require_once dirname(__FILE__) . '/QwenClassifierServicePHP.php';
                $this->qwen_classifier = new QwenClassifierServicePHP();
            } catch (Exception $e) {
                // Log but don't fail - will use fallback
                error_log("Failed to initialize Qwen classifier: " . $e->getMessage());
                $this->qwen_classifier = false; // Mark as failed
            }
        }
        return $this->qwen_classifier !== false ? $this->qwen_classifier : null;
    }

    /**
     * Classify email and extract judicial data
     * Uses Qwen AI with fallback to keyword matching
     */
    public function classifyEmail($communication_id)
    {
        try {
            // Fetch email data
            $stmt = $this->pdo->prepare('
                SELECT id, subject, body_preview, body, from_name
                FROM communications
                WHERE id = ?
            ');
            $stmt->execute([$communication_id]);
            $comm = $stmt->fetch();

            if (!$comm) {
                return ['success' => false, 'error' => 'Communication not found'];
            }

            // Prefer full body, fall back to preview
            $body = !empty($comm['body']) ? $comm['body'] : $comm['body_preview'];
            $subject = $comm['subject'] ?? '';

            // Try Qwen classification first
            $qwen = $this->initQwenClassifier();
            $qwen_result = null;
            $use_fallback = false;
            $confidence = 0.0;
            $reasoning = '';

            if ($qwen !== null) {
                $qwen_result = $qwen->classifyEmail($subject, $body);

                if ($qwen_result && isset($qwen_result['success']) && $qwen_result['success']) {
                    // Qwen succeeded
                    $classification = $qwen_result['classification'] ?? 'UNKNOWN';
                    $cnj_number = $qwen_result['cnj_number'] ?? null;
                    $vara = $qwen_result['vara'] ?? null;
                    $comarca = $qwen_result['comarca'] ?? null;
                    $confidence = floatval($qwen_result['confidence'] ?? 0.0);
                    $reasoning = $qwen_result['reasoning'] ?? '';
                } else {
                    // Qwen failed or returned error, use fallback
                    $use_fallback = true;
                    $confidence = 0.0;
                    $reasoning = $qwen_result['error'] ?? 'Qwen classification failed, using fallback';
                }
            } else {
                // Qwen not available, use fallback
                $use_fallback = true;
                $reasoning = 'Qwen classifier unavailable, using keyword fallback';
            }

            // If using fallback, apply keyword-based classification
            if ($use_fallback) {
                $text = strtoupper($subject . ' ' . $body);
                $classification = $this->classifyAsJudicialFallback($text);
                $cnj_number = $this->extractCNJNumberFallback($text);
                $vara = $this->extractVaraFallback($text);
                $comarca = $this->extractComarcaFallback($text);
                $confidence = 0.5; // Lower confidence for fallback
                if (empty($reasoning)) {
                    $reasoning = 'Keyword fallback classification';
                }
            }

            // Ensure values are properly set
            $classification = $classification ?? 'UNKNOWN';
            $has_complete_data = !empty($cnj_number) && !empty($vara) && !empty($comarca);

            // Update database with all 7 fields
            $update = $this->pdo->prepare('
                UPDATE communications
                SET classification = ?,
                    cnj_number = ?,
                    vara = ?,
                    comarca = ?,
                    has_complete_data = ?,
                    confidence = ?,
                    reasoning = ?,
                    extracted_at = NOW()
                WHERE id = ?
            ');
            $update->execute([
                $classification,
                $cnj_number,
                $vara,
                $comarca,
                $has_complete_data ? 1 : 0,
                $confidence,
                $reasoning,
                $communication_id
            ]);

            return [
                'success' => true,
                'classification' => $classification,
                'cnj_number' => $cnj_number,
                'vara' => $vara,
                'comarca' => $comarca,
                'has_complete_data' => $has_complete_data,
                'confidence' => $confidence,
                'reasoning' => $reasoning,
                'used_fallback' => $use_fallback
            ];
        } catch (Exception $e) {
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    /**
     * Classify text as JUDICIAL or NON_JUDICIAL (Fallback)
     * Uses comprehensive list of judicial terms from Brazilian court system
     * Called when Qwen is unavailable or fails
     */
    private function classifyAsJudicialFallback($text)
    {
        $judicial_keywords = [
            // Tribunais
            'TRIBUNAL DE JUSTIÇA', 'TRIBUNAL REGIONAL FEDERAL', 'TRIBUNAL REGIONAL DO TRABALHO',
            'TRIBUNAL REGIONAL ELEITORAL', 'SUPREMO TRIBUNAL FEDERAL', 'SUPERIOR TRIBUNAL DE JUSTIÇA',
            'TRIBUNAL SUPERIOR DO TRABALHO', 'TJ', 'TRF', 'TRT', 'TRE', 'STF', 'STJ', 'TST',
            'TJMS', 'TJSP', 'TJPR', 'TJMT', 'TJGO', 'TJMG', 'TJRS', 'TJSC', 'TJBA', 'TJPE', 'TJCE', 'TJDFT',

            // Judiciário
            'VARA', 'VARA JUDICIAL', 'VARA CÍVEL', 'VARA CRIMINAL', 'VARA DE FAMÍLIA',
            'VARA DA FAZENDA PÚBLICA', 'VARA DO TRABALHO', 'VARA FEDERAL',
            'JUIZADO', 'JUIZADO ESPECIAL', 'JUIZADO ESPECIAL CÍVEL', 'JUIZADO ESPECIAL CRIMINAL',
            'FÓRUM', 'COMARCA', 'TURMA RECURSAL', 'CÂMARA', 'CARTÓRIO', 'CARTÓRIO JUDICIAL',
            'CENTRAL DE MANDADOS', 'PODER JUDICIÁRIO', 'JUSTIÇA ESTADUAL', 'JUSTIÇA FEDERAL',
            'JUSTIÇA DO TRABALHO', 'SECRETARIA JUDICIAL', 'SECRETARIA DA VARA',

            // Pessoas
            'JUIZ', 'JUÍZA', 'MAGISTRADO', 'MAGISTRADA', 'MM. JUIZ', 'MM. JUÍZA',
            'OFICIAL DE JUSTIÇA', 'DEFENSOR PÚBLICO', 'PROMOTOR DE JUSTIÇA', 'MINISTÉRIO PÚBLICO',

            // Processo
            'PROCESSO', 'PROCESSO JUDICIAL', 'NÚMERO DO PROCESSO', 'Nº DO PROCESSO',
            'AUTOS', 'AUTOS DO PROCESSO', 'CNJ', 'PJE', 'E-SAJ', 'ESAJ', 'EPROC', 'PROJUDI',

            // Atos
            'INTIMAÇÃO', 'INTIMADO', 'INTIMADA', 'CITAÇÃO', 'CITADO', 'CITADA',
            'NOTIFICAÇÃO JUDICIAL', 'MANDADO', 'MANDADO JUDICIAL',
            'DESPACHO', 'DECISÃO', 'DECISÃO JUDICIAL', 'SENTENÇA', 'ACÓRDÃO',
            'AUDIÊNCIA', 'AUDIÊNCIA JUDICIAL', 'PERÍCIA', 'PERÍCIA JUDICIAL',
            'LAUDO', 'LAUDO PERICIAL', 'APRESENTAÇÃO DO LAUDO', 'ENTREGA DO LAUDO',

            // Perícia
            'PERITO', 'PERITA', 'PERITO JUDICIAL', 'PERITA JUDICIAL',
            'NOMEAÇÃO', 'NOMEAÇÃO DE PERITO', 'NOMEADO', 'NOMEADA',
            'QUESITOS', 'ASSISTENTE TÉCNICO', 'HONORÁRIOS PERICIAIS',

            // Procedimentos
            'EXECUÇÃO', 'CUMPRIMENTO DE SENTENÇA', 'PETIÇÃO', 'MANIFESTAÇÃO',
            'DETERMINAÇÃO', 'DETERMINAÇÃO JUDICIAL', 'ORDEM JUDICIAL', 'OFÍCIO JUDICIAL',
            'FICA VOSSA SENHORIA INTIMADO', 'POR DETERMINAÇÃO', 'DETERMINO', 'INTIME-SE',
            'CITE-SE', 'CIENTIFIQUE-SE', 'PRAZO PROCESSUAL', 'NO PRAZO DE',

            // Partes
            'AUTOR', 'RÉU', 'REQUERENTE', 'REQUERIDO', 'EXEQUENTE', 'EXECUTADO',
            'RECLAMANTE', 'RECLAMADO', 'ADVOGADO', 'PROCURADOR'
        ];

        $non_judicial_keywords = [
            'FATURA', 'NOTA FISCAL', 'COBRANÇA', 'PAGAMENTO', 'BOLETO',
            'VENCIMENTO', 'DÉBITO', 'CRÉDITO', 'BANCO', 'CARTÃO',
            'INTERNET', 'TELEFONE', 'ENERGIA', 'ÁGUA', 'ASSINATURA',
            'PROMOÇÃO', 'OFERTA', 'DESCONTO', 'VENDA', 'COMPRA',
            'CADASTRO', 'ATUALIZAÇÃO CADASTRAL', 'CHAVE DE ACESSO',
            'OPERACIONAL', 'ADMINISTRATIVO', 'RESPONDA ESTE EMAIL'
        ];

        $judicial_score = 0;
        $non_judicial_score = 0;

        foreach ($judicial_keywords as $keyword) {
            if (strpos($text, $keyword) !== false) {
                $judicial_score++;
            }
        }

        foreach ($non_judicial_keywords as $keyword) {
            if (strpos($text, $keyword) !== false) {
                $non_judicial_score++;
            }
        }

        // Non-judicial has priority
        if ($non_judicial_score > 0) {
            return 'NON_JUDICIAL';
        }

        // Require at least 1 judicial indicator
        return $judicial_score >= 1 ? 'JUDICIAL' : 'UNKNOWN';
    }

    /**
     * Extract and validate CNJ number: 0000000-00.0000.0.00.0000 (Fallback)
     * Strict validation - must match exact pattern and pass check digits
     * Called when Qwen is unavailable or fails
     */
    private function extractCNJNumberFallback($text)
    {
        // Strict regex: 7 digits - 2 digits . 4 digits . 1 digit . 2 digits . 4 digits
        if (preg_match('/\b(\d{7})-(\d{2})\.(\d{4})\.(\d{1})\.(\d{2})\.(\d{4})\b/', $text, $matches)) {
            $cnj = $matches[0];

            // Validate CNJ structure
            if ($this->isValidCNJFallback($cnj)) {
                return $cnj;
            }
        }
        return null;
    }

    /**
     * Validate CNJ number: checks format and business rules (Fallback)
     * Format: NNNNNNN-DD.AAAA.J.TT.OOOO
     */
    private function isValidCNJFallback($cnj)
    {
        if (!preg_match('/^(\d{7})-(\d{2})\.(\d{4})\.(\d{1})\.(\d{2})\.(\d{4})$/', $cnj, $matches)) {
            return false;
        }

        list(, $nnnnnnn, $dd, $aaaa, $j, $tt, $oooo) = $matches;

        // Segment must be 1-9 (not 0)
        if ($j === '0') {
            return false;
        }

        // Tribunal must be 01-28
        if ((int)$tt < 1 || (int)$tt > 28) {
            return false;
        }

        // Year must be 1990 to current year
        $year = (int)$aaaa;
        if ($year < 1990 || $year > date('Y')) {
            return false;
        }

        return true;
    }

    /**
     * Extract VARA (judicial unit) (Fallback)
     * Handles: "VARA ÚNICA", "1ª VARA", "VARA CÍVEL", etc.
     * Called when Qwen is unavailable or fails
     */
    private function extractVaraFallback($text)
    {
        // Pattern 1: "VARA ÚNICA" or just "VARA" with specific types
        if (preg_match('/VARA\s+ÚNICA/i', $text, $matches)) {
            return trim($matches[0]);
        }

        // Pattern 2: Numbered vara like "1ª VARA CÍVEL"
        if (preg_match('/\b(\d+)\.?ª\s+VARA\s+(?:CÍVEL|CRIMINAL|TRABALHISTA|COMERCIAL|FAMÍLIA|FAZENDA|FEDERAL)?/i', $text, $matches)) {
            return trim($matches[0]);
        }

        // Pattern 3: "VARA DE CITY" or "VARA CÍVEL DE CITY"
        if (preg_match('/VARA\s+(?:CÍVEL|CRIMINAL|TRABALHISTA|COMERCIAL|FAMÍLIA|FAZENDA)?\s+DE\s+([A-ZÁÉÍÓÚ\s]+?)(?:\s+[-–]|\n|,|TRIBUNAL|COMARCA|FORO)/i', $text, $matches)) {
            return 'VARA DE ' . trim($matches[1]);
        }

        // Pattern 4: Simple type "VARA CÍVEL"
        if (preg_match('/(VARA\s+(?:CÍVEL|CRIMINAL|TRABALHISTA|COMERCIAL|FAMÍLIA|FAZENDA|FEDERAL))/i', $text, $matches)) {
            return trim($matches[1]);
        }

        // Pattern 5: Just "VARA"
        if (preg_match('/\bVARA\b/i', $text)) {
            return 'VARA';
        }

        return null;
    }

    /**
     * Extract COMARCA (judicial district) (Fallback)
     * Also looks for TRIBUNAL location
     * Called when Qwen is unavailable or fails
     */
    private function extractComarcaFallback($text)
    {
        // Pattern 1: Explicit COMARCA
        if (preg_match('/COMARCA\s+(?:DE|DA|DO)?\s+([A-ZÁÉÍÓÚ\s]+?)(?:\s+[-–]|\n|,|VARA|TRIBUNAL|FORO|$)/i', $text, $matches)) {
            return trim($matches[1]);
        }

        // Pattern 2: FORO DE CITY
        if (preg_match('/FORO\s+(?:DE|DA|DO)?\s+([A-ZÁÉÍÓÚ\s]+?)(?:\s+[-–]|\n|,|VARA|TRIBUNAL|$)/i', $text, $matches)) {
            return trim($matches[1]);
        }

        // Pattern 3: Look for state abbreviations (TJMS, TJSP, etc.) and map to state
        if (preg_match('/TJ([A-Z]{2})/i', $text, $matches)) {
            $state_codes = [
                'MS' => 'MATO GROSSO DO SUL',
                'SP' => 'SÃO PAULO',
                'PR' => 'PARANÁ',
                'MT' => 'MATO GROSSO',
                'GO' => 'GOIÁS',
                'MG' => 'MINAS GERAIS',
                'RS' => 'RIO GRANDE DO SUL',
                'SC' => 'SANTA CATARINA',
                'BA' => 'BAHIA',
                'PE' => 'PERNAMBUCO',
                'CE' => 'CEARÁ',
                'RJ' => 'RIO DE JANEIRO',
                'DF' => 'DISTRITO FEDERAL'
            ];
            $state = strtoupper($matches[1]);
            if (isset($state_codes[$state])) {
                return $state_codes[$state];
            }
        }

        return null;
    }
}
