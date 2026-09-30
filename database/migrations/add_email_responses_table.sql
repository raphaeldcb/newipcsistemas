-- Add email_responses table for scheduled email responses
CREATE TABLE IF NOT EXISTS email_responses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    communication_id INT NOT NULL,
    to_email VARCHAR(255) NOT NULL,
    subject VARCHAR(500) NOT NULL,
    body LONGTEXT NOT NULL,
    scheduled_date DATE NOT NULL,
    scheduled_time TIME NOT NULL,
    status ENUM('scheduled', 'sent', 'failed') DEFAULT 'scheduled',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sent_at TIMESTAMP NULL,
    error_message TEXT NULL,
    FOREIGN KEY (communication_id) REFERENCES communications(id) ON DELETE CASCADE,
    INDEX idx_status (status),
    INDEX idx_scheduled_date (scheduled_date, scheduled_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Add graph_message_id column to communications table if it doesn't exist
ALTER TABLE communications
ADD COLUMN graph_message_id VARCHAR(500) NULL AFTER id,
ADD COLUMN analyzed_at TIMESTAMP NULL AFTER created_at,
ADD INDEX idx_analyzed_at (analyzed_at),
ADD INDEX idx_graph_message_id (graph_message_id);
