<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Services\MicrosoftGraphEmailService;
use App\Services\QwenClassificationService;
use App\Models\Comunicacao;

class ProcessEmails extends Command {
    protected $signature = 'email:process';
    protected $description = 'Processar e-mails não lidos, classificar e gerar respostas';

    public function handle() {
        $this->info('Iniciando processamento de e-mails via Microsoft Graph...');

        $emailService = new MicrosoftGraphEmailService();
        $classificationService = new QwenClassificationService();

        $emails = $emailService->getUnreadEmails(10);

        if (empty($emails)) {
            $this->info('Nenhum e-mail não lido encontrado.');
            return 0;
        }

        foreach ($emails as $email) {
            $this->info("Processando: {$email['subject']}");

            // Classificar
            $classification = $classificationService->classify(
                $email['subject'],
                $email['body']
            );

            // Gerar resposta
            $suggestedResponse = $classificationService->generateResponse(
                $email['subject'],
                $email['body'],
                $classification
            );

            // Salvar na base de dados
            Comunicacao::create([
                'email_from' => $email['from'],
                'email_to' => $email['to'],
                'subject' => $email['subject'],
                'body' => substr($email['body'], 0, 5000),
                'classification' => $classification,
                'suggested_response' => $suggestedResponse,
                'status' => 'pending_response',
            ]);

            // Marcar como lido
            $emailService->markAsRead($email['id']);

            // Mover para pasta
            $emailService->moveToFolder($email['id'], $classification);

            $this->info("✓ Processado: $classification");
        }

        $this->info('Processamento concluído!');
        return 0;
    }
}
