/*
    Step 1: Database Design
*/

-- Create a Database
CREATE DATABASE EmployeeManagement;

-- To confirm the database was successfully created
SHOW DATABASES;

-- Create tables with constrains
USE EmployeeManagement;

-- Departments Table
CREATE TABLE Departments(
    departmentId int PRIMARY KEY,
    departmentName varchar(100)
);

-- Employees Table
CREATE TABLE Employees(
    employeeId int PRIMARY KEY,
    firstName varchar(50),
    lastName varchar(50),
    age int,
    email varchar(100) UNIQUE,
    departmentId int,
    FOREIGN KEY (departmentId) REFERENCES Departments(departmentId) ON DELETE CASCADE
);

-- Projects Table
CREATE TABLE Projects(
    projectId int PRIMARY KEY,
    projectName varchar(100),
    projectBudget decimal(10,2),
    managerId int,
    FOREIGN KEY (managerId) REFERENCES Employees(employeeId) ON DELETE CASCADE
);

-- To confirm the tables were successfully created
SHOW TABLES;
DESCRIBE Employees;
DESCRIBE Departments;
DESCRIBE Projects;


/*
    Step 2: Data Manipulation and Retrieval
*/

-- Add 3 departments
INSERT INTO Departments(departmentId, departmentName) VALUES
(1, 'MI6'),
(2, 'MIB'),
(3, 'UNSC');

-- To confirm the records were successfully added
SELECT * FROM Departments;

-- Add at least 5 employees
INSERT INTO Employees (employeeId, firstName, lastName, age, email, departmentId) VALUES
(1, 'Alejandro', 'Ramírez', 30, 'alejandro.ramirez@example.com', 2),
(2, 'Lucía', 'González', 27, 'lucia.gonzalez@example.com', 3),
(3, 'Diego', 'Fernández', 35, 'diego.fernandez@example.com', 1),
(4, 'Sofía', 'Martínez', 29, 'sofia.martinez@example.com', 3),
(5, 'Emilio', 'Torres', 32, 'emilio.torres@example.com', 2);

-- To confirm the records were successfully added
SELECT * FROM Employees;

-- Add 3 projects
INSERT INTO Projects (projectId, projectName, projectBudget, managerId) VALUES
(1, 'Hephesos', 1007, 1),
(2, 'Stellaris', 888, 3),
(3, 'SPARTAN VI', 117, 2);

-- To confirm the records were successfully added
SELECT * FROM Projects;

-- Display the list of all employees along with their department names.
SELECT employeeId, firstName, lastName, age, email, departmentName FROM Employees
INNER JOIN Departments
ON Employees.departmentId = Departments.departmentId;

-- Show all projects along with the names of the managers assigned to them.
SELECT projectId, projectName, projectBudget, CONCAT(firstName, ' ',lastName) AS managerName FROM Projects
INNER JOIN Employees
ON Projects.managerId = Employees.employeeId;

-- Retrieve a list of employees over the age of 30 who work in the MI6 department.
SELECT employeeId, CONCAT(firstName, ' ',lastName) AS managerName, age, email, departmentName FROM Employees
INNER JOIN Departments
ON Employees.departmentId = Departments.departmentId
WHERE age > 30 AND departmentName = 'MI6';

-- Create a view named EmployeeDetails that shows employeeId, firstName, lastName, and departmentName.
CREATE VIEW EmployeeDetails AS
SELECT employeeId, firstName, lastName, departmentName FROM Employees
INNER JOIN Departments
ON Employees.departmentId = Departments.departmentId;

-- To check the created view, use:
SELECT * FROM EmployeeDetails;

-- Create a view named ActiveProjects that shows projectName, projectBudget, and managerId for all projects with a budget over $1,000.
CREATE VIEW ActiveProjects AS
SELECT projectName, projectBudget, managerId FROM projects
WHERE projectBudget > 1000;

-- To check the created view, use:
SELECT * FROM ActiveProjects;


/*
    Step 3: Documentation
*/

/*
Employee Management System Overview
The Employee Management System was designed with a structured methodology for data integrity, performance, and usability. The database schema includes primary tables such as Employees, Departments, and Projects, all defined with care using primary and foreign key constraints to establish distinct relationships among the entities. UNIQUE for email addresses and FOREIGN KEY relationships constraint provide consistency and prevent duplicate or orphaned records. The AUTO_INCREMENT primary key attribute ensures unique identification, while NOT NULL constraints assist with the requirement for crucial information. Implementing such designs makes a scalable and robust database system.
Data recovery from tables relies heavily on joins, which make retrieval of related records simple. INNER JOIN functionality proved particularly useful in joining employees with their respective departments, making valuable observations regarding organizational hierarchies. Similarly, by joining Projects with Employees, it was possible to retrieve project details along with the managers who are assigned to them, presenting a clear picture of the leadership assignments. Refining by way of WHERE clauses also reduced the outcomes, like retrieving employees above the age of thirty belonging to specific departments like MI6. Such searches allow retrieving relevant information efficiently and accurately.
To facilitate easy access of data and enhancing query performance, views were introduced into the system. The EmployeeDetails view brings together common-used columns along with immediate access to employee IDs, names, and their respective departments without subjecting them to repeated joins. The ActiveProjects view omits projects with budgets greater than $1,000 for fast retrieval of relevant financial entries. Views play a significant role in easing readability and computation, making it easier to manage voluminous data and often queried data.
During development, there were several issues that popped up, particularly in foreign key constraints. Insertion of records into tables based on non-existent parent records resulted in integrity errors that required alteration of insertion order. Ensuring managers already existed within the Employees table before assigning them to Projects was one of the valuable lessons regarding referential integrity. In addition, data type inconsistencies, such as the use of integers instead of decimals to hold project budgets, affected accuracy in monetary calculations. These were addressed through checking dependencies, applying appropriate constraints, and enhancing data types to represent best practice.
This systematic approach results in a scalable, efficient Employee Management System, designed to have seamless data handling and retrieval. By taking advantage of the utilization of joins to specify relations, views to push down access complexity, and clearly defined constraints to preserve integrity, the system provides a foundation for keeping track of employee records, departmental structures, and project allocations efficiently.
+/