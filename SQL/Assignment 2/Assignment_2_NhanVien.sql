-- Drop database if  exists
DROP DATABASE IF EXISTS nhanvien;
-- Kiểm tra nếu chưa có database nhanvien thi tạo mới
CREATE DATABASE IF NOT EXISTS nhanvien;

ALTER DATABASE nhanvien CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- sử dụng database nhanvien
USE  nhanvien;
-- question 1: create table with constraints and datatypes
DROP TABLE IF EXISTS department;
CREATE TABLE department(
		department_number 	TINYINT AUTO_INCREMENT PRIMARY KEY, -- AUTO_INCREMENT: tự động tăng, PRIMARY KEY: khóa chính
		department_name		VARCHAR(30) CHAR Set utf8mb4 NOT NULL -- NOT NULL: không được phép null hoặc rỗng
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
	employee_number		SMALLINT AUTO_INCREMENT PRIMARY KEY,
    employee_name 		VARCHAR(30) CHAR Set utf8mb4 NOT NULL,
    department_number	TINYINT NOT NULL,
    FOREIGN KEY (department_number) REFERENCES department(department_number)
);