CREATE DATABASE HCOE;
GO

USE HCOE;
GO

--1. Create database and tables
-- Create Student table
CREATE TABLE Student (
	SID INT PRIMARY KEY,
	Name NVARCHAR(100),
	RN INT,
	Batch INT
);

-- Create Teacher table
CREATE TABLE Teacher (
	TID INT PRIMARY KEY,
	Name NVARCHAR(100),
	Faculty NVARCHAR(100)
);

--2. Insert five records in each table
-- Insert into Student
INSERT INTO Student (SID, Name, RN, Batch) VALUES
(1, 'Amit Sharma', 101, 2076),
(2, 'Bina Rai', 102, 2077),
(3, 'Chirag Shrestha', 103, 2076),
(4, 'Dipa Karki', 104, 2078),
(5, 'Elina Gurung', 105, 2077);

-- Insert into Teacher
INSERT INTO Teacher (TID, Name, Faculty) VALUES
(1, 'Sunil Adhikari', 'Computer'),
(2, 'Meera Sharma', 'Electronics'),
(3, 'Niraj Joshi', 'Civil'),
(4, 'Prakash Thapa', 'Mechanical'),
(5, 'Rita Bhattarai', 'Architecture');


--3. Display all records
SELECT * FROM Student;
SELECT * FROM Teacher;

--4. Display only SID and Name from Student
SELECT SID, Name FROM Student;

--5. Display Name and Faculty from Teacher
SELECT Name, Faculty FROM Teacher;

--6. Remove RN attribute from Student
ALTER TABLE Student
DROP COLUMN RN;

--7. Add salary attribute to Teacher
ALTER TABLE Teacher
ADD Salary DECIMAL(10, 2);  -- You can change the type as needed

UPDATE Teacher SET Salary = 60000 WHERE TID = 1;
UPDATE Teacher SET Salary = 58000 WHERE TID = 2;
UPDATE Teacher SET Salary = 62000 WHERE TID = 3;
UPDATE Teacher SET Salary = 59000 WHERE TID = 4;
UPDATE Teacher SET Salary = 61000 WHERE TID = 5;


--8. Copy SID and Name into new relation info_student
SELECT SID, Name INTO info_student FROM Student;

SELECT * FROM info_student;

--9. Delete all contents from info_student
DELETE FROM info_student;