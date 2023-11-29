-- Patient Details
CREATE TABLE PatientDetails (
  PatientId INT GENERATED ALWAYS AS IDENTITY (START WITH 1000 INCREMENT BY 1) PRIMARY KEY,
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  StreetName VARCHAR(255),
  City VARCHAR(255),
  State VARCHAR(2),
  Zipcode VARCHAR(10)
);

-- Doctor Details
CREATE TABLE DoctorDetails (
  DoctorID INT GENERATED ALWAYS AS IDENTITY (START WITH 2000 INCREMENT BY 1) PRIMARY KEY,
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Specialization VARCHAR(255)
);

-- Nurse Details
CREATE TABLE NurseDetails (
  NurseID INT GENERATED ALWAYS AS IDENTITY (START WITH 3000 INCREMENT BY 1) PRIMARY KEY,
  FirstName VARCHAR(255),
  LastName VARCHAR(255)
);

-- Drug Details
CREATE TABLE DrugDetails (
  DrugID INT GENERATED ALWAYS AS IDENTITY (START WITH 4000 INCREMENT BY 1) PRIMARY KEY,
  DrugName VARCHAR(255),
  DrugComposition VARCHAR(255),
  KnownSideEffects VARCHAR(255)
);

-- Test Type
CREATE TABLE TestType (
  TestID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  TestName VARCHAR(255)
);

-- Records
CREATE TABLE pRecords (
  RecordID INT GENERATED ALWAYS AS IDENTITY (START WITH 1000 INCREMENT BY 1) PRIMARY KEY,
  PatientSymptomsBefore VARCHAR(255),
  PatientSideEffectsAfter VARCHAR(255),
  PatientId INT,
  DoctorId INT,
  FOREIGN KEY (PatientId) REFERENCES PatientDetails(PatientId),
  FOREIGN KEY (DoctorId) REFERENCES DoctorDetails(DoctorID)
);

-- Drug Administration
CREATE TABLE DrugAdministration (
  DrugAdministrationID INT GENERATED ALWAYS AS IDENTITY (START WITH 1000 INCREMENT BY 1) PRIMARY KEY,
  PrescriptionNo VARCHAR(255),
  DateAdministered DATE,
  DrugID INT,
  PatientId INT,
  DoctorId INT,
  NurseId INT,
  FOREIGN KEY (PatientId) REFERENCES PatientDetails(PatientId),
  FOREIGN KEY (DoctorId) REFERENCES DoctorDetails(DoctorID),
  FOREIGN KEY (NurseId) REFERENCES NurseDetails(NurseID),
  FOREIGN KEY (DrugID) REFERENCES DrugDetails(DrugID)
);

-- Test Administration Records
CREATE TABLE TestAdministrationRecords (
  TestAdministrationID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  DateAdministered DATE,
  TestResult VARCHAR(255),
  TestID INT,
  DoctorId INT,
  NurseId INT,
  FOREIGN KEY (DoctorId) REFERENCES DoctorDetails(DoctorID),
  FOREIGN KEY (NurseId) REFERENCES NurseDetails(NurseID),
  FOREIGN KEY (TestID) REFERENCES TestType(TestID)
);

-- Test Records
CREATE TABLE TestRecords (
  TestRecordID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  RecordID INT,
  TestAdministrationID INT,
  FOREIGN KEY (TestAdministrationID) REFERENCES TestAdministrationRecords(TestAdministrationID),
  FOREIGN KEY (RecordID) REFERENCES pRecords(RecordID)
);

-- Shift Timings
CREATE TABLE Shifts (
  NurseID INT,
  DoctorID INT,
  ShiftStartTime DATE,
  ShiftEndTime DATE,
  FOREIGN KEY (NurseID) REFERENCES NurseDetails(NurseID),
  FOREIGN KEY (DoctorID) REFERENCES DoctorDetails(DoctorID)
);

CREATE TABLE PatientRecord (
  PatientRecordID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  PatientId INT,
  DoctorId INT,
  FOREIGN KEY (PatientId) REFERENCES PatientDetails(PatientId),
  FOREIGN KEY (DoctorID) REFERENCES DoctorDetails(DoctorID)
);

CREATE TABLE DrugRecord (
  DrugRecordID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  DrugAdministrationID INT,
  RecordID INT,
  FOREIGN KEY (DrugAdministrationID) REFERENCES DrugAdministration(DrugAdministrationId),
  FOREIGN KEY (RecordID) REFERENCES pRecords(RecordID)
);