USE HCOE;
GO

-- 1. Create Employee table with default value for employmentDate
CREATE TABLE Employee (
    Eid INT PRIMARY KEY,
    Ename NVARCHAR(100) NOT NULL,
    EmploymentDate DATE DEFAULT ('2010-12-01'),
    Salary DECIMAL(10, 2)
);

ALTER TABLE Employee

-- 2. Create BookList table
CREATE TABLE BookList (
    Bid NVARCHAR(10) PRIMARY KEY,
    Bname NVARCHAR(100) NOT NULL UNIQUE,
    Publication NVARCHAR(100)
);

-- 3. Create Book table with foreign key from BookList
CREATE TABLE Book (
    Bid NVARCHAR(10),
    Bname NVARCHAR(100) NOT NULL,
    Author NVARCHAR(100),
    Price DECIMAL(10, 2) CHECK (Price < 5000),
    FOREIGN KEY (Bid) REFERENCES BookList(Bid)
);



-- 4. Create BookIssue table
CREATE TABLE BookIssue (
    Eid INT NULL,
    Sid INT NULL,
    Bname NVARCHAR(100),
    DateOfIssue DATE,
    FOREIGN KEY (Eid) REFERENCES Employee(Eid),
    FOREIGN KEY (Sid) REFERENCES Student(SID)
);


SELECT TID FROM Teacher
WHERE TID NOT IN (SELECT Eid FROM Employee);

SELECT * FROM Teacher;

-- Suppose these are the teachers already in Teacher table
-- Insert matching records into Employee
INSERT INTO Employee (Eid, Ename, Salary) VALUES
(1, 'Sunil Adhikari', 12000),
(2, 'Meera Sharma', 11000),
(3, 'Niraj Joshi', 10000),
(4, 'Prakash Thapa', 11500),
(5, 'Rita Bhattarai', 10800);


-- i. Set TID as foreign key (example: assuming reference to Employee)
-- You can adjust based on the actual intended reference
ALTER TABLE Teacher
ADD CONSTRAINT FK_Teacher_Emp FOREIGN KEY (TID) REFERENCES Employee(Eid);

-- ii. Set SID as primary key for Student (if not already)
-- Drop and re-add if needed
ALTER TABLE Student
DROP CONSTRAINT IF EXISTS PK_Student;

ALTER TABLE Student
ADD CONSTRAINT PK_Student PRIMARY KEY (SID);


-- built-in stored procedure sp_helpconstraint to return a list of constraints defined on the 'Student' table.
EXEC sp_helpconstraint 'Student';

-- Shows complete information about a table, including columns, identity, indexes, and constraints.
EXEC sp_help 'Student';

-- 7. Insert any 4 records in each relation.
-- Employee
INSERT INTO Employee (Eid, Ename, Salary) VALUES
(10, 'Sita', 12000),
(11, 'Geeta', 9500),
(12, 'Ram', 8000),
(13, 'Sunita', 11000);

-- BookList
INSERT INTO BookList (Bid, Bname, Publication) VALUES
('B001', 'C++101', 'Oxford'),
('B002', 'Data', 'Pearson'),
('B003', 'Algo', 'Ekta'),
('B004', 'Java', 'Everest');

-- Book
INSERT INTO Book (Bid, Bname, Author, Price) VALUES
('B001', 'C++101', 'Bjarne', 4500),
('B002', 'Data', 'Navathe', 3000),
('B003', 'Algo', 'CLRS', 4900),
('B004', 'Java', 'Gosling', 3800);

-- BookIssue
INSERT INTO BookIssue (Eid, Sid, Bname, DateOfIssue) VALUES
(1, 1, 'C++101', '2024-05-01'),
(2, 2, 'Data', '2024-05-02'),
(3, 3, 'Algo', '2024-05-03'),
(4, 4, 'Java', '2024-05-04');

SELECT * FROM Student;

-- 8. Display all records from all relations
SELECT * FROM Employee;
SELECT * FROM BookList;
SELECT * FROM Book;
SELECT * FROM BookIssue;

-- 9. Employees with salary < 10000
SELECT Eid, Ename FROM Employee WHERE Salary < 10000;

-- 10. Books with price between 2500 and 5000
SELECT * FROM Book WHERE Price BETWEEN 2500 AND 5000;

-- 11. Publications starting with 'E'
SELECT * FROM BookList WHERE Publication LIKE 'E%';

-- 12. Employee names ending with 'ta'
SELECT * FROM Employee WHERE Ename LIKE '%ta';


-- 13. Book names exactly 4 characters
SELECT * FROM Book WHERE LEN(Bname) = 4;

-- 14. Employees with name starting with 'S' and salary > 10000
SELECT Eid, Ename, Salary FROM Employee
WHERE Ename LIKE 'S%' AND Salary > 10000;

-- 15. Books with ID in B001�B999 or price 1000�2500
SELECT * FROM Book
WHERE (Bid BETWEEN 'B001' AND 'B999') OR (Price BETWEEN 1000 AND 2500);

	-- 16. Book number and name excluding B003 in BookList
SELECT Bid, Bname FROM BookList WHERE Bid <> 'B003';


--  17. Remove Salary from Teacher
ALTER TABLE Teacher
DROP COLUMN Salary;