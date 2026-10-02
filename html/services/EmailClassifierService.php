<?php
/**
 * Email Classifier Service
 * Classifies emails as JUDICIAL or NON_JUDICIAL
 * Extracts CNJ number, vara, comarca
 */

class EmailClassifierService
{
    private $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    /**
     * Classify email and extract judicial data
     */
    public function classifyEmail($communication_id)
    {
        try {
            $stmt = $this->pdo->prepare('SELECT subject, body_preview, from_name FROM communications WHERE id = ?');
            $stmt->execute([$communication_id]);
            $comm = $stmt->fetch();

            if (!$comm) {
                return ['success' => false, 'error' => 'Communication not found'];
            }

            $text = strtoupper($comm['subject'] . ' ' . $comm['body_preview']);

            // Classify: JUDICIAL or NON_JUDICIAL
            $classification = $this->classifyAsJudicial($text);

            // Extract data if judicial
            $cnj_number = null;
            $vara = null;
            $comarca = null;
            $has_complete_data = false;

            if ($classification === 'JUDICIAL') {
                $cnj_number = $this->extractCNJNumber($text);
                $vara = $this->extractVara($text);
                $comarca = $this->extractComarca($text);
                $has_complete_data = (!empty($cnj_number) && !empty($vara) && !empty($comarca));
            }

            // Update database
            $update = $this->pdo->prepare('
                UPDATE communications
                SET classification = ?, cnj_number = ?, vara = ?, comarca = ?, has_complete_data = ?
                WHERE id = ?
            ');
            $update->execute([
                $classification,
                $cnj_number,
                $vara,
                $comarca,
                $has_complete_data ? 1 : 0,
                $communication_id
            ]);

            return [
                'success' => true,
                'classification' => $classification,
                'cnj_number' => $cnj_number,
                'vara' => $vara,
                'comarca' => $comarca,
                'has_complete_data' => $has_complete_data
            ];
        } catch (Exception $e) {
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    /**
     * Classify text as JUDICIAL or NON_JUDICIAL
     * Uses comprehensive list of judicial terms from Brazilian court system
     */
    private function classifyAsJudicial($text)
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
     * Extract and validate CNJ number: 0000000-00.0000.0.00.0000
     * Strict validation - must match exact pattern and pass check digits
     */
    private function extractCNJNumber($text)
    {
        // Strict regex: 7 digits - 2 digits . 4 digits . 1 digit . 2 digits . 4 digits
        if (preg_match('/\b(\d{7})-(\d{2})\.(\d{4})\.(\d{1})\.(\d{2})\.(\d{4})\b/', $text, $matches)) {
            $cnj = $matches[0];

            // Validate CNJ structure
            if ($this->isValidCNJ($cnj)) {
                return $cnj;
            }
        }
        return null;
    }

    /**
     * Validate CNJ number: checks format and business rules
     * Format: NNNNNNN-DD.AAAA.J.TT.OOOO
     */
    private function isValidCNJ($cnj)
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
     * Extract VARA (judicial unit)
     * Handles: "VARA ÚNICA", "1ª VARA", "VARA CÍVEL", etc.
     */
    private function extractVara($text)
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
     * Extract COMARCA (judicial district)
     * Also looks for TRIBUNAL location
     */
    private function extractComarca($text)
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
