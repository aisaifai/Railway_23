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
    FOREIGN KEY (department_id) REFERENCES department(department_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (position_id) REFERENCES `position`(position_id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Bảng Account
ALTER TABLE `account` AUTO_INCREMENT = 1;
INSERT INTO `Account`(email, user_name, full_name, department_id, position_id, create_date)
VALUES
		('Email001@gmail.com','Username001','Fullnameee001', 1, 1,'2009-10-18'),
        ('Email02@gmail.com','Username02','Fullnamee02', 2, 2,'2010-10-18'),
        ('Email03@gmail.com','Username03','Dullnameeee03o', 3, 3,'2021-10-18'),
        ('Email04@gmail.com','Username04','Fullnamee04', 4, 4,'2021-10-18'),
        ('Email05@gmail.com','Username05','Fullnamee05', 5, 5,'2021-10-18'),
        ('Email06@gmail.com','Username06','Fullnameee06', 6, 1,'2009-10-19'),
        ('Email07@gmail.com','Username07','Fullname07', 7, 2,'2021-10-19'),
        ('Email08@gmail.com','Username08','Fullnameee08', 8, 3,'2008-10-19'),
        ('Email09@gmail.com','Username09','Fullnameeeee09', 9, 4,'2021-10-19'),
        ('Email010@gmail.com','Username010','Fullnameee010', 10, 5,'2007-10-19'),
        ('Email011@gmail.com','Username011','Fullnameeee011', 3, 3,'2021-10-19'),
        ('Email012@gmail.com','Username012','Fullnameeeee012', 3, 3,'2010-10-19'),
        ('Email00013@gmail.com','Username013','Fullnameee013', 3, 3,'2010-10-19');
        
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`(
	group_id		TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    group_name 		VARCHAR(30) CHAR SET utf8mb4 UNIQUE NOT NULL,
    creator_id		SMALLINT NOT NULL,
    create_date		DATE,
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id) ON DELETE CASCADE ON UPDATE CASCADE
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
    FOREIGN KEY (group_id) REFERENCES `group`(group_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (account_id) REFERENCES `account`(account_id) ON DELETE CASCADE ON UPDATE CASCADE
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
    FOREIGN KEY (category_id) REFERENCES `category_question`(category_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (type_id) REFERENCES `type_question`(type_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Bảng Question
INSERT INTO question(content, category_id, type_id, creator_id, create_date)
VALUES
		('Câu hỏi: 11 x 11 = ?', 1, 1, 1, '2019-10-31'),
        ('Hình tam giác có mấy cạnh?', 1, 1, 2, '2020-10-31'),
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
    FOREIGN KEY (question_id) REFERENCES `question`(question_id) ON DELETE CASCADE ON UPDATE CASCADE
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
	FOREIGN KEY (category_id) REFERENCES `category_question`(category_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id) ON DELETE CASCADE ON UPDATE CASCADE
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
    PRIMARY KEY (exam_id, question_id),
    FOREIGN KEY (exam_id) REFERENCES `exam`(exam_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (question_id) REFERENCES `question`(question_id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Bảng Exam Question
INSERT INTO exam_question(exam_id, question_id)
VALUES
		(1, 1),
        (2, 2),
        (3, 4),
        (4, 4),
        (5, 5),
        (6, 6),
        (7, 7),
        (8, 4),
        (9, 9),
        (10, 10);
        
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT user_name , full_name, d.*
FROM `account` acc
	JOIN department d ON acc.department_id = d.department_id;
    
-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT *
FROM `account`
	WHERE create_date > '2010-12-20';
    
-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT full_name
FROM `account` acc
	INNER JOIN `position` p ON acc.position_id = p.position_id
	WHERE p.position_name = 'Dev';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT department_name
FROM `account` acc
	INNER JOIN department d ON acc.department_id = d.department_id
	GROUP BY acc.department_id
	HAVING COUNT(acc.account_id) > 3;
    
-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT * FROM question;

SELECT q.content, COUNT(eq.exam_id) AS 'SỐ bài thi'
FROM question q
	JOIN exam_question eq ON q.question_id = eq.question_id
    GROUP BY q.question_id
    HAVING COUNT(eq.exam_id) = (
		SELECT MAX(exam_count)
        FROM (
			SELECT COUNT(exam_id) AS exam_count
            FROM exam_question
            GROUP BY question_id
		) AS t1
	);
    
    
-- Question 6: Thông kê mỗi Category Question được sử dụng trong bao nhiêu Question
SELECT cq.category_name, count(q.question_id) AS 'Số lần sử dụng'
FROM category_question cq
	LEFT JOIN question q ON cq.category_id = q.category_id
	GROUP BY cq.category_id;
    
-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT q.question_id, count(eq.exam_id) AS 'Số Exam sử dụng'
	FROM question q JOIN exam_question eq ON q.question_id = eq.question_id
	GROUP BY q.question_id;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
-- SELECT q.content, COUNT(ans.answer_id) AS 'Số câu trả lời'
-- SELECT q.question_id 
SELECT q.content, COUNT(ans.answer_id) AS 'Số câu trả lời'
FROM question q 
	JOIN answer ans ON q.question_id = ans.question_id
	GROUP BY ans.question_id
	HAVING COUNT(ans.answer_id) = (
		SELECT MAX(answer_count) AS 'Số câu trả lời'
        FROM (
			SELECT question_id, COUNT(answer_id) AS answer_count
			FROM answer
			GROUP BY question_id
		) AS t2
	);
    
SELECT * FROM question;
SELECT * FROM answer;

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT g.group_name, COUNT(ga.account_id) AS 'Số lượng Account'
FROM group_account ga
	RIGHT JOIN `group` g ON ga.group_id = g.group_id
	GROUP BY g.group_id;
	

SELECT * FROM `group`;
SELECT * FROM group_account;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT p.position_name, COUNT(acc.position_id) AS 'Số lượng nv ít nhất'
	FROM `position` p 
    LEFT JOIN `account` acc ON  p.position_id = acc.position_id
	GROUP BY p.position_id      
	HAVING COUNT(acc.account_id) = (
		SELECT MIN(count_account) AS 'Số lượng nv ít nhất'
		FROM (
			SELECT p.position_id, COUNT(acc.account_id) AS count_account
			FROM `account` acc
            RIGHT JOIN `position` p ON  p.position_id = acc.position_id
			GROUP BY p.position_id
		) t3
	);
                                    
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT d.department_name, p.position_name, COUNT(acc.account_id) 'Số lượng nv'
	FROM department d 
		LEFT JOIN `account` acc ON d.department_id = acc.department_id
		LEFT JOIN `position` p ON acc.position_id = p.position_id 
		-- WHERE p.position_name IN ('Dev', 'Test', 'Scrum Master','PM')
		GROUP BY d.department_id, p.position_name;
            

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
SELECT q.content, tq.type_name, acc.full_name, ans.content, cq.category_name  
FROM question q 
	LEFT JOIN type_question tq ON q.type_id = tq.type_id
	LEFT JOIN `account` acc ON q.creator_id = acc.account_id 
	LEFT JOIN answer ans ON q.question_id = ans.question_id
    LEFT JOIN category_question cq ON q.category_id = cq.category_id;
    
-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT tq.type_name, COUNT(q.question_id) 'Số câu hỏi' 
FROM type_question tq 
	LEFT JOIN question q ON tq.type_id = q.type_id
	GROUP BY q.type_id;
    
-- Question 14:Lấy ra group không có account nào
SELECT g.group_id, g.group_name 
FROM `group` g 
	LEFT JOIN group_account ga ON g.group_id = ga.group_id
	WHERE ga.group_id IS NULL;
    
-- Question 15: Lấy ra question không có answer nào
SELECT q.* 
FROM question q 
	LEFT JOIN answer ans ON q.question_id = ans.question_id
		WHERE ans.answer_id IS NULL;
        
-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
SELECT acc.user_name, ga.group_id
FROM `account` acc
	JOIN group_account ga ON acc.account_id = ga.account_id
	WHERE ga.group_id = 1;
    
-- Lấy các account thuộc nhóm thứ 2
SELECT acc.user_name, ga.group_id
FROM `account` acc
	JOIN group_account ga ON acc.account_id = ga.account_id
	WHERE ga.group_id = 2;
    
-- Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT acc.user_name, ga.group_id
FROM `account` acc
	JOIN group_account ga ON acc.account_id = ga.account_id
	WHERE ga.group_id = 1
UNION
SELECT acc.user_name, ga.group_id
	FROM `account` acc
	JOIN group_account ga ON acc.account_id = ga.account_id
	WHERE ga.group_id = 2;
    
-- Question 18:
SELECT ga.group_id, COUNT(a.account_id)
FROM group_account ga 
	JOIN `account` a ON ga.account_id = a.account_id
    GROUP BY ga.group_id
    HAVING COUNT(a.account_id) > 5;
    
SELECT ga.group_id, COUNT(a.account_id)
FROM group_account ga 
	LEFT JOIN `account` a ON ga.account_id = a.account_id
    GROUP BY ga.group_id
    HAVING COUNT(a.account_id) < 7;
    
SELECT ga.group_id, COUNT(a.account_id)
FROM group_account ga 
	JOIN `account` a ON ga.account_id = a.account_id
    GROUP BY ga.group_id
    HAVING COUNT(a.account_id) > 5
		UNION ALL
SELECT ga.group_id, COUNT(a.account_id)
FROM group_account ga 
	LEFT JOIN `account` a ON ga.account_id = a.account_id
    GROUP BY ga.group_id
    HAVING COUNT(a.account_id) < 7;
    
    
