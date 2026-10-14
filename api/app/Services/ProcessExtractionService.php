<?php

namespace App\Services;

class ProcessExtractionService
{
    /**
     * Extrair número do processo no padrão CNJ
     * Formato: 0000000-00.0000.0.00.0000
     */
    public function extractProcessNumber($text)
    {
        if (preg_match('/(\d{7})-(\d{2})\.(\d{4})\.(\d)\.(\d{2})\.(\d{4})/', $text, $matches)) {
            return $matches[0]; // Retorna o número completo
        }
        return null;
    }

    /**
     * Extrair informações do processo do número CNJ
     * Formato: 0000000-00.0000.0.00.0000
     * NNNNNNN-DD.AAAA.J.TT.OOOO
     * N = número sequencial
     * D = dígito verificador
     * A = ano
     * J = segmento (1=judicial)
     * T = tribunal
     * O = origem (comarca/vara)
     */
    public function parseProcessNumber($numberCnj)
    {
        if (!$numberCnj || !preg_match('/(\d{7})-(\d{2})\.(\d{4})\.(\d)\.(\d{2})\.(\d{4})/', $numberCnj, $matches)) {
            return null;
        }

        return [
            'numero_completo' => $matches[0],
            'numero_sequencial' => $matches[1],
            'digito_verificador' => $matches[2],
            'ano' => $matches[3],
            'segmento' => $matches[4],
            'tribunal' => $matches[5],
            'origem' => $matches[6],
        ];
    }

    /**
     * Extrair estado a partir do tribunal (5º e 6º dígito)
     */
    public function getTribunalState($tribunalCode)
    {
        // Mapeamento de tribunais para estados
        $stateMap = [
            '01' => 'AC', '02' => 'AL', '03' => 'AP', '04' => 'AM',
            '05' => 'BA', '06' => 'CE', '07' => 'DF', '08' => 'ES',
            '09' => 'GO', '10' => 'MA', '11' => 'MT', '12' => 'MS',
            '13' => 'MG', '14' => 'PA', '15' => 'PB', '16' => 'PR',
            '17' => 'PE', '18' => 'PI', '19' => 'RJ', '20' => 'RN',
            '21' => 'RS', '22' => 'RO', '23' => 'RR', '24' => 'SC',
            '25' => 'SP', '26' => 'SE', '27' => 'TO',
        ];

        return $stateMap[$tribunalCode] ?? null;
    }

    /**
     * Extrair comarca e vara de qualquer text (subject ou body)
     */
    public function extractCourtInfo($text)
    {
        $info = [];

        // Procurar por padrões como "Vara da" ou "Comarca de"
        if (preg_match('/Vara\s+(?:da|de|das|do|dos)\s+([^,\n]+)/i', $text, $matches)) {
            $info['vara'] = trim($matches[1]);
        }

        if (preg_match('/Comarca\s+(?:da|de|das|do|dos)\s+([^,\n]+)/i', $text, $matches)) {
            $info['comarca'] = trim($matches[1]);
        }

        return $info;
    }

    /**
     * Resposta padrão quando falta número do processo
     */
    public function getMissingProcessResponse()
    {
        return <<<'EOT'
Prezados,

Acusamos o recebimento de sua comunicação e do(s) respectivo(s) anexo(s).

Para garantirmos a celeridade no processamento desta intimação e a rápida distribuição à nossa equipe técnica, solicitamos, por gentileza, que as próximas comunicações ou respostas a este e-mail incluam:

• O número dos Autos no formato padrão do CNJ (ex: 0000000-00.0000.0.00.0000);

• A confirmação de que o nosso CPF/CNPJ já se encontra devidamente cadastrado e habilitado no sistema do tribunal, garantindo nosso acesso à consulta integral dos autos, indispensável para casos que tramitam em Segredo de Justiça.

AVISO DE SISTEMA: A ausência do número processual no formato CNJ ou a impossibilidade de acesso integral aos autos por falta de habilitação impede a triagem automática do nosso sistema de gestão, o que poderá impossibilitar o prosseguimento imediato e ocasionar atrasos no cumprimento dos prazos periciais.

Esta é uma mensagem automática. O e-mail original foi devidamente encaminhado para o nosso departamento administrativo.

Atenciosamente,
Equipe IPC
EOT;
    }
}
