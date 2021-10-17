CREATE DATABASE testing_system;
USE testing_system;

CREATE TABLE department(
	department_id		INT,
    department_name		VARCHAR(50)
);
CREATE TABLE `position`(
	position_id 	INT,
    position_name	VARCHAR(50)
);
CREATE TABLE `account`(
	account_id		INT,
    email			VARCHAR(50),
    user_name		VARCHAR(50),
    full_name		VARCHAR(50),
    department_id	INT,
    position_id		INT,
    create_date		DATE
);
CREATE TABLE `group`(
	group_id		INT,
    group_name 		VARCHAR(20),
    creator_id		INT,
    create_date		DATE 
);
CREATE TABLE group_account(
	group_id		INT,
    account_id		INT,
    join_date		DATE 
);
CREATE TABLE type_question(
	type_id		INT,
    type_name	VARCHAR(50) 
);
CREATE TABLE category_question(
	category_id		INT,
    category_name	VARCHAR(50)
);
CREATE TABLE question(
	question_id		INT,
    content 		VARCHAR(100),
    category_id		INT,
    type_id			INT,
    creator_id		INT,
    create_date		DATE 
);
CREATE TABLE answer(
	answer_id 		INT,
    content			VARCHAR(100),
    question_id		INT,
    is_correct		BOOLEAN
);
CREATE TABLE exam(
	exam_id			INT,
    `code`			VARCHAR(20),
    title			VARCHAR(50),
    category_id		INT,
    duration		INT,
    create_id 		INT,
    create_date		DATE 
);
CREATE TABLE exam_question(
	exam_id			INT,
    question_id		INT 
);


    


    
