-- Criar tabelas faltando — versão SEM foreign keys (para banco existente)

-- 1. tb_ufs (Estados)
CREATE TABLE IF NOT EXISTS `tb_ufs` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `uf_sigla` CHAR(2) UNIQUE NOT NULL,
  `uf_nome` VARCHAR(50) NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. tb_comarcas (Comarcas)
CREATE TABLE IF NOT EXISTS `tb_comarcas` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `comarca_nome` VARCHAR(100) NOT NULL,
  `uf_id` INT UNSIGNED,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. tb_juizes (Juízes)
CREATE TABLE IF NOT EXISTS `tb_juizes` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `juiz_nome` VARCHAR(100) NOT NULL,
  `vara_id` INT UNSIGNED,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. tb_extracos (Extrações)
CREATE TABLE IF NOT EXISTS `tb_extracos` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `caso_id` INT UNSIGNED,
  `extracao_fase` VARCHAR(50),
  `resultado` LONGTEXT,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. tb_scei (SCEI - Laboratório)
CREATE TABLE IF NOT EXISTS `tb_scei` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `caso_id` INT UNSIGNED,
  `exame_tipo` VARCHAR(100),
  `resultado` LONGTEXT,
  `data_exame` DATE,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6. comunicacoes (Comunicações - Email)
CREATE TABLE IF NOT EXISTS `comunicacoes` (
  `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `email_from` VARCHAR(191) NOT NULL,
  `email_to` VARCHAR(191) NOT NULL,
  `subject` VARCHAR(255) NOT NULL,
  `body` LONGTEXT,
  `classification` VARCHAR(50),
  `confidence` DECIMAL(3,2),
  `caso_id` INT UNSIGNED,
  `classified_at` TIMESTAMP NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  INDEX `comunicacoes_email_from_index` (`email_from`(191)),
  INDEX `comunicacoes_email_to_index` (`email_to`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ✅ Pronto!
SELECT 'Tabelas criadas com sucesso!' as status;
