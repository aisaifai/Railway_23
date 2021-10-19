DROP DATABASE IF EXISTS testing_system;
CREATE DATABASE testing_system;
USE testing_system;
ALTER DATABASE nhanvien CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
DROP TABLE IF EXISTS department;
CREATE TABLE department(
	department_id		TINYINT AUTO_INCREMENT PRIMARY KEY,
    department_name		VARCHAR(30) CHAR SET utf8mb4 NOT NULL
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
	position_id 	TINYINT AUTO_INCREMENT PRIMARY KEY,
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
	account_id		SMALLINT AUTO_INCREMENT PRIMARY KEY,
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
		('Email01@gmail.com','Username01','Fullname01', '1' , '1','2021-10-18'),
        ('Email02@gmail.com','Username02','Fullname02', '2' , '2','2021-10-18'),
        ('Email03@gmail.com','Username03','Fullname03', '3' , '3','2021-10-18'),
        ('Email04@gmail.com','Username04','Fullname04', '4' , '4','2021-10-18'),
        ('Email05@gmail.com','Username05','Fullname05', '5' , '5','2021-10-18'),
        ('Email06@gmail.com','Username06','Fullname06', '6' , '1','2021-10-19'),
        ('Email07@gmail.com','Username07','Fullname07', '7' , '2','2021-10-19'),
        ('Email08@gmail.com','Username08','Fullname08', '8' , '3','2021-10-19'),
        ('Email09@gmail.com','Username09','Fullname09', '9' , '4','2021-10-19'),
        ('Email010@gmail.com','Username010','Fullname010', '10' , '5','2021-10-19');
        
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`(
	group_id		TINYINT AUTO_INCREMENT PRIMARY KEY,
    group_name 		VARCHAR(30) CHAR SET utf8mb4 UNIQUE NOT NULL,
    creator_id		SMALLINT NOT NULL,
    create_date		DATE,
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);
-- Bảng Group
INSERT INTO `group`(group_name, creator_id, create_date)
VALUES
		('SQL', 1, '2021-10-31'),
        ('JAVA', 2, '2021-10-31'),
        ('JAVASCRIPT', 3, '2021-10-31'),
        ('C', 4, '2021-10-31'),
        ('C#', 5, '2021-10-31'),
        ('C++', 6, '2021-10-31'),
        ('PYTHON', 7, '2021-10-31'),
        ('REACTJS', 8, '2021-10-31'),
        ('HTML/CSS', 9, '2021-10-31'),
        ('RUBY', 10, '2021-10-31');
        
DROP TABLE IF EXISTS group_account;
CREATE TABLE group_account(
	group_id		TINYINT NOT NULL,
    account_id		SMALLINT NOT NULL,
    join_date		DATE,
    FOREIGN KEY (group_id) REFERENCES `group`(group_id),
    FOREIGN KEY (account_id) REFERENCES `account`(account_id)
);
-- Bảng Group Account
INSERT INTO group_account
VALUES
		(1, 1, '2021-10-31'),
		(2, 2, '2021-10-31'),
        (3, 3, '2021-10-31'),
        (4, 4, '2021-10-31'),
        (5, 5, '2021-10-31'),
        (6, 6, '2021-10-31'),
        (7, 7, '2021-10-31'),
        (8, 8, '2021-10-31'),
        (9, 9, '2021-10-31'),
        (10, 10, '2021-10-31');
        
DROP TABLE IF EXISTS type_question;
CREATE TABLE type_question(
	type_id		TINYINT AUTO_INCREMENT PRIMARY KEY,
    type_name	ENUM('Essay','Multiple-Choice') UNIQUE NOT NULL 
);
-- Bảng Type Question
INSERT INTO type_question(type_name)
VALUES
		('Essay'),
        ('Multiple-Choice');
        
DROP TABLE IF EXISTS category_question;
CREATE TABLE category_question(
	category_id		TINYINT AUTO_INCREMENT PRIMARY KEY,
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
	question_id		TINYINT AUTO_INCREMENT PRIMARY KEY,
    content 		VARCHAR(100) CHAR SET utf8mb4 UNIQUE NOT NULL,
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
		('11 x 11 = ?', 1, 1, 1, '2021-10-31'),
        ('Hình tam giác có mấy cạnh?', 2, 2, 2, '2021-10-31'),
        ('Nước sôi ở bao nhiêu độ?', 3, 2, 3, '2021-10-31'),
        ('Kí hiệu hóa học của Sắt?', 4, 2, 4, '2021-10-31'),
        ('Trâu bò là động vật ăn gì?', 5, 1, 5, '2021-10-31'),
        ('How are you?', 6, 1, 6, '2021-10-31'),
        ('Tác giả của bài thơ Vội Vàng là ai?', 7, 1, 7, '2021-10-31'),
        ('Chiến thắng Điện Biên Phủ vào năm nào?', 8, 2, 8, '2021-10-31'),
        ('Việt Nam nằm ở châu lục nào?', 9, 1, 9, '2021-10-31'),
        ('1Mb = ? Kb', 10, 2, 10, '2021-10-31');
        
DROP TABLE IF EXISTS answer;
CREATE TABLE answer(
	answer_id 		TINYINT AUTO_INCREMENT PRIMARY KEY,
    content			VARCHAR(100) CHAR SET utf8mb4 UNIQUE NOT NULL,
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
        ('1024Kb', 10, 1);
DROP TABLE IF EXISTS exam;
CREATE TABLE exam(
	exam_id			TINYINT AUTO_INCREMENT PRIMARY KEY,
    `code`			CHAR(10) NOT NULL,
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
		(001, 'Đề thi 001', 1, 5, 1, '2021-10-31'),
        (001, 'Đề thi 002', 2, 5, 2, '2021-10-31'),
        (001, 'Đề thi 003', 3, 5, 3, '2021-10-31'),
        (001, 'Đề thi 004', 4, 5, 4, '2021-10-31'),
        (001, 'Đề thi 005', 5, 5, 5, '2021-10-31'),
        (001, 'Đề thi 006', 6, 5, 6, '2021-10-31'),
        (001, 'Đề thi 007', 7, 5, 7, '2021-10-31'),
        (001, 'Đề thi 008', 8, 5, 8, '2021-10-31'),
        (001, 'Đề thi 009', 9, 5, 9, '2021-10-31'),
        (001, 'Đề thi 010', 10, 5, 10, '2021-10-31');
        
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
        




    


    
