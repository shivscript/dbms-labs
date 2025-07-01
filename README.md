# SQL Laboratory Exercises

## Lab 1: Introduction to SQL [lab1_intro.sql]

- **Creating and managing databases and tables**
  - Creating a new database
  - Designing and implementing table schemas
  - Understanding data types
  - Setting up relationships between tables
- **Basic SQL queries**
  - SELECT statements for data retrieval
  - INSERT operations to add new records
  - UPDATE commands to modify existing data
  - DELETE operations to remove records

## Lab 2: Constraints, Integrity, and WHERE Clause [lab2_constraints.sql]

- **Working with constraints**
  - NOT NULL constraint to ensure required fields
  - UNIQUE constraint to prevent duplicate values
  - PRIMARY KEY constraints for table identification
  - FOREIGN KEY constraints to maintain referential integrity
  - CHECK constraints to validate data
- **Using the WHERE clause**
  - Basic comparison operators (=, <>, <, >, <=, >=)
  - Logical operators (AND, OR, NOT)
  - BETWEEN operator for range queries
  - IN operator for multiple value matching
  - LIKE operator for pattern matching
  - NULL value handling

## Lab 3: Update, Delete, and Sub Queries [lab3_update_delete.sql]

- **Performing UPDATE operations**
  - Updating single and multiple records
  - Using WHERE clause with UPDATE
  - Complex UPDATE scenarios
- **DELETE operations**
  - Basic DELETE syntax
  - Filtering records for deletion
  - Bulk deletion strategies
- **Writing subqueries**
  - Single-row subqueries
  - Multi-row subqueries
  - Correlated subqueries
  - Subqueries in SELECT, FROM, WHERE clauses
  - EXISTS operator with subqueries

## Lab 4: Built-in Functions, Group By, and Having Clause [lab4_functions_grouping.sql]

- **Using built-in SQL functions**
  - Aggregate functions:
    - COUNT - counting records
    - MAX - finding maximum value
    - MIN - finding minimum value
    - AVG - calculating average
    - SUM - summing values
  - String functions
  - Date and time functions
  - Mathematical functions
- **Grouping data with GROUP BY**
  - Basic grouping concepts
  - Grouping by multiple columns
  - Sorting grouped results
- **Filtering groups with HAVING**
  - HAVING vs WHERE clause
  - Complex conditions with HAVING
  - Using aggregate functions in HAVING clause

## Lab 5: Joins and Creating Views [lab5_joins_views.sql]

- **Understanding different types of joins**
  - INNER JOIN - matching records in both tables
  - LEFT JOIN (or LEFT OUTER JOIN) - all records from left table
  - RIGHT JOIN (or RIGHT OUTER JOIN) - all records from right table
  - FULL JOIN (or FULL OUTER JOIN) - all records from both tables
  - CROSS JOIN - cartesian product
  - Self-joins - joining a table to itself
- **Creating and managing views**
  - Basic view creation
  - Updatable vs. read-only views
  - Indexed views
  - View modification and deletion
  - Using views for security and abstraction