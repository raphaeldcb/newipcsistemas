-- ============================================================================
-- MIGRATION: Add Full Body Column to Communications Table
-- ============================================================================
-- Date: 2026-10-02
-- Purpose: Add full email body storage (LONGTEXT) to ensure complete email content is retained
-- Idempotent: Safe to run multiple times using INFORMATION_SCHEMA checks
-- Reason: bodyPreview only stores truncated preview; full body needed for analysis and archival

-- Use the newipcsistemas database
USE `novos_sistemas_ipc`;

-- ============================================================================
-- HELPER: Add body column if it doesn't exist
-- ============================================================================
DELIMITER //

DROP PROCEDURE IF EXISTS add_body_column //

CREATE PROCEDURE add_body_column()
BEGIN
  DECLARE col_exists INT DEFAULT 0;

  SELECT COUNT(*) INTO col_exists
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = 'novos_sistemas_ipc'
  AND TABLE_NAME = 'communications'
  AND COLUMN_NAME = 'body';

  IF col_exists = 0 THEN
    ALTER TABLE `communications`
    ADD COLUMN `body` LONGTEXT NULL DEFAULT NULL
    COMMENT 'Full email body (not truncated preview) from Microsoft Graph API'
    AFTER `body_preview`;
    SELECT 'Column body added successfully' AS status;
  ELSE
    SELECT 'Column body already exists, skipping' AS status;
  END IF;
END //

-- ============================================================================
-- HELPER: Create index on body (full-text search support)
-- ============================================================================

DROP PROCEDURE IF EXISTS add_body_index //

CREATE PROCEDURE add_body_index()
BEGIN
  DECLARE idx_exists INT DEFAULT 0;

  SELECT COUNT(*) INTO idx_exists
  FROM INFORMATION_SCHEMA.STATISTICS
  WHERE TABLE_SCHEMA = 'novos_sistemas_ipc'
  AND TABLE_NAME = 'communications'
  AND INDEX_NAME = 'idx_body_fulltext';

  IF idx_exists = 0 THEN
    ALTER TABLE `communications`
    ADD FULLTEXT INDEX `idx_body_fulltext` (`body`);
    SELECT 'Full-text index idx_body_fulltext created successfully' AS status;
  ELSE
    SELECT 'Full-text index idx_body_fulltext already exists, skipping' AS status;
  END IF;
END //

DELIMITER ;

-- ============================================================================
-- EXECUTE PROCEDURES
-- ============================================================================

CALL add_body_column();
CALL add_body_index();

-- ============================================================================
-- CLEANUP: Drop helper procedures
-- ============================================================================

DROP PROCEDURE IF EXISTS add_body_column;
DROP PROCEDURE IF EXISTS add_body_index;

-- ============================================================================
-- DONE
-- ============================================================================
-- Migration completed successfully. Full email body column has been added
-- to the communications table in a safe, idempotent manner.
-- Next step: Update MicrosoftGraphService.php to fetch 'body' field from Graph API
