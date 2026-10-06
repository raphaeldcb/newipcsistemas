<?php
/**
 * Communication Model
 * Represents a synced email/communication
 */

class Communication
{
    private $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    /**
     * Save or update a communication
     */
    public function save($data)
    {
        $check = $this->pdo->prepare(
            'SELECT id FROM communications WHERE message_id = ?'
        );
        $check->execute([$data['message_id']]);
        $existing = $check->fetch();

        if ($existing) {
            // Update
            $this->pdo->prepare(
                'UPDATE communications SET subject = ?, body_preview = ?, body = ?, from_address = ?,
                 from_name = ?, received_datetime = ?, has_attachments = ?,
                 attachment_count = ?, status = ?, updated_at = NOW()
                 WHERE id = ?'
            )->execute([
                $data['subject'] ?? null,
                $data['body_preview'] ?? null,
                $data['body'] ?? null,
                $data['from_address'] ?? null,
                $data['from_name'] ?? null,
                $data['received_datetime'] ?? null,
                $data['has_attachments'] ?? false,
                $data['attachment_count'] ?? 0,
                'processed',
                $existing['id'],
            ]);
            return $existing['id'];
        } else {
            // Insert
            $this->pdo->prepare(
                'INSERT INTO communications
                (message_id, conversation_id, subject, body_preview, body, from_address, from_name,
                 received_datetime, has_attachments, attachment_count, status, synced_at)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())'
            )->execute([
                $data['message_id'],
                $data['conversation_id'] ?? null,
                $data['subject'] ?? null,
                $data['body_preview'] ?? null,
                $data['body'] ?? null,
                $data['from_address'] ?? null,
                $data['from_name'] ?? null,
                $data['received_datetime'] ?? null,
                $data['has_attachments'] ?? false,
                $data['attachment_count'] ?? 0,
                'new',
            ]);
            return $this->pdo->lastInsertId();
        }
    }

    /**
     * Get all communications with optional filters
     * Includes new fields: confidence, reasoning, extracted_at, body
     */
    public function getAll($filters = [])
    {
        // Explicit select including new classification fields and full body
        $query = 'SELECT id, message_id, conversation_id, subject, body_preview, body,
                         from_address, from_name, to_addresses, cc_addresses, bcc_addresses,
                         received_datetime, vara, comarca, processo_numero, pedido,
                         has_attachments, attachment_count, status, classification,
                         processed_at, processing_notes, is_duplicate, duplicate_of_id,
                         user_corrected, correction_notes, synced_at, created_at, updated_at,
                         confidence, reasoning, extracted_at
                  FROM communications WHERE 1=1';
        $params = [];

        if (!empty($filters['status'])) {
            $query .= ' AND status = ?';
            $params[] = $filters['status'];
        }

        if (!empty($filters['vara'])) {
            $query .= ' AND vara LIKE ?';
            $params[] = '%' . $filters['vara'] . '%';
        }

        if (!empty($filters['processo'])) {
            $query .= ' AND processo_numero LIKE ?';
            $params[] = '%' . $filters['processo'] . '%';
        }

        if (!empty($filters['search'])) {
            $query .= ' AND (subject LIKE ? OR from_address LIKE ?)';
            $search = '%' . $filters['search'] . '%';
            $params[] = $search;
            $params[] = $search;
        }

        $query .= ' ORDER BY received_datetime DESC LIMIT 100';

        $stmt = $this->pdo->prepare($query);
        $stmt->execute($params);
        return $stmt->fetchAll();
    }

    /**
     * Get communication by ID
     * Includes new fields: confidence, reasoning, extracted_at, body
     */
    public function getById($id)
    {
        $query = 'SELECT id, message_id, conversation_id, subject, body_preview, body,
                         from_address, from_name, to_addresses, cc_addresses, bcc_addresses,
                         received_datetime, vara, comarca, processo_numero, pedido,
                         has_attachments, attachment_count, status, classification,
                         processed_at, processing_notes, is_duplicate, duplicate_of_id,
                         user_corrected, correction_notes, synced_at, created_at, updated_at,
                         confidence, reasoning, extracted_at
                  FROM communications WHERE id = ?';
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    /**
     * Get communication by message ID
     * Includes new fields: confidence, reasoning, extracted_at, body
     */
    public function getByMessageId($message_id)
    {
        $query = 'SELECT id, message_id, conversation_id, subject, body_preview, body,
                         from_address, from_name, to_addresses, cc_addresses, bcc_addresses,
                         received_datetime, vara, comarca, processo_numero, pedido,
                         has_attachments, attachment_count, status, classification,
                         processed_at, processing_notes, is_duplicate, duplicate_of_id,
                         user_corrected, correction_notes, synced_at, created_at, updated_at,
                         confidence, reasoning, extracted_at
                  FROM communications WHERE message_id = ?';
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([$message_id]);
        return $stmt->fetch();
    }

    /**
     * Update communication status
     */
    public function updateStatus($id, $status, $notes = null)
    {
        $this->pdo->prepare(
            'UPDATE communications SET status = ?, processing_notes = ?,
             processed_at = CASE WHEN status != ? THEN NOW() ELSE processed_at END,
             updated_at = NOW()
             WHERE id = ?'
        )->execute([$status, $notes, 'new', $id]);
    }

    /**
     * Update extracted information
     */
    public function updateExtracted($id, $data)
    {
        $this->pdo->prepare(
            'UPDATE communications SET vara = ?, comarca = ?, processo_numero = ?,
             pedido = ?, classification = ?, user_corrected = FALSE, updated_at = NOW()
             WHERE id = ?'
        )->execute([
            $data['vara'] ?? null,
            $data['comarca'] ?? null,
            $data['processo'] ?? null,
            $data['pedido'] ?? null,
            $data['classification'] ?? null,
            $id,
        ]);
    }

    /**
     * Mark as duplicate
     */
    public function markDuplicate($id, $duplicate_of_id)
    {
        $this->pdo->prepare(
            'UPDATE communications SET is_duplicate = TRUE, duplicate_of_id = ?,
             status = ?, updated_at = NOW() WHERE id = ?'
        )->execute([$duplicate_of_id, 'archived', $id]);
    }

    /**
     * Get statistics
     */
    public function getStats()
    {
        $stats = [];

        // Total
        $stmt = $this->pdo->query('SELECT COUNT(*) as total FROM communications');
        $stats['total'] = $stmt->fetch()['total'];

        // By status
        $stmt = $this->pdo->query(
            'SELECT status, COUNT(*) as count FROM communications GROUP BY status'
        );
        $stats['by_status'] = [];
        foreach ($stmt->fetchAll() as $row) {
            $stats['by_status'][$row['status']] = $row['count'];
        }

        // With attachments
        $stmt = $this->pdo->query(
            'SELECT COUNT(*) as total FROM communications WHERE has_attachments = TRUE'
        );
        $stats['with_attachments'] = $stmt->fetch()['total'];

        // Duplicates
        $stmt = $this->pdo->query(
            'SELECT COUNT(*) as total FROM communications WHERE is_duplicate = TRUE'
        );
        $stats['duplicates'] = $stmt->fetch()['total'];

        return $stats;
    }
}
