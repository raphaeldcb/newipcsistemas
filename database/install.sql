-- Novos Sistemas IPC - Database Installation Script
-- MySQL 8.3.0
-- Run with: mysql -u root -p < database/install.sql

-- ============================================================================
-- CREATE DATABASE
-- ============================================================================
DROP DATABASE IF EXISTS `novos_sistemas_ipc`;
CREATE DATABASE `novos_sistemas_ipc`
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE `novos_sistemas_ipc`;

-- ============================================================================
-- USERS TABLE (Authentication)
-- ============================================================================
CREATE TABLE `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `password_hash` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `role` ENUM('admin', 'user', 'viewer') DEFAULT 'user',
  `active` BOOLEAN DEFAULT TRUE,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login` DATETIME,
  INDEX idx_email (email),
  INDEX idx_active (active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- COMMUNICATIONS TABLE (Main emails/messages)
-- ============================================================================
CREATE TABLE `communications` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `message_id` VARCHAR(500) NOT NULL UNIQUE COMMENT 'Microsoft Graph Message ID',
  `conversation_id` VARCHAR(500) COMMENT 'Microsoft Graph Conversation ID',

  -- Message Info
  `subject` TEXT,
  `body_preview` TEXT,
  `from_address` VARCHAR(255),
  `from_name` VARCHAR(255),
  `to_addresses` JSON COMMENT 'Array of recipient addresses',
  `cc_addresses` JSON,
  `bcc_addresses` JSON,
  `received_datetime` DATETIME,

  -- Extraction/Classification
  `vara` VARCHAR(255) COMMENT 'Court/Vara extracted or classified',
  `comarca` VARCHAR(255) COMMENT 'Region/Comarca extracted',
  `processo_numero` VARCHAR(255) COMMENT 'Process number extracted',
  `pedido` TEXT COMMENT 'Request/petition content',
  `has_attachments` BOOLEAN DEFAULT FALSE,
  `attachment_count` INT DEFAULT 0,

  -- Processing Status
  `status` ENUM('new', 'processing', 'processed', 'error', 'archived') DEFAULT 'new',
  `classification` VARCHAR(100) COMMENT 'Type of message (judicial, administrative, etc)',
  `processed_at` DATETIME,
  `processing_notes` TEXT,

  -- Tracking
  `is_duplicate` BOOLEAN DEFAULT FALSE,
  `duplicate_of_id` INT COMMENT 'FK to original if duplicate',
  `user_corrected` BOOLEAN DEFAULT FALSE COMMENT 'User made corrections',
  `correction_notes` TEXT,

  -- Timestamps
  `synced_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  -- Indexes for performance
  INDEX idx_message_id (message_id),
  INDEX idx_status (status),
  INDEX idx_processo (processo_numero),
  INDEX idx_received (received_datetime),
  INDEX idx_vara (vara),
  INDEX idx_comarca (comarca),
  INDEX idx_created (created_at),
  INDEX idx_duplicate (is_duplicate),

  -- Foreign Keys
  FOREIGN KEY (duplicate_of_id) REFERENCES communications(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- COMMUNICATION ATTACHMENTS
-- ============================================================================
CREATE TABLE `communication_attachments` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `communication_id` INT NOT NULL,
  `filename` VARCHAR(500),
  `content_type` VARCHAR(100),
  `size` INT,
  `attachment_id` VARCHAR(500) COMMENT 'Microsoft Graph Attachment ID',
  `downloaded` BOOLEAN DEFAULT FALSE,
  `stored_path` VARCHAR(500) COMMENT 'Local storage path if downloaded',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (communication_id) REFERENCES communications(id) ON DELETE CASCADE,
  INDEX idx_communication (communication_id),
  INDEX idx_downloaded (downloaded)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- COMMUNICATION RESPONSES/TEMPLATES
-- ============================================================================
CREATE TABLE `response_templates` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `subject_template` VARCHAR(500),
  `body_template` TEXT,
  `variables` JSON COMMENT 'Variables like {vara}, {processo}, etc',
  `active` BOOLEAN DEFAULT TRUE,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  INDEX idx_active (active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- COMMUNICATION RESPONSES (Sent responses)
-- ============================================================================
CREATE TABLE `communication_responses` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `communication_id` INT NOT NULL,
  `template_id` INT,
  `subject` VARCHAR(500),
  `body` TEXT,
  `sent_to` VARCHAR(255),
  `sent_at` DATETIME,
  `status` ENUM('draft', 'sent', 'failed') DEFAULT 'draft',
  `error_message` TEXT,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (communication_id) REFERENCES communications(id) ON DELETE CASCADE,
  FOREIGN KEY (template_id) REFERENCES response_templates(id) ON DELETE SET NULL,
  INDEX idx_communication (communication_id),
  INDEX idx_status (status),
  INDEX idx_sent (sent_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- SYNC CONTROL (Track Microsoft Graph sync)
-- ============================================================================
CREATE TABLE `sync_control` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `resource` VARCHAR(100) NOT NULL UNIQUE COMMENT 'e.g., messages, folders',
  `last_sync_token` VARCHAR(500) COMMENT 'Microsoft delta sync token',
  `last_sync_at` DATETIME,
  `sync_interval_minutes` INT DEFAULT 5,
  `enabled` BOOLEAN DEFAULT TRUE,
  `error_count` INT DEFAULT 0,
  `last_error` TEXT,

  INDEX idx_resource (resource)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- PROCESSING LOG (Audit trail)
-- ============================================================================
CREATE TABLE `processing_log` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `communication_id` INT,
  `action` VARCHAR(100) COMMENT 'extracted, classified, responded, corrected, etc',
  `details` JSON,
  `user_id` INT,
  `ip_address` VARCHAR(45),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (communication_id) REFERENCES communications(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
  INDEX idx_communication (communication_id),
  INDEX idx_action (action),
  INDEX idx_created (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- INITIAL DATA
-- ============================================================================

-- Insert default admin user (password: admin123)
INSERT INTO `users` (email, password_hash, name, role, active) VALUES
('admin@ipcms.com.br', '$2y$10$sOqiAF3IX9OhhcE4b6GdHON4A7IttnxKZCWCuXBwyNgxm4FSCbobW', 'Administrator', 'admin', TRUE);

-- Insert default response templates
INSERT INTO `response_templates` (name, description, subject_template, body_template, variables, active) VALUES
('Confirmação de Recebimento', 'Confirma recebimento de processo', 'Re: {subject}', 'Confirmamos recebimento do processo {processo_numero} para a Vara de {vara}.\n\nAtt,\nIPC Perícias', '["subject", "processo_numero", "vara"]', TRUE);

-- Initialize sync control
INSERT INTO `sync_control` (resource, enabled, sync_interval_minutes) VALUES
('messages', TRUE, 5),
('folders', TRUE, 15);

-- ============================================================================
-- DONE
-- ============================================================================
