# Hospital-database
Hospital Database Management System
This project presents a database design for managing data related to patients, doctors, nurses, departments, appointments, and medical procedures in a hospital environment. The database schema is implemented using SQL code, and various operations such as data insertion, deletion, updating, and querying are demonstrated.
Business Scenario
ABC Hospital is a renowned healthcare facility that provides a wide range of medical services to its patients. The hospital has multiple departments, including Cardiology, Oncology, Radiology, and Emergency, among others. Each department has its own set of doctors and nurses assigned to it. Patients can make appointments with specific doctors or visit the hospital for emergency cases.
Database Design
The database design incorporates the following entities:

Patients: Stores patient information such as ID, first name, last name, date of birth, address, and phone number.
Departments: Contains department details, including the department ID and name.
Doctors: Stores doctor information, including ID, first name, last name, specialization, and the department they belong to.
Nurses: Contains nurse information, including ID, first name, last name, and the department they are assigned to.
Appointments: Stores appointment details, including the appointment ID, patient ID, doctor ID, appointment date, and appointment time.
MedicalProcedures: Contains information about medical procedures, including procedure ID, name, and description.
PatientProcedures: An intersection table that stores information about patients undergoing medical procedures, along with the associated doctor and nurse.

The database design includes the following relationships:

One-to-Many Relationships:

A department can have multiple doctors and nurses.
A patient can have multiple appointments.
A doctor can conduct multiple medical procedures on patients.
A nurse can assist in multiple medical procedures.


Many-to-Many Relationships:

A patient can undergo multiple medical procedures.
A medical procedure can be performed on multiple patients.



The PatientProcedures table acts as an intersection data table to represent the many-to-many relationship between patients and medical procedures.
Implementation
The SQL code provided in this project covers the following aspects:

Creating the Database and Tables: The script includes CREATE TABLE statements for all the entities mentioned above, along with the appropriate primary keys, foreign keys, and constraints.
Inserting Data: Sample data is inserted into various tables using INSERT statements to demonstrate data manipulation operations.
Deleting Data: DELETE statements are used to remove data from specific tables.
Updating Data: UPDATE statements are included to modify existing data in one of the tables.
Querying Data: Various SELECT statements are demonstrated, including the use of WHERE, GROUP BY, ORDER BY, HAVING, and JOIN clauses.
Creating Views: A CREATE VIEW statement is included to create a view based on the database schema.
Referential Integrity Rules: Appropriate referential integrity rules and constraints are defined, such as ON DELETE CASCADE for foreign key relationships.
Database Normalization: The database design ensures that all tables satisfy the first, second, and third normal forms (1NF, 2NF, and 3NF) to maintain data integrity and minimize redundancy.

Usage
To use this project, follow these steps:

Install a compatible database management system (e.g., MySQL, PostgreSQL, SQLite).
Execute the provided SQL script to create the database, tables, and insert sample data.
Explore the various SQL statements included in the script to understand data manipulation and querying operations.
Modify the script as needed to suit your specific requirements or experiment with additional queries and operations.

Note: The SQL code in this project is compatible with MySQL. If you're using a different database management system, you may need to adjust the syntax and data types accordingly.
Contributing
Contributions to this project are welcome. If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.
