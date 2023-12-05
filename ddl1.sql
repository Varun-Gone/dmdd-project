-- Patient Details
CREATE TABLE IF NOT EXISTS PatientDetails (
  PatientId INT GENERATED ALWAYS AS IDENTITY (START WITH 1000 INCREMENT BY 1) PRIMARY KEY,
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  StreetName VARCHAR(255),
  City VARCHAR(255),
  State VARCHAR(2),
  Zipcode VARCHAR(10)
);

-- Doctor Details
CREATE TABLE IF NOT EXISTS DoctorDetails (
  DoctorID INT GENERATED ALWAYS AS IDENTITY (START WITH 2000 INCREMENT BY 1) PRIMARY KEY,
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Specialization VARCHAR(255)
);

-- Nurse Details
CREATE TABLE IF NOT EXISTS NurseDetails (
  NurseID INT GENERATED ALWAYS AS IDENTITY (START WITH 3000 INCREMENT BY 1) PRIMARY KEY,
  FirstName VARCHAR(255),
  LastName VARCHAR(255)
);

-- Drug Details
CREATE TABLE IF NOT EXISTS DrugDetails (
  DrugID INT GENERATED ALWAYS AS IDENTITY (START WITH 4000 INCREMENT BY 1) PRIMARY KEY,
  DrugName VARCHAR(255),
  DrugComposition VARCHAR(255),
  KnownSideEffects VARCHAR(255)
);

-- Test Type
CREATE TABLE IF NOT EXISTS TestType (
  TestID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  TestName VARCHAR(255)
);

-- Records
CREATE TABLE IF NOT EXISTS pRecords (
  RecordID INT PRIMARY KEY,
  PatientSymptomsBefore VARCHAR(255),
  PatientSideEffectsAfter VARCHAR(255),
  PatientId INT,
  DoctorId INT,
  FOREIGN KEY (PatientId) REFERENCES PatientDetails(PatientId),
  FOREIGN KEY (DoctorId) REFERENCES DoctorDetails(DoctorID)
);

-- Drug Administration
CREATE TABLE IF NOT EXISTS DrugAdministration (
  DrugAdministrationID INT PRIMARY KEY,
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
CREATE TABLE IF NOT EXISTS TestAdministrationRecords (
  TestAdministrationID PRIMARY KEY,
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
CREATE TABLE IF NOT EXISTS TestRecords (
  TestRecordID INT PRIMARY KEY,
  RecordID INT,
  TestAdministrationID INT,
  FOREIGN KEY (TestAdministrationID) REFERENCES TestAdministrationRecords(TestAdministrationID),
  FOREIGN KEY (RecordID) REFERENCES pRecords(RecordID)
);

-- Shift Timings
CREATE TABLE IF NOT EXISTS Shifts (
  NurseID INT,
  DoctorID INT,
  ShiftStartTime timestamp,
  ShiftEndTime timestamp,
  FOREIGN KEY (NurseID) REFERENCES NurseDetails(NurseID),
  FOREIGN KEY (DoctorID) REFERENCES DoctorDetails(DoctorID)
);

CREATE TABLE IF NOT EXISTS PatientRecord (
  PatientRecordID INT PRIMARY KEY,
  PatientId INT,
  DoctorId INT,
  FOREIGN KEY (PatientId) REFERENCES PatientDetails(PatientId),
  FOREIGN KEY (DoctorID) REFERENCES DoctorDetails(DoctorID)
);

CREATE TABLE IF NOT EXISTS DrugRecord (
  DrugRecordID INT PRIMARY KEY,
  DrugAdministrationID INT,
  RecordID INT,
  FOREIGN KEY (DrugAdministrationID) REFERENCES DrugAdministration(DrugAdministrationId),
  FOREIGN KEY (RecordID) REFERENCES pRecords(RecordID)
);
