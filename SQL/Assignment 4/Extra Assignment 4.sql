DROP DATABASE IF EXISTS DB_Extra_4;
CREATE DATABASE DB_Extra_4;
USE	DB_Extra_4;

ALTER DATABASE nhanvien CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- TẠO BẢNG DỮ LIỆU (Q1)
-- Department (Department_Number, Department_Name)
-- Employee_Table (Employee_Number, Employee_Name, Department_Number)
-- Employee_Skill_Table (Employee_Number, Skill_Code, Date Registered)

-- Tạo bảng Department
DROP TABLE IF EXISTS department;
CREATE TABLE department(
	department_number 	TINYINT AUTO_INCREMENT PRIMARY KEY,
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

-- Tạo bảng Employee_Table
DROP TABLE IF EXISTS employee_table;
CREATE TABLE employee_table(
	employee_number 	TINYINT AUTO_INCREMENT PRIMARY KEY,
    employee_name		VARCHAR(30) CHAR SET utf8mb4 NOT NULL,
    department_number	TINYINT NOT NULL,
    FOREIGN KEY(department_number) REFERENCES department(department_number)
);
-- Bảng Employee
INSERT INTO employee_table 	(employee_name, department_number)
VALUES
		('Nguyễn Văn Dương', 1),
		('Nguyễn Đình Bảo', 1),
		('Vũ Thu Hương', 2),
		('Võ Ngọc Ngân', 5),
		('Trần Tuấn Anh', 6),
		('Nguyễn Trí Dũng', 5),
		('Nguyễn Trí Minh', 5),
		('Tống Minh Tâm', 1),
		('Nguyễn Thị Hào', 9),
		('Dương Thu Trang',	10);

-- Tạo bảng Employee_Skill_Table
DROP TABLE IF EXISTS employee_skill_table;
CREATE TABLE employee_skill_table(
	employee_number 	TINYINT AUTO_INCREMENT,
    skill_code			VARCHAR(30) CHAR SET utf8mb4 NOT NULL,
    date_registered		DATE,
    FOREIGN KEY(employee_number) REFERENCES employee_table(employee_number)
);
-- Bảng Skill
INSERT INTO employee_skill_table(employee_number, skill_code, date_registered)
VALUES		
		(1,	'Java', '2021-08-15'),
		(2,	'Android', '2020-07-16'),
		(3,	'C#', '2019-03-17'),
		(1,	'SQL', '2020-05-20'),
		(1,	'Postman', '2021-03-15'),
		(4,	'Ruby', '2020-11-22'),
		(5,	'Java', '2019-04-25'),
		(6,	'C++', '2018-12-27'),
		(7,	'C'	, '2020-08-24'),
		(10, 'PHP', '2021-10-31');

-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
SELECT 	et.employee_number, et.employee_name, et.department_number, est.skill_code 
FROM employee_table et 
	RIGHT JOIN employee_skill_table est ON et.employee_number = est.employee_number
	WHERE est.skill_code = 'Java';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >=3 nhân viên
SELECT	d.department_number, d.department_name, COUNT(et.department_number)
FROM department d  
	JOIN employee_table et ON d.department_number = et.department_number
	GROUP BY et.department_number
	HAVING	COUNT(et.department_number)>=3
	ORDER BY d.department_number ASC;

-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.
SELECT	et.*
FROM department d 
	JOIN employee_table et ON d.department_number = et.department_number
	ORDER BY d.department_number ASC;
    
-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
SELECT 	et.*, COUNT(est.employee_number)
FROM employee_table et 
	RIGHT JOIN employee_skill_table est ON et.employee_number = est.employee_number
	GROUP BY et.employee_number
	HAVING 	COUNT(est.employee_number)>1;
