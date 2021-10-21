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
    gender				ENUM('male', 'female', 'unknown') NOT NULL,
    et_iq				TINYINT CHECK (et_iq >= 0 AND et_iq <= 20),
	et_gmath			TINYINT CHECK (et_gmath >=0 AND et_gmath <= 20),
	et_english			TINYINT CHECK (et_english >= 0 AND et_english <= 50),
	training_class		VARCHAR(20),
    evaluation_notes	VARCHAR(500)
);

-- question 2
ALTER TABLE trainee ADD COLUMN vti_account VARCHAR(20) NOT NULL UNIQUE;

-- Extra 3
-- Question 1: Thêm data
INSERT INTO trainee (full_name, birth_date, gender, et_iq, et_gmath, et_english, training_class, evaluation_notes, vti_account)
VALUE 				
		('Nguyễn Văn Dương', '2000-04-20', 'male', 19, 20, 20, 'VTI001', 'Very good', 'duong000'),
		('Nguyễn Đình Bảo',  '1999-06-09', 'male', 14, 16, 16, 'VTI002', 'Normal', 'bao357'),
		('Vũ Thu Hương',  '1998-06-15', 'female', 11, 17, 10, 'VTI003', 'Normal', 'huong002'),
		('Võ Ngọc Ngân',  '2001-09-24', 'male',	17, 12, 20, 'VTI004', 'Good', 'ngocngan03'),
		('Trần Tuấn Anh',  '1993-08-25', 'male', 16, 15, 16, 'VTI005', 'Normal', 'mintese'),
		('Nguyễn Trí Dũng',  '1994-09-08', 'male', 20, 10, 19, 'VTI006', 'Very Good','dung007'),
		('Nguyễn Trí Minh',  '2001-10-31', 'male', 19, 16, 12, 'VTI007', 'Normal','minhminh69'),
		('Tống Minh Tâm',  '2000-01-12', 'female', 17, 20, 19, 'VTI008', 'Good','tamtamtam'),
		('Nguyễn Thị Hào',  '1995-02-13', 'unknown', 20, 19, 20, 'VTI009', 'Very Good',	'haongoo'),
		('Dương Thu Trang',  '1996-07-13', 'female', 18, 19, 15, 'VTI010', 'Normal', 'trangxjnk');

-- Question 2:  Query all the trainees who is passed the entry test, group them into different birth months
SELECT GROUP_CONCAT(full_name), MONTH(birth_date) FROM trainee
GROUP BY MONTH(birth_date);

-- Question 3: Query the trainee who has the longest name, showing his/her age along with his/her basic information (as defined in the table)
SELECT * FROM trainee 
WHERE LENGTH(full_name) =
	(SELECT MAX(LENGTH(full_name)) FROM `trainee`);
    
-- Question 4: Query all the ET-passed trainees. One trainee is considered as ET-passed
-- when he/she has the entry test points satisfied below criteria:
--  ET_IQ + ET_Gmath>=20
--  ET_IQ>=8
--  ET_Gmath>=8
--  ET_English>=18
SELECT * FROM trainee
WHERE et_iq + et_gmath >=20 AND et_iq >= 8 AND et_gmath >= 8 AND et_english >= 18;

-- Question 5: delete information of trainee who has TraineeID = 3
DELETE FROM trainee WHERE trainee_id = 3; 

-- Question 6: trainee who has TraineeID = 5 move "2" class. Let update information into database
UPDATE trainee 
SET training_class = 'VTI002' 
WHERE trainee_id = 5;