USE HCOE;

-- Display all records from all relations
SELECT * FROM Employee;
SELECT * FROM Teacher;
SELECT * FROM BookList;
SELECT * FROM Book;
SELECT * FROM BookIssue;

-- Question 1: Create a stored procedure that displays the books published by “Ekata” Publication.
CREATE PROCEDURE GetBooksByEkata
AS
BEGIN
    SELECT B.Bname, B.Author, BL.Publication
    FROM Book B
    JOIN BookList BL ON B.Bid = BL.Bid
    WHERE BL.Publication = 'Ekata';
END;

EXEC GetBooksByEkata;


-- Question 2: Create a stored procedure to display book details by a particular author.
CREATE PROCEDURE GetBooksByAuthor @AuthorName NVARCHAR(100)
AS
BEGIN
    SELECT * FROM Book WHERE Author = @AuthorName;
END;

EXEC GetBooksByAuthor @AuthorName = 'Bjarne';


-- Question 3: Procedure to display employees with salary > 20000 and employment date = Jan 25, 2020.
CREATE PROCEDURE GetHighPaidEmployees
AS
BEGIN
    SELECT * FROM Employee
    WHERE Salary > 20000 AND EmploymentDate = '2020-01-25';
END;

EXEC GetHighPaidEmployees;


-- Question 4: Procedure to display employee info where name and salary are given at runtime.
CREATE PROCEDURE GetEmployeeByNameSalary
    @Ename NVARCHAR(100),
    @Salary DECIMAL(10,2)
AS
BEGIN
    SELECT * FROM Employee
    WHERE Ename = @Ename AND Salary = @Salary;
END;

EXEC GetEmployeeByNameSalary @Ename = 'Sita', @Salary = 20000;


-- Question 5: Procedure to insert new data to BookList.
CREATE PROCEDURE InsertIntoBookList
    @Bid NVARCHAR(10),
    @Bname NVARCHAR(100),
    @Publication NVARCHAR(100)
AS
BEGIN
    INSERT INTO BookList (Bid, Bname, Publication)
    VALUES (@Bid, @Bname, @Publication);
END;

EXEC InsertIntoBookList @Bid = 'B005', @Bname = 'Python', @Publication = 'Packt';


-- Question 6: Procedure to update employee salaries less than 25000 to -50000.
CREATE PROCEDURE PenalizeLowSalary
AS
BEGIN
    UPDATE Employee
    SET Salary = -50000
    WHERE Salary < 25000;
END;

EXEC PenalizeLowSalary;

SELECT Eid, Ename, Salary FROM Employee WHERE Salary < 25000;


-- Question 7: Modify above procedure to update salaries less than 20000 to 35000.
ALTER PROCEDURE PenalizeLowSalary
AS
BEGIN
    UPDATE Employee
    SET Salary = 35000
    WHERE Salary < 20000;
END;

-- Question 8: Trigger to set salary to NULL if negative after update.
CREATE TRIGGER trg_SetNullForNegativeSalary
ON Employee
AFTER UPDATE
AS
BEGIN
    UPDATE Employee
    SET Salary = NULL
    WHERE Salary < 0;
END;

-- This triggers trg_SetNullForNegativeSalary
UPDATE Employee SET Salary = -1 WHERE Eid = 999;

-- Question 9: Trigger to set EmploymentDate to system date after insert.
CREATE TRIGGER trg_SetEmploymentDate
ON Employee
AFTER INSERT
AS
BEGIN
    UPDATE Employee
    SET EmploymentDate = GETDATE()
    WHERE Eid IN (SELECT Eid FROM inserted);
END;

-- This triggers trg_SetEmploymentDate
INSERT INTO Employee (Eid, Ename, Salary)
VALUES (999, 'TestUser', 30000);

-- Question 10: Create index on Eid in Employee table.
CREATE INDEX idx_Eid ON Employee(Eid);

EXEC sp_helpindex Employee;


-- Question 11: Display current system date.
SELECT GETDATE() AS CurrentDate;

-- Question 12: Reverse a word using built-in function.
SELECT REVERSE('Example') AS ReversedText;

-- Question 13: Convert given text to uppercase.
SELECT UPPER('hello world') AS UppercaseText;

-- Question 14: Display total memory space used by DB and its objects.
EXEC sp_spaceused;

-- Question 15: Display list of queryable tables in database.
EXEC sp_tables @table_type = "'TABLE'";