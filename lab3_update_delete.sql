USE HCOE;

SELECT * FROM Employee;
SELECT * FROM Teacher;
SELECT * FROM Book;
SELECT * FROM BookIssue;
SELECT * FROM BookList;
SELECT * FROM Student;

-- Question 1: Perform a Cartesian join on employee and teacher table and display the result.
SELECT *
FROM Employee, Teacher;

SELECT * FROM Employee CROSS JOIN Teacher;

-- Question 2: Perform a Cartesian join on employee and teacher table based on a common key attribute (Eid = TID)
SELECT *
FROM Employee
CROSS JOIN Teacher
WHERE Employee.Eid = Teacher.TID;

SELECT * FROM Employee E, Teacher T WHERE E.Eid = T.TID;

SELECT * FROM Employee E JOIN Teacher T ON E.Eid = T.TID;


-- Question 3: Find all the book name, publication name and author name where publication name is �Ekta�.
SELECT B.Bname,
       (SELECT Publication FROM BookList BL WHERE BL.Bid = B.Bid) AS Publication,
       B.Author
FROM Book B
WHERE B.Bid IN (
    SELECT Bid FROM BookList WHERE Publication = 'Ekta'
);

SELECT B.Bname, BL.Publication, B.Author
FROM Book B
JOIN BookList BL ON B.Bid = BL.Bid
WHERE BL.Publication = 'Ekta';

-- Question 4: Find the teachers name and faculty who issued book on Jan 1, 2015.
SELECT Name, Faculty
FROM Teacher
WHERE TID IN (
    SELECT Eid FROM BookIssue WHERE DateOfIssue = '2015-01-01'
);

SELECT T.Name, T.Faculty
FROM Teacher T
JOIN BookIssue BI ON T.TID = BI.Eid
WHERE BI.DateOfIssue = '2015-01-01';

-- Question 5: Find the employee name whose salary is greater than 10000 and faculty is �computer�.
SELECT Ename
FROM Employee
WHERE Eid IN (
    SELECT TID FROM Teacher WHERE Faculty = 'computer'
) AND Salary > 10000;

SELECT E.Ename
FROM Employee E
JOIN Teacher T ON E.Eid = T.TID
WHERE E.Salary > 10000 AND T.Faculty = 'computer';

-- Question 6: Find the student�s name who have issued book named 'DBMS'.
SELECT Name
FROM Student
WHERE SID IN (
    SELECT Sid FROM BookIssue WHERE Bname = 'DBMS'
);


SELECT S.Name
FROM Student S
JOIN BookIssue BI ON S.SID = BI.Sid
WHERE BI.Bname = 'DBMS';

-- Question 7: Add attribute bid on BookIssue relation.
ALTER TABLE BookIssue ADD Bid NVARCHAR(10);

-- Question 8: Update the data in bid column (example update).
UPDATE BookIssue SET Bid = (
    SELECT Bid FROM Book WHERE Book.Bname = BookIssue.Bname
);

-- Question 9: Find the employee name, book name, book�s author name taken by him where the price of book is less than 2500.
SELECT Ename, BI.Bname, 
       (SELECT Author FROM Book B WHERE B.Bname = BI.Bname AND B.Price < 2500) AS Author
FROM Employee E, BookIssue BI
WHERE E.Eid IN (
    SELECT Eid FROM BookIssue WHERE Bname IN (
        SELECT Bname FROM Book WHERE Price < 2500
    )
);

SELECT E.Ename, B.Bname, B.Author
FROM Employee E
JOIN BookIssue BI ON E.Eid = BI.Eid
JOIN Book B ON BI.Bname = B.Bname
WHERE B.Price < 2500;

-- Question 10: Find the Teacher�s name, and book name issued by the teacher whose name starts with "S".
SELECT 
    T.Name,
    (SELECT BI.Bname 
     FROM BookIssue BI 
     WHERE BI.Eid = T.TID
    ) AS Bname
FROM Teacher T
WHERE T.Name LIKE 'S%'
  AND T.TID IN (SELECT Eid FROM BookIssue);


SELECT T.Name, BI.Bname
FROM Teacher T
JOIN BookIssue BI ON T.TID = BI.Eid
WHERE T.Name LIKE 'S%';

-- Question 11: Update all salary by 10%.
UPDATE Employee SET Salary = Salary * 1.10;

-- Question 12: Update book name DBMS as DATABASE.
UPDATE Book SET Bname = 'DATABASE' WHERE Bname = 'DBMS';

-- Question 13: Update the salary of all employee by 20% whose salary is less than 5000.
UPDATE Employee SET Salary = Salary * 1.20 WHERE Salary < 5000;

-- Question 14: Provide 5% increment to all salaries whose salary is greater than 20000 and 20% increment in rest of salaries.
UPDATE Employee
SET Salary = Salary * 
    CASE 
        WHEN Salary > 20000 THEN 1.05
        ELSE 1.20
    END;

-- Question 15: Delete the records from employee table whose eid is E101.
DELETE FROM Employee WHERE Eid = 101;

-- Question 16: Use sub query to find all teachers name and faculty whose date of employment is Jan 2, 2011.
SELECT Name, Faculty
FROM Teacher
WHERE TID IN (
    SELECT Eid FROM Employee WHERE EmploymentDate = '2011-01-02'
);

-- Question 17: Use sub query to find all the book name and author name whose publication is �shaja prakashan�.
SELECT B.Bname, B.Author
FROM Book B
WHERE B.Bid IN (
    SELECT Bid FROM BookList WHERE Publication = 'shaja prakashan'
);

-- Question 18: Find all the students name and batch who have issued the book from library on Jan 2, 2022. Use sub query.
SELECT S.Name, S.Batch
FROM Student S
WHERE S.SID IN (
    SELECT Sid FROM BookIssue WHERE DateOfIssue = '2022-01-02'
);

-- Question 19: Use a sub query to display the name of teachers who have issued the books.
SELECT T.Name
FROM Teacher T
WHERE T.TID IN (
    SELECT Eid FROM BookIssue
);

-- Question 20: Use a sub query to display the name of teachers who have issued the book named 'C'.
SELECT T.Name
FROM Teacher T
WHERE T.TID IN (
    SELECT BI.Eid FROM BookIssue BI WHERE BI.Bname = 'C'
);


-- 21. Find all books issued by employees whose salary is between 9000 and 12000.
-- (Join BookIssue, Employee, and Book tables)


-- 22. List the names of employees who have not issued any books.
-- (Using NOT IN with BookIssue)


-- 23. Count the total number of books issued by each employee.
-- (Use GROUP BY with COUNT)


-- 24. Display the name and publication of the most expensive book.
-- (Use ORDER BY and TOP 1)


-- 25. Display all books and mention whether they are issued or not using CASE.
-- (Use LEFT JOIN and CASE)
