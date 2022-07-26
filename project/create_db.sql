/*uncomment like to delete all tables*/
DROP TABLE IF EXISTS AffiliatedWith, appointment, OnCall, undergoes, stay, room, prescribes, medication, nurse, patient, `procedure`, department, physician;
/*table 1*/
CREATE DATABASE sqlproject;
CREATE TABLE Physician (
	physicianID INTEGER, 
    name VARCHAR(40), 
    position VARCHAR(40) CHECK (
			position = "Intern" 
            OR position = "Surgeon" 
            OR position = "Senior" 
            OR position = "Chief of Medicine" 
            OR position = "Resident" 
            OR position = "Psychiatrist"),
    ssn INTEGER,
    CONSTRAINT pk_physician PRIMARY KEY(physicianID)
);
/*table 2*/
CREATE TABLE Department (
	deptID INTEGER,
    name VARCHAR(40) CHECK(
		name = "General Medicine"
        OR name ="Surgery"
        OR name = "Psychiatry"),
    headID INTEGER,
    CONSTRAINT pk_department PRIMARY KEY(deptID),
    CONSTRAINT fk_headID FOREIGN KEY(headID) REFERENCES Physician(physicianID)
);
/*table 3
CREATE TABLE AffiliatedWith(
	physicianID INTEGER,
    departmentID INTEGER,
    CONSTRAINT fk_phys_Affiliated FOREIGN KEY(physicianID) REFERENCES Physician(physicianID),
    CONSTRAINT fk_dept_Affiliated FOREIGN KEY(departmentID) REFERENCES Department(deptID),
    PRIMARY KEY(physicianID, departmentID)
);
*/
CREATE TABLE AffiliatedWith(
	physicianID INTEGER,
    departmentID INTEGER,
    CONSTRAINT fk_phys_Affiliated FOREIGN KEY(physicianID) REFERENCES Physician(physicianID),
    CONSTRAINT fk_dept_Affiliated FOREIGN KEY(departmentID) REFERENCES Department(deptID),
    PRIMARY KEY(physicianID, departmentID)
);

/*table 4*/
CREATE TABLE `Procedure`(
	procedureID INTEGER,
	name VARCHAR(40),
    cost REAL,
    CONSTRAINT pk_procedure PRIMARY KEY(procedureID)
);
/*table 5*/
CREATE TABLE Patient(
	patientID INTEGER,
    ssn INTEGER,
    name VARCHAR(40),
    address VARCHAR(100),
    dob DATE,
    phone VARCHAR(16),
    insuranceNumber INTEGER,
    primaryPhysID INTEGER,
    CONSTRAINT pk_patient PRIMARY KEY(patientID),
    CONSTRAINT fk_primaryPhysID FOREIGN KEY(primaryPhysID) REFERENCES Physician(physicianID)
);
/*table 6*/
CREATE TABLE Nurse(
	nurseID INTEGER,
    name VARCHAR(40),
    position VARCHAR(40) CHECK(
		position = "Head Nurse" 
        OR position = "Nurse"),
    ssn INTEGER,
    CONSTRAINT pk_nurse PRIMARY KEY(nurseID)
);
/*table 7*/
CREATE TABLE Medication(
	medID INTEGER,
    name VARCHAR(40),
    CONSTRAINT pk_medication PRIMARY KEY(medID)
);

/*table 8*/
CREATE TABLE Prescribes(
	physicianID INTEGER,
    patientID INTEGER,
    medicationID INTEGER,
    prescribedDate DATE,
    dose VARCHAR(40),
    PRIMARY KEY(prescribedDate, physicianID, patientID, medicationID),
	CONSTRAINT fk_physicianID FOREIGN KEY(physicianID) REFERENCES Physician(physicianID),
    CONSTRAINT fk_patientID FOREIGN KEY(patientID) REFERENCES Patient(patientID),
    CONSTRAINT fk_medID FOREIGN KEY(medicationID) REFERENCES Medication(medID)
);
/*table 9*/
CREATE TABLE Room(
	roomID INTEGER,
    roomType VARCHAR(40) CHECK(
		roomType = "Single"
        OR roomType = "Double"),
	CONSTRAINT pk_room PRIMARY KEY(roomID)
);

/*table 10*/
CREATE TABLE Stay(
	stayID INTEGER,
    patientID INTEGER,
    roomID INTEGER,
    startDate DATE,
    endDate DATE,
    CONSTRAINT pk_stay PRIMARY KEY(stayID),
    CONSTRAINT fk_patientID2 FOREIGN KEY(patientID) REFERENCES Patient(patientID),
    CONSTRAINT fk_roomID FOREIGN KEY(roomID) REFERENCES Room(roomID)    
);

/*table 11*/
CREATE TABLE Undergoes (
	patientID INTEGER,
    procedureID INTEGER,
    stayID INTEGER,
    procDate DATE,
    physicianID INTEGER,
    nurseID INTEGER,
    PRIMARY KEY(patientID, procedureID, stayID, procDate),
    CONSTRAINT fk_patientID3 FOREIGN KEY(patientID) REFERENCES Patient(patientID),
    CONSTRAINT fk_procedureID FOREIGN KEY(procedureID) REFERENCES `Procedure`(procedureID),
    CONSTRAINT fk_stayID FOREIGN KEY(stayID) REFERENCES Stay(stayID),
    CONSTRAINT fk_physicianID2 FOREIGN KEY(physicianID) REFERENCES Physician(physicianID),
    CONSTRAINT fk_nurseID FOREIGN KEY(nurseID) REFERENCES Nurse(nurseID)
);

/*table 12*/
CREATE TABLE OnCall (
	nurseID INTEGER,
    startDate DATE,
    endDate DATE,
    PRIMARY KEY(nurseID, startDate, endDate),
    CONSTRAINT fk_nurseID2 FOREIGN KEY(nurseID) REFERENCES Nurse(nurseID)
);

CREATE TABLE Appointment(
	appID INTEGER,
	patientID INTEGER,
    nurseID INTEGER,
    physicianID INTEGER,
    startDateTime DATETIME,
    endDateTime DATETIME,
    CONSTRAINT pk_appID PRIMARY KEY(appID),
    CONSTRAINT fk_patientID4 FOREIGN KEY(patientID) REFERENCES Patient(patientID),
    CONSTRAINT fk_nurseID3 FOREIGN KEY(nurseID) REFERENCES Nurse(nurseID),
    CONSTRAINT fk_physicianID3 FOREIGN KEY(physicianID) REFERENCES Physician(physicianID)
);