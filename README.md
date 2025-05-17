# JFS-Project-Employee-Management-System---Advanced-Database-Operations
The goal of this project is to apply advanced database concepts by designing and implementing an Employee Management System using MySQL. You will use constraints, joins, and views to ensure data integrity, retrieve complex data sets, and simplify data operations. This project will reinforce your understanding of how to build efficient, well-structured databases.

## Key Learning Outcomes

- Understanding how to design and implement constraints to maintain data integrity.
- Practical experience using joins to combine and retrieve data across multiple tables.
- Creating views to simplify complex queries and enhance data security and readability.
- Building a real-world application that mirrors common practices in database management.

## Key Tasks:

- Define all primary and foreign key constraints to enforce data integrity.
- Use appropriate data types and constraints to ensure the uniqueness of email and other relevant columns.
  
---

## Project Requirements

### Step 1: Database Design

Create a Database:
- Name the database EmployeeManagement.

Create Tables with Constraints:
 - Employees Table:
   - Columns: employeeId (INT, Primary Key), firstName (VARCHAR, 50), lastName (VARCHAR, 50), age (INT), email (VARCHAR, 100, Unique), departmentId (INT, Foreign Key).
   - Constraints: Set employeeId as the primary key, email as unique, and ensure departmentId links to the Departments table.
 - Departments Table:
   - Columns: departmentId (INT, Primary Key), departmentName (VARCHAR, 100).
   - Constraints: Set departmentId as the primary key.
 - Projects Table:
   - Columns: projectId (INT, Primary Key), projectName (VARCHAR, 100), projectBudget (DECIMAL), managerId (INT, Foreign Key).
   - Constraints: Set projectId as the primary key, managerId must be a valid employeeId from the Employees table.
---
### Step 2: Data Manipulation and Retrieval

Insert Sample Data
- Add at least 5 employees, 3 departments, and 3 projects. Make sure to include managers for projects who are also listed in the Employees table.

Write SQL Queries Using Joins
- Retrieve Employee Information: Display the list of all employees along with their department names.
- Project and Manager Information: Show all projects along with the names of the managers assigned to them.
- Filter Data Using WHERE: Retrieve a list of employees over the age of 40 who work in the Engineering department.

Create Views to Simplify Data Access:
- Employee Details View:
  - Create a view named EmployeeDetails that shows employeeId, firstName, lastName, and departmentName.
  - Active Projects View: Create a view named ActiveProjects that shows projectName, projectBudget, and managerId for all projects with a budget over $1,000.
---
### Step 3: Documentation

- Write a 1-page summary explaining:
- Your approach to designing the database tables and choosing constraints.
- How joins were used to retrieve data across tables.
- How views were used to simplify data access and why you chose to create them.
- Any challenges you encountered during the project and how you resolved them.

