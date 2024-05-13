-- Drop existing tables if they exist
DROP TABLE IF EXISTS PatientProcedures;
DROP TABLE IF EXISTS MedicalProcedures;
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS Nurses;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Patients;

-- Create the Database and Tables
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Address VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialization VARCHAR(50) NOT NULL,
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE CASCADE
);

CREATE TABLE Nurses (
    NurseID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE MedicalProcedures (
    ProcedureID INT PRIMARY KEY AUTO_INCREMENT,
    ProcedureName VARCHAR(50) NOT NULL,
    ProcedureDescription VARCHAR(100) NOT NULL
);

CREATE TABLE PatientProcedures (
    PatientID INT NOT NULL,
    ProcedureID INT NOT NULL,
    ProcedureDate DATE NOT NULL,
    DoctorID INT NOT NULL,
    NurseID INT NOT NULL,
    PRIMARY KEY (PatientID, ProcedureID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (ProcedureID) REFERENCES MedicalProcedures(ProcedureID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (NurseID) REFERENCES Nurses(NurseID)
);

-- Demonstrate Data Insertion
INSERT INTO Patients (FirstName, LastName, DateOfBirth, Address, PhoneNumber)
VALUES ('John', 'Doe', '1990-05-15', '123 Main St, Cityville', '555-1234');

INSERT INTO Departments (DepartmentName)
VALUES ('Cardiology'), ('Oncology'), ('Radiology');

INSERT INTO Doctors (FirstName, LastName, Specialization, DepartmentID)
VALUES ('Jane', 'Smith', 'Cardiologist', 1), ('Robert', 'Johnson', 'Oncologist', 2);


-- Demonstrate Data Deletion
DELETE FROM Patients WHERE PatientID = 1;
DELETE FROM Appointments WHERE DoctorID = 2;

-- Demonstrate Data Update
UPDATE Doctors
SET Specialization = 'Radiologist'
WHERE DoctorID = 3;

-- Demonstrate SELECT with WHERE
SELECT FirstName, LastName, Specialization
FROM Doctors
WHERE DepartmentID = 1;

-- Demonstrate SELECT with GROUP BY
SELECT DepartmentID, COUNT(*) AS NumDoctors
FROM Doctors
GROUP BY DepartmentID;

-- Demonstrate SELECT with ORDER BY
SELECT FirstName, LastName, DateOfBirth
FROM Patients
ORDER BY LastName ASC, FirstName DESC;

-- Demonstrate SELECT with HAVING
SELECT DepartmentID, COUNT(*) AS NumDoctors
FROM Doctors
GROUP BY DepartmentID
HAVING COUNT(*) > 2;

-- Join Two Related Tables
SELECT p.FirstName, p.LastName, a.AppointmentDate, a.AppointmentTime
FROM Patients p
JOIN Appointments a ON p.PatientID = a.PatientID;

-- Demonstrate WHERE with DATE
SELECT PatientID, FirstName, LastName, AppointmentDate
FROM Patients p
JOIN Appointments a ON p.PatientID = a.PatientID
WHERE AppointmentDate BETWEEN '2023-01-01' AND '2023-12-31';

-- Demonstrate CREATE VIEW
CREATE VIEW DoctorDetails AS
SELECT d.DoctorID, d.FirstName, d.LastName, d.Specialization, dp.DepartmentName
FROM Doctors d
JOIN Departments dp ON d.DepartmentID = dp.DepartmentID;