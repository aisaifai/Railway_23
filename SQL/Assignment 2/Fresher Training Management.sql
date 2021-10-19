DROP DATABASE IF EXISTS fresher_training_management;
CREATE DATABASE fresher_training_management;
USE fresher_training_management;

ALTER DATABASE nhanvien CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- question 1
DROP TABLE IF EXISTS trainee;
CREATE TABLE trainee (
	trainee_id			TINYINT AUTO_INCREMENT PRIMARY KEY,
    full_name			VARCHAR(30) CHAR SET utf8mb4 NOT NULL,
    birth_date			DATE,
    gender				ENUM('male', 'female', 'unknown'),
    et_iq				TINYINT CHECK (et_iq >= 0 AND et_iq <= 20),
	et_gmath			TINYINT CHECK (et_gmath >=0 AND et_gmath <= 20),
	et_english			TINYINT CHECK (et_english >= 0 AND et_english <= 50),
	training_class		VARCHAR(20),
    evaluation_notes	VARCHAR(500)
);

-- question 2
ALTER TABLE trainee ADD COLUMN vti_account VARCHAR(20) NOT NULL UNIQUE;

