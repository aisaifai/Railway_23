DROP DATABASE IF EXISTS testing_system;
CREATE DATABASE testing_system;
USE testing_system;
ALTER DATABASE nhanvien CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
DROP TABLE IF EXISTS department;
CREATE TABLE department(
	department_id		TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    department_name		VARCHAR(30) CHAR SET utf8mb4 NOT NULL UNIQUE
);
-- Bảng Department
INSERT INTO department(department_name) 
VALUES 
		('Marketing' ),
		('Sale' ),
		('Bảo vệ' ),
		('Nhân sự' ),
		('Kỹ thuật' ),
		('Tài chính' ),
		('Phó giám đốc'),
		('Giám đốc' ),
		('Thư kí' ),
		('Bán hàng' );
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`(
	position_id 	TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    position_name	ENUM('Dev', 'Test', 'Scrum Master', 'PM', 'BA')
);
-- Bảng Position
INSERT INTO `position`(position_name)
VALUES
		('Dev'),
        ('Test'),
        ('Scrum Master'),
        ('PM'),
        ('BA');
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`(
	account_id		SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email			VARCHAR(50) UNIQUE NOT NULL,
    user_name		VARCHAR(30) UNIQUE NOT NULL,
    full_name		VARCHAR(30) CHAR SET utf8mb4 UNIQUE NOT NULL,
    department_id	TINYINT NOT NULL,
    position_id		TINYINT NOT NULL,
    create_date		DATE,
    FOREIGN KEY (department_id) REFERENCES department(department_id),
	FOREIGN KEY (position_id) REFERENCES `position`(position_id)
);
-- Bảng Account
INSERT INTO `Account`(email, user_name, full_name, department_id, position_id, create_date)
VALUES
		('Email01@gmail.com','Username01','Fullnameee01', 1, 1,'2021-10-18'),
        ('Email02@gmail.com','Username02','Fullnamee02', 2, 2,'2021-10-18'),
        ('Email03@gmail.com','Username03','Dullnameeee03o', 3, 3,'2021-10-18'),
        ('Email04@gmail.com','Username04','Fullnamee04', 4, 4,'2021-10-18'),
        ('Email05@gmail.com','Username05','Fullnamee05', 5, 5,'2021-10-18'),
        ('Email06@gmail.com','Username06','Fullnameee06', 6, 1,'2021-10-19'),
        ('Email07@gmail.com','Username07','Fullname07', 7, 2,'2021-10-19'),
        ('Email08@gmail.com','Username08','Fullnameee08', 8, 3,'2021-10-19'),
        ('Email09@gmail.com','Username09','Fullnameeeee09', 9, 4,'2021-10-19'),
        ('Email010@gmail.com','Username010','Fullnameee010', 10, 5,'2021-10-19'),
        ('Email011@gmail.com','Username011','Fullnameeee011', 3, 3,'2021-10-19'),
        ('Email012@gmail.com','Username012','Fullnameeeee012', 3, 3,'2021-10-19');
        
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`(
	group_id		TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    group_name 		VARCHAR(30) CHAR SET utf8mb4 UNIQUE NOT NULL,
    creator_id		SMALLINT NOT NULL,
    create_date		DATE,
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);
-- Bảng Group
INSERT INTO `group`(group_name, creator_id, create_date)
VALUES
		('SQL', 1, '2019-10-31'),
        ('JAVA', 2, '2021-10-31'),
        ('JAVASCRIPT', 3, '2020-10-31'),
        ('C', 4, '2021-10-31'),
        ('C#', 5, '2019-10-31'),
        ('C++', 6, '2020-10-31'),
        ('PYTHON', 7, '2021-10-31'),
        ('REACTJS', 8, '2019-10-31'),
        ('HTML/CSS', 9, '2021-10-31'),
        ('RUBY', 10, '2020-10-31');
        
DROP TABLE IF EXISTS group_account;
CREATE TABLE group_account(
	group_id		TINYINT NOT NULL,
    account_id		SMALLINT NOT NULL,
    join_date		DATE,
    PRIMARY KEY (group_id, account_id),
    FOREIGN KEY (group_id) REFERENCES `group`(group_id),
    FOREIGN KEY (account_id) REFERENCES `account`(account_id)
);
-- Bảng Group Account
INSERT INTO group_account
VALUES
		(1, 1, '2019-10-31'),
		(2, 2, '2020-10-31'),
        (3, 3, '2018-10-31'),
        (4, 4, '2019-10-31'),
        (5, 5, '2021-10-31'),
        (6, 6, '2020-10-31'),
        (7, 7, '2019-10-31'),
        (8, 8, '2018-10-31'),
        (9, 9, '2020-10-31'),
        (10, 10, '2019-10-31');
        
DROP TABLE IF EXISTS type_question;
CREATE TABLE type_question(
	type_id		TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type_name	ENUM('Essay','Multiple-Choice') NOT NULL 
);
-- Bảng Type Question
INSERT INTO type_question(type_name)
VALUES
		('Essay'),
        ('Multiple-Choice');
        
DROP TABLE IF EXISTS category_question;
CREATE TABLE category_question(
	category_id		TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category_name	VARCHAR(50) CHAR SET utf8mb4 UNIQUE NOT NULL
);
-- Bảng Category Question
INSERT INTO category_question(category_name)
VALUES
		('Toán số học'),
        ('Toán hình học'),
        ('Lý'),
        ('Hóa'),
        ('Sinh'),
        ('Anh'),
        ('Văn'),
        ('Sử'),
        ('Địa'),
        ('Tin ');
        
DROP TABLE IF EXISTS question;
CREATE TABLE question(
	question_id		TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content 		VARCHAR(250) CHAR SET utf8mb4 UNIQUE NOT NULL,
    category_id		TINYINT NOT NULL,
    type_id			TINYINT NOT NULL,
    creator_id		SMALLINT NOT NULL,
    create_date		DATE,
    FOREIGN KEY (category_id) REFERENCES `category_question`(category_id),
    FOREIGN KEY (type_id) REFERENCES `type_question`(type_id),
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);
-- Bảng Question
INSERT INTO question(content, category_id, type_id, creator_id, create_date)
VALUES
		('Câu hỏi: 11 x 11 = ?', 1, 1, 1, '2019-10-31'),
        ('Hình tam giác có mấy cạnh?', 2, 2, 2, '2020-10-31'),
        ('Nước sôi ở bao nhiêu độ?', 3, 2, 3, '2019-10-31'),
        ('Kí hiệu hóa học của Sắt?', 4, 2, 4, '2020-10-31'),
        ('Trâu bò là động vật ăn gì?', 5, 1, 5, '2018-10-31'),
        ('Câu hỏi: How are you?', 6, 1, 6, '2018-10-31'),
        ('Tác giả của bài thơ Vội Vàng là ai?', 7, 1, 7, '2018-10-31'),
        ('Chiến thắng Điện Biên Phủ vào năm nào?', 8, 2, 8, '2019-10-31'),
        ('Việt Nam nằm ở châu lục nào?', 9, 1, 9, '2021-10-31'),
        ('Câu hỏi: 1Mb = ? Kb', 10, 2, 10, '2020-10-31');
        
DROP TABLE IF EXISTS answer;
CREATE TABLE answer(
	answer_id 		TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content			VARCHAR(100) CHAR SET utf8mb4 NOT NULL,
    question_id		TINYINT NOT NULL,
    is_correct		BOOLEAN,
    FOREIGN KEY (question_id) REFERENCES `question`(question_id)
);
-- Bảng Answer
INSERT INTO answer(content, question_id, is_correct)
VALUES
		('121', 1, 1),
        ('3', 2, 1),
        ('100 độ', 3, 1),
        ('Fe', 4, 1),
        ('Ăn cỏ', 5, 1),
        ('Im fine', 6, 1),
        ('Xuân Diệu', 7, 1),
        ('1945', 8, 1),
        ('Châu Á', 9, 1),
        ('1024Kb', 10, 1),
        ('121', 1, 1),
        ('121', 1, 1),
        ('121', 1, 1),
        ('121', 1, 1);
SELECT * FROM testing_system.answer;

DROP TABLE IF EXISTS exam;
CREATE TABLE exam(
	exam_id			TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `code`			CHAR(10) UNIQUE NOT NULL,
    title			VARCHAR(100) CHAR SET utf8mb4 UNIQUE NOT NULL,
    category_id		TINYINT NOT NULL,
    duration		TINYINT NOT NULL,
    creator_id 		SMALLINT NOT NULL,
    create_date		DATE,
	FOREIGN KEY (category_id) REFERENCES `category_question`(category_id),
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);
-- Bảng Exam
INSERT INTO exam(`code`, title, category_id, duration, creator_id, create_date)
VALUES
		('001', 'Đề thi 001', 1, 45, 1, '2020-10-31'),
        ('002', 'Đề thi 002', 2, 45, 2, '2021-10-31'),
        ('003', 'Đề thi 003', 3, 60, 3, '2019-10-31'),
        ('004', 'Đề thi 004', 4, 90, 4, '2019-10-31'),
        ('005', 'Đề thi 005', 5, 90, 5, '2021-10-31'),
        ('006', 'Đề thi 006', 6, 60, 6, '2020-10-31'),
        ('007', 'Đề thi 007', 7, 15, 7, '2019-10-31'),
        ('008', 'Đề thi 008', 8, 30, 8, '2018-10-31'),
        ('009', 'Đề thi 009', 9, 15, 9, '2020-10-31'),
        ('010', 'Đề thi 010', 10, 30, 10, '2021-10-31');
        
DROP TABLE IF EXISTS exam_question;
CREATE TABLE exam_question(
	exam_id			TINYINT NOT NULL,
    question_id		TINYINT NOT NULL,
    FOREIGN KEY (exam_id) REFERENCES `exam`(exam_id),
    FOREIGN KEY (question_id) REFERENCES `question`(question_id)
);
-- Bảng Exam Question
INSERT INTO exam_question(exam_id, question_id)
VALUES
		(1, 1),
        (2, 2),
        (3, 3),
        (4, 4),
        (5, 5),
        (6, 6),
        (7, 7),
        (8, 8),
        (9, 9),
        (10, 10);
        
-- Question 2:
SELECT * FROM department;

-- Question 3:
SELECT department_id FROM department
WHERE department_name = 'Sale';

-- Question 4:
SELECT * FROM `account` 
WHERE LENGTH(full_name) =
	(SELECT MAX(LENGTH(full_name)) FROM `account`);
    
-- Question 5:
SELECT * FROM `account` 
WHERE LENGTH(full_name) = 
	(SELECT MAX(LENGTH(full_name)) FROM `account`)
    AND department_id =3;

-- Question 6:
SELECT group_name FROM `group`
WHERE create_date < '2019-12-20';

-- Question 7:
SELECT question_id, count(answer_id) as 'Tổng số câu trả lời'
FROM answer
GROUP BY question_id HAVING COUNT(answer_id) >= 4;

-- Question 8:
SELECT `code` FROM exam
WHERE duration >= 60 AND create_date < '2019-12-20';

-- Question 9:
SELECT * FROM `group`
ORDER BY create_date DESC
	LIMIT 5;

-- Question 10:
SELECT department_id, COUNT(account_id) AS SL
FROM `account`
WHERE department_id = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT full_name FROM `account`
WHERE full_name LIKE 'D%o' ;

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM exam 
WHERE create_date < '2019-12-20';

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE FROM `question`
WHERE content LIKE 'Câu hỏi%';

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `account`
SET full_name = 'Nguyễn Bá Lộc',
email = 'loc.nguyenba@vti.com.vn'
WHERE account_id = 5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE group_account SET account_id = 5
WHERE group_id = 4;




    


    
