USE HCOE;

-- Display all records from all relations
SELECT * FROM Employee;
SELECT * FROM BookList;
SELECT * FROM Book;
SELECT * FROM BookIssue;


-- Question 1: Sort the employee records in descending order.
SELECT * FROM Employee ORDER BY Ename DESC;

-- Question 2: Display book name and publication name in ascending order sorted on the basis of book name.
SELECT Bname, 
       (SELECT Publication FROM BookList BL WHERE BL.Bid = B.Bid) AS Publication
FROM Book B
ORDER BY Bname ASC;

-- Question 3: Display top three records from teacher relation.
SELECT TOP 3 * FROM Teacher;

-- Question 4: Display the sum of salaries of all employees.
SELECT SUM(Salary) AS TotalSalary FROM Employee;

-- Question 5: Display the minimum salary of employee.
SELECT MIN(Salary) AS MinSalary FROM Employee;

-- Question 6: Display the average price of book written by same author.
SELECT Author, AVG(Price) AS AvgPrice
FROM Book
GROUP BY Author;

-- Question 7: Display publication name and number of books published by it from book list relation publication wise.
SELECT Publication, COUNT(*) AS BookCount
FROM BookList
GROUP BY Publication;

-- Question 8: Display the bid and bname of books whose price is greater than average prices of book.
SELECT Bid, Bname
FROM Book
WHERE Price > (SELECT AVG(Price) FROM Book);

-- Question 9: Find the bid, bname and author in ascending order where author name is started by �s�.
SELECT Bid, Bname, Author
FROM Book
WHERE Author LIKE 's%'
ORDER BY Author ASC;

-- Question 10: Find the teachers name and book taken by him. The teacher�s salary who takes the book should be the maximum salary.
SELECT T.Name, BI.Bname
FROM Teacher T, BookIssue BI
WHERE T.TID = BI.Eid
  AND T.TID IN (
      SELECT Eid FROM Employee WHERE Salary = (SELECT MAX(Salary) FROM Employee)
  );

-- Question 11: Find the authors name who have written more than one book.
SELECT Author
FROM Book
GROUP BY Author
HAVING COUNT(*) > 1;