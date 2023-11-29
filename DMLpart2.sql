set SERVEROUTPUT ON;

--
CREATE OR REPLACE PROCEDURE ADD_DRUGADMINISTRATION(
    v_da_id DrugAdministration.DrugadministrationID%TYPE,
    v_da_pn DrugAdministration.PrescriptionNo%TYPE,
    v_da_dam DrugAdministration.DateAdministered%TYPE ,
    v_da_drid DrugAdministration.DrugId%TYPE,
    v_da_pid DrugAdministration.PatientId%TYPE,
    v_da_did DrugAdministration.DoctorId%TYPE,
    v_da_nid DrugAdministration.NurseId%TYPE)
    
AS    
BEGIN
    
    insert into DrugAdministration values (v_da_id,v_da_pn, v_da_dam,v_da_drid, v_da_pid, v_da_did, v_da_pid);
    DBMS_OUTPUT.put_line('Data is loaded Successfully!');
    commit;
EXCEPTION
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug administration records');
    rollback;
End add_drugadministration;
/


-- testadministration
CREATE OR REPLACE PROCEDURE ADD_TESTADMINISTRATION(
    v_da_id TestAdministrationRecords.TestAdministrationID%TYPE,
    v_da_pn TestAdministrationRecords.DateAdministered%TYPE,
    v_da_dam TestAdministrationRecords.TestResult%TYPE ,
    v_da_drid TestAdministrationRecords.TestID%TYPE,
    v_da_pid TestAdministrationRecords.DoctorId%TYPE,
    v_da_did TestAdministrationRecords.NurseId%TYPE)
AS    
BEGIN
    
    insert into TestAdministrationRecords values (v_da_id,v_da_pn, v_da_dam,v_da_drid, v_da_pid, v_da_did);
    DBMS_OUTPUT.put_line('Data is loaded Successfully!');
    commit;
EXCEPTION
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug administration records');
    rollback;
End ADD_TESTADMINISTRATION;
/









-- test records
CREATE OR REPLACE PROCEDURE add_test_record(
    v_s_nid TestRecords.TestRecordID%TYPE,
    v_s_did TestRecords.RecordID%TYPE,
    v_s_ts TestRecords.TestAdministrationID%TYPE
)
AS    
BEGIN
    
    Insert INTO TestRecords values(v_s_nid, v_s_did, v_s_ts);
    DBMS_OUTPUT.put_line('Data is loaded Successfully!');
    commit;
EXCEPTION
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering test record data' );
    rollback;
END add_test_record;

/






--Shift records
CREATE OR REPLACE PROCEDURE add_shift(
    v_s_nid SHIFTS.Nurseid%TYPE,
    v_s_did SHIFTS.DoctorID%TYPE,
    v_s_ts SHIFTS.ShiftStartTime%TYPE,
    v_s_te SHIFTS.ShiftEndTime%TYPE
)
AS    
BEGIN
    
    Insert INTO shifts values(v_s_nid, v_s_did, v_s_ts,v_s_te);
    DBMS_OUTPUT.put_line('Data is loaded Successfully!');
    commit;
EXCEPTION
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering test record data' );
    rollback;
END add_shift;

/








-- patients record table
CREATE OR REPLACE PROCEDURE Add_patientrecord(
    v_pr_prid PatientRecord.PatientRecordID%TYPE,
    v_pr_pid PatientRecord.PatientId%TYPE,
    v_pr_dcid PatientRecord.DoctorId%TYPE
)
AS    
BEGIN
    
    Insert INTO PatientRecord (PatientId,DoctorId) values( v_pr_pid,v_pr_dcid);
    DBMS_OUTPUT.put_line('Data is loaded Successfully!');
    commit;
EXCEPTION
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering patients record data' || SQLERRM );
    rollback;
END Add_patientrecord;
/








-- Drug record
CREATE OR REPLACE PROCEDURE Add_DrugRecord(

    v_dr_daid DrugRecord.DrugAdministrationID%TYPE,
    v_dr_drd DrugRecord.RecordID%TYPE
)
AS    
BEGIN
    
    Insert INTO DrugRecord (DrugAdministrationID,RecordID) values( v_dr_daid,v_dr_drd);
    DBMS_OUTPUT.put_line('Data is loaded Successfully!');
    commit;
EXCEPTION
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug record data' );
    rollback;
END Add_DrugRecord;
/

