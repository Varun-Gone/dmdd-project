--CREATES ROLES 
CREATE ROLE HR;
CREATE ROLE NURSE;
CREATE ROLE DOCTOR;
CREATE ROLE PATIENT;



--GRANT PERMISSIONS TO ROLE PATIENT
/
GRANT INSERT,SELECT ON PATIENTDETAILS  TO PATIENT;
/
--grant permission to views
GRANT SELECT ON  Patientdrugadministration TO PATIENT;
/
GRANT SELECT ON TREATMENTSTATUSVIEW TO PATIENT;
/
--grant permission to procedures
grant execute on ADD_PATIENT to PATIENT;
/
grant execute on UPDATE_PATIENT to PATIENT;
/
--GRANT PERMISSIONS TO ROLE DOCTOR
GRANT UPDATE,DELETE,INSERT,SELECT ON  DRUGADMINISTRATION TO DOCTOR;
/
GRANT UPDATE,DELETE,INSERT,SELECT ON  DRUGDETAILS TO DOCTOR;
/
GRANT UPDATE,DELETE,INSERT,SELECT ON  DRUGRECORD TO DOCTOR;
/
GRANT UPDATE,DELETE,INSERT,SELECT ON  PATIENTDETAILS TO DOCTOR;
/
GRANT UPDATE,DELETE,INSERT,SELECT ON  PATIENTRECORD TO DOCTOR;
/
GRANT UPDATE,DELETE,INSERT,SELECT ON  PRECORDS TO DOCTOR;
/
GRANT SELECT ON SHIFTS TO DOCTOR;
/
GRANT SELECT ON  NURSEDETAILS TO DOCTOR;
/
GRANT SELECT ON  DOCTORDETAILS TO DOCTOR;
/
GRANT UPDATE,DELETE,INSERT,SELECT ON  TESTADMINISTRATIONRECORDS TO DOCTOR;
/
GRANT UPDATE,DELETE,INSERT,SELECT ON  TESTRECORDS TO DOCTOR;
/
GRANT UPDATE,DELETE,INSERT,SELECT ON TESTTYPE TO DOCTOR;
/
--grant permission to views
GRANT SELECT,INSERT,UPDATE,DELETE ON  PatientDrugAdministration TO DOCTOR;
/
GRANT SELECT,INSERT,UPDATE,DELETE ON  DrugEfficacy TO DOCTOR;
/
GRANT SELECT,INSERT,UPDATE ON TREATMENTSTATUSVIEW TO DOCTOR;
GRANT SELECT ON  Doctor_Activity_View TO DOCTOR;
/
GRANT SELECT ON  Nurse_Activity_view TO DOCTOR;
--grant permission to procedures
grant execute on ADD_PATIENT to DOCTOR;
/
grant execute on UPDATE_PATIENT to DOCTOR;
/
grant execute on DELETE_PATIENT to DOCTOR;
/
grant execute on ADD_DRUG to DOCTOR;
/
grant execute on UPDATE_DRUG to DOCTOR;
/
grant execute on DELETE_DRUG to DOCTOR;
/
grant execute on ADD_TEST to DOCTOR;
/
grant execute on UPDATE_TEST to DOCTOR;
/
grant execute on DELETE_TEST to DOCTOR;
/
grant execute on ADD_PRECORD to DOCTOR;
/
grant execute on UPDATE_PRECORD to DOCTOR;
/
grant execute on DELETE_PRECORD to DOCTOR;
/
grant execute on ADD_DRUGADMINISTRATION to DOCTOR;
/
grant execute on UPDATE_DRUGADMINISTRATION to DOCTOR;
/
grant execute on DELETE_DRUGADMINISTRATION to DOCTOR;
/
grant execute on ADD_TESTADMINISTRATION to DOCTOR;
/
grant execute on UPDATE_TESTADMINISTRATION to DOCTOR;
/
grant execute on DELETE_TESTADMINISTRATION to DOCTOR;
/
grant execute on ADD_test_record to DOCTOR;
/
grant execute on UPDATE_test_record to DOCTOR;
/
grant execute on DELETE_test_record to DOCTOR;
/
grant execute on ADD_patientrecord to DOCTOR;
/
grant execute on UPDATE_patientrecord to DOCTOR;
/
grant execute on DELETE_patientrecord to DOCTOR;
/
grant execute on ADD_DrugRecord to DOCTOR;
/
grant execute on UPDATE_DrugRecord to DOCTOR;
/
grant execute on DELETE_DrugRecord to DOCTOR;

--GRANT PERMISSIONS TO ROLE NURSE
GRANT SELECT ON  DRUGADMINISTRATION TO NURSE;
/
GRANT UPDATE,DELETE,INSERT,SELECT ON  DRUGDETAILS TO NURSE;
/
GRANT SELECT ON  DRUGRECORD TO NURSE;
/
GRANT UPDATE,DELETE,INSERT,SELECT ON  PATIENTDETAILS TO NURSE;
/
GRANT UPDATE,DELETE,INSERT,SELECT ON  PATIENTRECORD TO NURSE;
/
GRANT SELECT ON  PRECORDS TO NURSE;
/
GRANT SELECT ON  SHIFTS TO NURSE;
/
GRANT SELECT ON  TESTADMINISTRATIONRECORDS TO NURSE;
/
GRANT UPDATE,DELETE,INSERT,SELECT ON  TESTRECORDS TO NURSE;
/
GRANT SELECT ON  TESTTYPE TO NURSE;
/
GRANT SELECT ON  NURSEDETAILS TO NURSE;

--grant permission to views
GRANT SELECT ON  Nurse_Activity_view TO NURSE;
/
GRANT SELECT ON TREATMENTSTATUSVIEW TO NURSE;
/
--grant permission to procedures
grant execute on ADD_PATIENT to NURSE;
/
grant execute on UPDATE_PATIENT to NURSE;
/
grant execute on DELETE_PATIENT to NURSE;
/
grant execute on ADD_DRUG to NURSE;
/
grant execute on UPDATE_DRUG to NURSE;
/
grant execute on DELETE_DRUG to NURSE;
/
grant execute on ADD_test_record to NURSE;
/
grant execute on UPDATE_test_record to NURSE;
/
grant execute on DELETE_test_record to NURSE;
/
grant execute on ADD_patientrecord to NURSE;
/
grant execute on UPDATE_patientrecord to NURSE;
/
grant execute on DELETE_patientrecord to NURSE;
/

--GRANT PERMISSIONS TO ROLE HR
GRANT UPDATE,DELETE,INSERT,SELECT ON  DOCTORDETAILS TO HR;
/
GRANT UPDATE,DELETE,INSERT,SELECT ON  NURSEDETAILS TO HR;
/
GRANT UPDATE,DELETE,INSERT,SELECT ON SHIFTS TO HR;
/

--grant permission to procedures
grant execute on ADD_shift to HR;
/
grant execute on UPDATE_shift to HR;
/
grant execute on DELETE_shift to HR;
/
grant execute on ADD_DOCTOR to HR;
/
grant execute on UPDATE_DOCTOR to HR;
/
grant execute on DELETE_DOCTOR to HR;
/
grant execute on ADD_NURSE to HR;
/
grant execute on ADD_NURSE to HR;
/
grant execute on ADD_NURSE to HR;



/

----------------------------------------------------
GRANT DOCTOR TO DOC130001;
/
GRANT DOCTOR TO DOC130002;
/
GRANT DOCTOR TO DOC130003;
/
----------------------------------

GRANT NURSE TO NURS140001;
/
GRANT NURSE TO NURS140002;
/
GRANT NURSE TO NURS140003;
/
------------------------------

GRANT PATIENT TO PTNT120001;
/
GRANT PATIENT TO PTNT120002;
/
GRANT PATIENT TO PTNT120003;
/
GRANT PATIENT TO PTNT120004;
/
--------------------------------------
GRANT HR TO HR150001;
/
GRANT HR TO HR150002;
/