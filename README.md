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

---

#### Employee Management System Overview

The Employee Management System was designed with a structured methodology for data integrity, performance, and usability. The database schema includes primary tables such as Employees, Departments, and Projects, all defined with care using primary and foreign key constraints to establish distinct relationships among the entities. UNIQUE for email addresses and FOREIGN KEY relationships constraint provide consistency and prevent duplicate or orphaned records. Implementing such designs makes a scalable and robust database system.

Data recovery from tables relies heavily on joins, which make retrieval of related records simple. INNER JOIN functionality proved particularly useful in joining employees with their respective departments, making valuable observations regarding organizational hierarchies. Similarly, by joining Projects with Employees, it was possible to retrieve project details along with the managers who are assigned to them, presenting a clear picture of the leadership assignments. Refining by way of WHERE clauses also reduced the outcomes, like retrieving employees above the age of thirty belonging to specific departments like MI6. Such searches allow retrieving relevant information efficiently and accurately.

To facilitate easy access of data and enhancing query performance, views were introduced into the system. The EmployeeDetails view brings together common-used columns along with immediate access to employee IDs, names, and their respective departments without subjecting them to repeated joins. The ActiveProjects view omits projects with budgets greater than $1,000 for fast retrieval of relevant financial entries. Views play a significant role in easing readability and computation, making it easier to manage voluminous data and often queried data.

During development, there were several issues that popped up, particularly in foreign key constraints. Insertion of records into tables based on non-existent parent records resulted in integrity errors that required alteration of insertion order. Ensuring managers already existed within the Employees table before assigning them to Projects was one of the valuable lessons regarding referential integrity. In addition, data type inconsistencies, such as the use of integers instead of decimals to hold project budgets, affected accuracy in monetary calculations. These were addressed through checking dependencies, applying appropriate constraints, and enhancing data types to represent best practice.

This systematic approach results in a scalable, efficient Employee Management System, designed to have seamless data handling and retrieval. By taking advantage of the utilization of joins to specify relations, views to push down access complexity, and clearly defined constraints to preserve integrity, the system provides a foundation for keeping track of employee records, departmental structures, and project allocations efficiently.

---