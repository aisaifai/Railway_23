create database if not exists quan_ly_sinh_vien;
use quan_ly_sinh_vien;

ALTER DATABASE quan_ly_sinh_vien CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
DROP TABLE IF EXISTS sinh_vien;
DROP TABLE IF EXISTS khoa;
CREATE TABLE IF NOT EXISTS khoa(
	ma_khoa SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ten_khoa VARCHAR(30) CHARACTER SET utf8mb4 NOT NULL UNIQUE
);
ALTER TABLE khoa AUTO_INCREMENT = 1;
INSERT INTO khoa(ten_khoa) 
VALUES 
	('Công Nghệ Thông Tin'), 
	('Tiếng Nhật'),
	('Điện');
SELECT * FROM khoa;

DROP TABLE IF EXISTS sinh_vien;
CREATE TABLE IF NOT EXISTS sinh_vien(
	ma_sv SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ma_khoa SMALLINT,
    ho_ten  VARCHAR(30) CHARACTER SET utf8mb4,
    ngay_sinh DATE,
	que_quan VARCHAR(50) CHARACTER SET utf8mb4
);
ALTER TABLE sinh_vien AUTO_INCREMENT = 1;
INSERT INTO sinh_vien(ma_khoa,ho_ten,ngay_sinh,que_quan) 
VALUES 
	(1,'Nguyễn Văn Vinh','1993-01-01','Hà Nội'),
	(1,'Pha Hà Giang','1992-01-02','HCM'),
	(1,'Nguyễn Văn Nam','1995-01-03','Cao Bằng'),
	(1,'Phan Linh','1997-01-04','Lạng Sơn'), 
	(2,'Nguyễn Duy Tuấn','1999-01-01','Bắc Giang'),
	(2,'Trình Thanh Bình','1998-01-02','Thái Nguyên'),
	(2,'Hoàng Văn Thế','1993-01-03','Ninh Bình'),
	(4,'Đặng Thị Hà','1993-01-04','Hà Giang');
SELECT * FROM sinh_vien;
SELECT * FROM khoa;



-- LEFT JOIN
	SELECT * FROM
		sinh_vien sv LEFT JOIN khoa kh ON sv.ma_khoa = kh.ma_khoa;

-- INNER JOIN
	SELECT * FROM
		sinh_vien sv JOIN khoa kh ON sv.ma_khoa = kh.ma_khoa;

-- RIGHT JOIN
	SELECT * FROM
		sinh_vien sv RIGHT JOIN khoa kh ON sv.ma_khoa = kh.ma_khoa;
		
-- LEFT EXCLUDING JOIN
	SELECT * 
		FROM sinh_vien sv LEFT JOIN khoa kh ON sv.ma_khoa = kh.ma_khoa
        WHERE kh.ma_khoa IS NULL;
        
-- RIGHT EXCLUDING JOIN	
	SELECT *
		FROM sinh_vien sv RIGHT JOIN khoa kh ON sv.ma_khoa = kh.ma_khoa
        WHERE sv.ma_khoa IS NULL;

-- CROSS JOIN
	SELECT * FROM sinh_vien CROSS JOIN khoa;
    
-- UNION: phép hợp 2 câu lệnh SELECT
	-- UNION:
		SELECT * FROM 
			sinh_vien 
            WHERE ma_sv IN(1, 2)
		UNION
			SELECT * FROM 
			sinh_vien 
            WHERE ma_sv IN(1, 3);
			
            

		