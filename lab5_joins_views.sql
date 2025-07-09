USE HCOE;

-- Display all records from all relations
SELECT * FROM Employee;
SELECT * FROM Teacher;
SELECT * FROM BookList;
SELECT * FROM Book;
SELECT * FROM BookIssue;


-- 1. Perform join operation on teacher and employee table and display the Employee name, Faculty and salary.
SELECT E.Ename, T.Faculty, E.Salary
FROM Employee E
JOIN Teacher T ON E.Eid = T.TID;


-- 2. Perform LEFT JOIN on table book list and book table.
SELECT BL.*, B.Author, B.Price
FROM BookList BL
LEFT JOIN Book B ON BL.Bid = B.Bid;


-- 3. Perform RIGHT JOIN on booklist and book table.
SELECT BL.*, B.Author, B.Price
FROM BookList BL
RIGHT JOIN Book B ON BL.Bid = B.Bid;


-- 4. Perform FULL JOIN on student and BookIssue table.
SELECT S.*, BI.Bname, BI.DateOfIssue
FROM Student S
FULL JOIN BookIssue BI ON S.SID = BI.Sid;


-- 5. Find those employees name and id who have issued the book named “DATABASE”.
SELECT E.Eid, E.Ename
FROM Employee E
WHERE E.Eid IN (
    SELECT BI.Eid FROM BookIssue BI WHERE BI.Bname = 'Data'
);


-- 6. Find the book name, bid, author name and the book published by “Ekata” Publication.
SELECT B.Bname, B.Bid, B.Author
FROM Book B
WHERE B.Bid IN (
    SELECT Bid FROM BookList WHERE Publication = 'Ekta'
);


-- 7. Display those employees name and salary whose name starts with ‘s’ or whose name consists ‘ni’ as substring.
SELECT Ename, Salary
FROM Employee
WHERE Ename LIKE 's%' OR Ename LIKE '%ni%';


-- 8. Display name of the employee who is also a teacher.
SELECT Ename
FROM Employee
WHERE Eid IN (SELECT TID FROM Teacher);


-- 9. Display all employees name except the name who are teachers.
SELECT Ename
FROM Employee
WHERE Eid NOT IN (SELECT TID FROM Teacher);


-- 10. Create a view “Employee_view” which consists of eid, ename, salary as attributes.
CREATE VIEW Employee_view AS
SELECT Eid, Ename, Salary
FROM Employee;

SELECT * FROM Employee_view;


-- 11. Insert a new record in recently created view. And also display the contents of its primary table.
INSERT INTO Employee_view (Eid, Ename, Salary)
VALUES (20, 'Ravi Sharma', 18000);

SELECT * FROM Employee;

-- 12. Create a view “Employee_Info” which consists of employee name, faculty and salary as its members and the salary should be less than 50000.
CREATE VIEW Employee_Info AS
SELECT E.Ename, T.Faculty, E.Salary
FROM Employee E
JOIN Teacher T ON E.Eid = T.TID
WHERE E.Salary < 50000;

SELECT * FROM Employee_Info;


-- 13. Delete the information from “Employee_view” where salary is in the range between 5000 to 15000.
DELETE FROM Employee_view
WHERE Salary BETWEEN 5000 AND 15000;

DELETE FROM Employee_view
WHERE Salary BETWEEN 5000 AND 15000
AND Eid NOT IN (
    SELECT DISTINCT Eid FROM BookIssue
)
AND Eid NOT IN (
    SELECT DISTINCT TID FROM Teacher
);
