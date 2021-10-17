CREATE DATABASE fresher_training_management;
USE fresher_training_management;

-- question 1
CREATE TABLE Trainee (
	trainee_id			INT,
    full_name			VARCHAR(50),
    birth_date			DATE,
    gender				ENUM('male', 'female', 'unknown') NOT NULL,
    et_iq				INT,
						CHECK (et_iq <= 20),
	et_gmath			INT,
						CHECK (et_gmath <= 20),
	et_english			INT,
						CHECK (et_english <= 50),
	training_class		VARCHAR(20),
    evaluation_notes	VARCHAR(500)
);

-- question 2
ALTER TABLE Trainee ADD COLUMN vti_account SMALLINT UNSIGNED UNIQUE NOT NULL;
