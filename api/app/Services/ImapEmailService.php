<?php

namespace App\Services;

use Illuminate\Support\Facades\Log;

class ImapEmailService {
    private $mailbox;
    private $host;
    private $email;
    private $password;

    public function __construct() {
        $this->host = env('EMAIL_HOST', 'imap.gmail.com');
        $this->email = env('EMAIL_FROM_ADDRESS', 'financeira@ipcms.com.br');
        $this->password = env('EMAIL_PASSWORD', '');
        $this->mailbox = "{" . $this->host . ":993/imap/ssl}" . "INBOX";
    }

    public function connect() {
        try {
            $connection = imap_open($this->mailbox, $this->email, $this->password);
            if (!$connection) {
                Log::error('Falha ao conectar IMAP: ' . imap_last_error());
                return false;
            }
            return $connection;
        } catch (\Exception $e) {
            Log::error('Erro na conexão IMAP: ' . $e->getMessage());
            return false;
        }
    }

    public function getUnreadEmails($limit = 10) {
        $mbox = $this->connect();
        if (!$mbox) return [];

        try {
            $emails = imap_search($mbox, 'UNSEEN');
            if ($emails === false) return [];

            $emails = array_reverse($emails);
            $emails = array_slice($emails, 0, $limit);

            $messages = [];
            foreach ($emails as $email_number) {
                $overview = imap_fetch_overview($mbox, $email_number, 0);
                $body = imap_fetchbody($mbox, $email_number, "1");

                $messages[] = [
                    'number' => $email_number,
                    'from' => $overview[0]->from ?? '',
                    'to' => $overview[0]->to ?? '',
                    'subject' => $overview[0]->subject ?? '',
                    'body' => quoted_printable_decode($body),
                    'date' => $overview[0]->date ?? '',
                    'uid' => $overview[0]->uid ?? '',
                ];
            }

            imap_close($mbox);
            return $messages;
        } catch (\Exception $e) {
            Log::error('Erro ao buscar e-mails: ' . $e->getMessage());
            return [];
        }
    }

    public function markAsRead($email_number) {
        $mbox = $this->connect();
        if (!$mbox) return false;

        try {
            imap_mail_move($mbox, $email_number, "INBOX.Lido");
            imap_expunge($mbox);
            imap_close($mbox);
            return true;
        } catch (\Exception $e) {
            Log::error('Erro ao marcar como lido: ' . $e->getMessage());
            return false;
        }
    }

    public function addLabel($email_number, $label) {
        $mbox = $this->connect();
        if (!$mbox) return false;

        try {
            imap_mail_move($mbox, $email_number, "INBOX." . $label);
            imap_expunge($mbox);
            imap_close($mbox);
            return true;
        } catch (\Exception $e) {
            Log::error('Erro ao adicionar label: ' . $e->getMessage());
            return false;
        }
    }

    public function sendReply($email_address, $subject, $body) {
        try {
            $headers = "From: " . $this->email . "\r\n";
            $headers .= "Reply-To: " . $this->email . "\r\n";
            $headers .= "Content-Type: text/plain; charset=UTF-8\r\n";

            mail($email_address, "Re: " . $subject, $body, $headers);
            return true;
        } catch (\Exception $e) {
            Log::error('Erro ao enviar resposta: ' . $e->getMessage());
            return false;
        }
    }
}
