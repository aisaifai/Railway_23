CREATE DATABASE testing_system;
USE testing_system;

CREATE TABLE department (
	department_id		INT,
    department_name		VARCHAR(50)
);

CREATE TABLE `position` (
	position_id 		INT,
    position_name		VARCHAR(50)
);

CREATE TABLE `account` (
	account_id			VARCHAR(20),
    email				VARCHAR(50),
    username			VARCHAR(20),
    fullname			VARCHAR(20),
    department_id		VARCHAR(50),
    position_id			VARCHAR(50),
    create_date			DATE
);

CREATE TABLE `group` (
	group_id			INT,
    group_name 			VARCHAR(20),
    creator_id			VARCHAR(20),
    create_date			DATE 
);

CREATE TABLE group_account (
	group_id			INT,
    account_id			VARCHAR(20),
    join_date			DATE 
);

CREATE TABLE type_question (
	type_id				INT,
    type_name			VARCHAR(50) 
);

CREATE TABLE category_question (
	category_id			INT,
    category_name		VARCHAR(50)
);

CREATE TABLE question (
	question_id			INT,
    content 			VARCHAR(100),
    category_id			INT,
    type_id				INT,
    creator_id			VARCHAR(20),
    create_date			DATE 
);

CREATE TABLE answer (
	answer_id 			INT,
    content				VARCHAR(100),
    question_id			INT,
    is_correct			VARCHAR(10)
);

CREATE TABLE exam (
	exam_id				INT,
    `code`				INT,
    title				VARCHAR(50),
    category_id			INT,
    duration			INT,
    create_date			DATE 
);

CREATE TABLE exam_question (
	exam_id				INT,
    question_id			INT 
);


    


    
