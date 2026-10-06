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
     */
    private function classifyAsJudicial($text)
    {
        $judicial_keywords = [
            'TRIBUNAL', 'JUIZ', 'SENTENÇA', 'DECISÃO', 'APELAÇÃO', 'AGRAVO',
            'PROCESSO', 'AUTOS', 'VARA', 'COMARCA', 'CNJ', 'INTIMAÇÃO',
            'CARTÓRIO', 'MANDADO', 'PETIÇÃO', 'DESPACHO', 'ACÓRDÃO',
            'RECURSO', 'AUDIÊNCIA', 'CITAÇÃO', 'NOTIFICAÇÃO JUDICIAL',
            'PODER JUDICIÁRIO', 'EXECUÇÃO', 'CUMPRIMENTO SENTENÇA'
        ];

        $non_judicial_keywords = [
            'FATURA', 'NOTA FISCAL', 'COBRANÇA', 'PAGAMENTO', 'BOLETO',
            'VENCIMENTO', 'DÉBITO', 'CRÉDITO', 'BANCO', 'CARTÃO',
            'INTERNET', 'TELEFONE', 'ENERGIA', 'ÁGUA', 'ASSINATURA',
            'PROMOÇÃO', 'OFERTA', 'DESCONTO', 'VENDA', 'COMPRA'
        ];

        $judicial_score = 0;
        $non_judicial_score = 0;

        foreach ($judicial_keywords as $keyword) {
            if (strpos($text, $keyword) !== false) {
                $judicial_score += 2;
            }
        }

        foreach ($non_judicial_keywords as $keyword) {
            if (strpos($text, $keyword) !== false) {
                $non_judicial_score += 1;
            }
        }

        // If no clear classification, return UNKNOWN
        if ($judicial_score == 0 && $non_judicial_score == 0) {
            return 'UNKNOWN';
        }

        return $judicial_score > $non_judicial_score ? 'JUDICIAL' : 'NON_JUDICIAL';
    }

    /**
     * Extract CNJ number: 0000000-00.0000.0.00.0000
     */
    private function extractCNJNumber($text)
    {
        if (preg_match('/\b(\d{7})-(\d{2})\.(\d{4})\.(\d)\.(\d{2})\.(\d{4})\b/', $text, $matches)) {
            return $matches[0];
        }
        return null;
    }

    /**
     * Extract VARA (judicial unit)
     */
    private function extractVara($text)
    {
        $vara_patterns = [
            '/\b(\d+)\.?ª\s+VARA\b/i',
            '/VARA\s+(?:CÍVEL|CRIMINAL|TRABALHISTA|COMERCIAL|FAMÍLIA|FAZENDA)\s+(?:DE|DA|DO)?\s+(\w+)/i',
            '/VARA\s+(\w+)/i'
        ];

        foreach ($vara_patterns as $pattern) {
            if (preg_match($pattern, $text, $matches)) {
                return trim($matches[0]);
            }
        }
        return null;
    }

    /**
     * Extract COMARCA (judicial district)
     */
    private function extractComarca($text)
    {
        $comarca_patterns = [
            '/COMARCA\s+(?:DE|DA|DO)?\s+([A-ZÁÉÍÓÚ\s]+?)(?:\s+[-–]|\n|,|VARA)/i',
            '/FORO\s+(?:DE|DA|DO)?\s+([A-ZÁÉÍÓÚ\s]+?)(?:\s+[-–]|\n|,|VARA)/i',
        ];

        foreach ($comarca_patterns as $pattern) {
            if (preg_match($pattern, $text, $matches)) {
                return trim($matches[1]);
            }
        }
        return null;
    }
}
