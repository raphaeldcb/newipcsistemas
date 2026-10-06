<?php
/**
 * Database Body Column Test
 *
 * Verifies that the communications table has a body column (LONGTEXT)
 * and can store full email bodies (not just truncated previews)
 */

use PHPUnit\Framework\TestCase;

class DatabaseBodyColumnTest extends TestCase
{
    private $pdo;
    private $connection;

    protected function setUp(): void
    {
        // Load database configuration
        require_once __DIR__ . '/../html/config/database.php';

        try {
            $this->pdo = new PDO(
                "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME,
                DB_USER,
                DB_PASSWORD,
                [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                ]
            );
        } catch (PDOException $e) {
            $this->markTestSkipped("Database connection failed: " . $e->getMessage());
        }
    }

    /**
     * Test that body column exists in communications table
     */
    public function testBodyColumnExists()
    {
        $stmt = $this->pdo->prepare(
            "SELECT COLUMN_NAME, COLUMN_TYPE
             FROM INFORMATION_SCHEMA.COLUMNS
             WHERE TABLE_SCHEMA = ?
             AND TABLE_NAME = 'communications'
             AND COLUMN_NAME = 'body'"
        );
        $stmt->execute([DB_NAME]);
        $result = $stmt->fetch();

        $this->assertIsArray($result, "body column does not exist in communications table");
        $this->assertNotEmpty($result, "body column not found");
        $this->assertStringContainsString(
            'LONGTEXT',
            $result['COLUMN_TYPE'],
            "body column should be LONGTEXT type, got: " . $result['COLUMN_TYPE']
        );
    }

    /**
     * Test that body_preview column still exists
     */
    public function testBodyPreviewColumnExists()
    {
        $stmt = $this->pdo->prepare(
            "SELECT COLUMN_NAME, COLUMN_TYPE
             FROM INFORMATION_SCHEMA.COLUMNS
             WHERE TABLE_SCHEMA = ?
             AND TABLE_NAME = 'communications'
             AND COLUMN_NAME = 'body_preview'"
        );
        $stmt->execute([DB_NAME]);
        $result = $stmt->fetch();

        $this->assertIsArray($result, "body_preview column does not exist");
        $this->assertNotEmpty($result, "body_preview column not found");
    }

    /**
     * Test that full body can be stored and retrieved
     */
    public function testFullBodyPersistence()
    {
        // Generate a 50KB email body
        $long_body = str_repeat(
            "Este é um email muito longo para teste de armazenamento de corpo completo. " .
            "Este conteúdo representa um email real que pode ter assinaturas, histórico de respostas, " .
            "e todo o conteúdo original que não cabe em um bodyPreview truncado. " .
            "A linha a seguir será repetida 500 vezes para criar 50KB de dados.\n",
            500
        );

        $short_preview = "Este é um email muito longo para teste de armazenamento...";
        $message_id = "test_msg_" . time() . "_" . uniqid();

        try {
            // Insert test communication with full body
            $insert = $this->pdo->prepare(
                "INSERT INTO communications
                (message_id, subject, body_preview, body, from_address, from_name,
                 received_datetime, status, synced_at)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())"
            );

            $insert->execute([
                $message_id,
                "Test Email with Long Body",
                $short_preview,
                $long_body,
                "sender@example.com",
                "Sender Name",
                date("Y-m-d H:i:s"),
                "new",
            ]);

            $inserted_id = $this->pdo->lastInsertId();
            $this->assertGreaterThan(0, $inserted_id, "Failed to insert test communication");

            // Retrieve and verify
            $select = $this->pdo->prepare(
                "SELECT body, body_preview, CHARACTER_LENGTH(body) as body_length
                 FROM communications WHERE message_id = ?"
            );
            $select->execute([$message_id]);
            $result = $select->fetch();

            $this->assertIsArray($result, "Failed to retrieve stored communication");
            $this->assertNotNull($result['body'], "body field is null after insert");
            $this->assertEquals(
                strlen($long_body),
                $result['body_length'],
                "body length mismatch: stored " . $result['body_length'] . " bytes, expected " . strlen($long_body)
            );
            $this->assertEquals(
                $long_body,
                $result['body'],
                "Retrieved body does not match inserted body"
            );
            $this->assertEquals(
                $short_preview,
                $result['body_preview'],
                "body_preview should remain separate from body"
            );

        } finally {
            // Cleanup: remove test record
            $this->pdo->prepare("DELETE FROM communications WHERE message_id = ?")
                ->execute([$message_id]);
        }
    }

    /**
     * Test that full-text index on body exists
     */
    public function testBodyFullTextIndexExists()
    {
        $stmt = $this->pdo->prepare(
            "SELECT INDEX_NAME
             FROM INFORMATION_SCHEMA.STATISTICS
             WHERE TABLE_SCHEMA = ?
             AND TABLE_NAME = 'communications'
             AND INDEX_NAME = 'idx_body_fulltext'"
        );
        $stmt->execute([DB_NAME]);
        $result = $stmt->fetch();

        $this->assertIsArray($result, "Full-text index idx_body_fulltext does not exist");
        $this->assertNotEmpty($result, "Full-text index not found");
    }

    /**
     * Test that body can be NULL
     */
    public function testBodyCanBeNull()
    {
        $message_id = "test_msg_null_" . time() . "_" . uniqid();

        try {
            // Insert with NULL body
            $insert = $this->pdo->prepare(
                "INSERT INTO communications
                (message_id, subject, body_preview, body, from_address, from_name,
                 received_datetime, status, synced_at)
                VALUES (?, ?, ?, NULL, ?, ?, ?, ?, NOW())"
            );

            $insert->execute([
                $message_id,
                "Test Email",
                "Preview",
                "sender@example.com",
                "Sender Name",
                date("Y-m-d H:i:s"),
                "new",
            ]);

            // Verify
            $select = $this->pdo->prepare(
                "SELECT body FROM communications WHERE message_id = ?"
            );
            $select->execute([$message_id]);
            $result = $select->fetch();

            $this->assertIsArray($result, "Failed to retrieve record with NULL body");
            $this->assertNull($result['body'], "body should be NULL when not provided");

        } finally {
            $this->pdo->prepare("DELETE FROM communications WHERE message_id = ?")
                ->execute([$message_id]);
        }
    }

    /**
     * Test that UPDATE query includes body column
     */
    public function testBodyUpdateCapability()
    {
        $message_id = "test_msg_update_" . time() . "_" . uniqid();
        $original_body = "Original email body content";
        $updated_body = "Updated email body content with more information";

        try {
            // Insert
            $insert = $this->pdo->prepare(
                "INSERT INTO communications
                (message_id, subject, body_preview, body, from_address, from_name,
                 received_datetime, status, synced_at)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())"
            );

            $insert->execute([
                $message_id,
                "Test Email",
                "Preview",
                $original_body,
                "sender@example.com",
                "Sender Name",
                date("Y-m-d H:i:s"),
                "new",
            ]);

            // Update body
            $update = $this->pdo->prepare(
                "UPDATE communications SET body = ? WHERE message_id = ?"
            );
            $update->execute([$updated_body, $message_id]);

            // Verify
            $select = $this->pdo->prepare(
                "SELECT body FROM communications WHERE message_id = ?"
            );
            $select->execute([$message_id]);
            $result = $select->fetch();

            $this->assertEquals(
                $updated_body,
                $result['body'],
                "body was not updated correctly"
            );

        } finally {
            $this->pdo->prepare("DELETE FROM communications WHERE message_id = ?")
                ->execute([$message_id]);
        }
    }
}
