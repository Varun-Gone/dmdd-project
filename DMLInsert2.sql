set SERVEROUTPUT ON;

--Drrug administration table insert
CREATE OR REPLACE PROCEDURE ADD_DRUGADMINISTRATION(
    v_da_pn DrugAdministration.PrescriptionNo%TYPE,
    v_da_dam DrugAdministration.DateAdministered%TYPE ,
    v_da_drid DrugAdministration.DrugId%TYPE,
    v_da_pid DrugAdministration.PatientId%TYPE,
    v_da_did DrugAdministration.DoctorId%TYPE,
    v_da_nid DrugAdministration.NurseId%TYPE)    
AS    
BEGIN
    insert into DrugAdministration (PrescriptionNo, DateAdministered, DrugId, PatientId, DoctorId, NurseId) values (v_da_pn, v_da_dam,v_da_drid, v_da_pid, v_da_did, v_da_nid);
    DBMS_OUTPUT.put_line('Data is loaded Successfully!');
    commit;
EXCEPTION
    when ACCESS_INTO_NULL then
        DBMS_OUTPUT.PUT_LINE('Please check unassign attribute');
        rollback;
    when CASE_NOT_FOUND then
        DBMS_OUTPUT.PUT_LINE('Please check when clause');
        rollback;    
    when PROGRAM_ERROR then
        DBMS_OUTPUT.PUT_LINE('PL/SQL internal error');
        rollback;
    when ROWTYPE_MISMATCH then
        DBMS_OUTPUT.PUT_LINE('pl/sql has incompatible return typer');
        rollback;
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No data exists');
        rollback;
    WHEN DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug administration records or may be user does not have access to perform this task');
        rollback;
End add_drugadministration;
/







-- testadministration record insertation
CREATE OR REPLACE PROCEDURE ADD_TESTADMINISTRATION(
    v_ta_pn TestAdministrationRecords.DateAdministered%TYPE,
    v_ta_dam TestAdministrationRecords.TestResult%TYPE ,
    v_ta_drid TestAdministrationRecords.TestID%TYPE,
    v_ta_pid TestAdministrationRecords.DoctorId%TYPE,
    v_ta_did TestAdministrationRecords.NurseId%TYPE)
AS    
BEGIN
    insert into TestAdministrationRecords (DateAdministered, TestResult, TestID, DoctorId, NurseId)values (v_ta_pn, v_ta_dam,v_ta_drid, v_ta_pid, v_ta_did);
    DBMS_OUTPUT.put_line('Data is loaded Successfully!');
    commit;
EXCEPTION
    when ACCESS_INTO_NULL then
        DBMS_OUTPUT.PUT_LINE('Please check unassign attribute');
        rollback;
    when CASE_NOT_FOUND then
        DBMS_OUTPUT.PUT_LINE('Please check when clause');
        rollback;    
    when PROGRAM_ERROR then
        DBMS_OUTPUT.PUT_LINE('PL/SQL internal error');
        rollback;
    when ROWTYPE_MISMATCH then
        DBMS_OUTPUT.PUT_LINE('pl/sql has incompatible return typer');
        rollback;
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No data exists');
        rollback;
    WHEN DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug administration records or may be user does not have access to perform this task');
        rollback;
End ADD_TESTADMINISTRATION;
/








-- test records insertation
CREATE OR REPLACE PROCEDURE add_test_record(
    v_tr_rid TestRecords.RecordID%TYPE,
    v_tr_tsaid TestRecords.TestAdministrationID%TYPE
)
AS    
BEGIN
    Insert INTO TestRecords (RecordID, TestAdministrationID) values(v_tr_rid, v_tr_tsaid);
    DBMS_OUTPUT.put_line('Data is loaded Successfully!');
    commit;
EXCEPTION
    when ACCESS_INTO_NULL then
        DBMS_OUTPUT.PUT_LINE('Please check unassign attribute');
        rollback;
    when CASE_NOT_FOUND then
        DBMS_OUTPUT.PUT_LINE('Please check when clause');
        rollback;    
    when PROGRAM_ERROR then
        DBMS_OUTPUT.PUT_LINE('PL/SQL internal error');
        rollback;
    when ROWTYPE_MISMATCH then
        DBMS_OUTPUT.PUT_LINE('pl/sql has incompatible return typer');
        rollback;
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No data exists');
        rollback;
    WHEN DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug administration records or may be user does not have access to perform this task');
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
    when ACCESS_INTO_NULL then
        DBMS_OUTPUT.PUT_LINE('Please check unassign attribute');
        rollback;
    when CASE_NOT_FOUND then
        DBMS_OUTPUT.PUT_LINE('Please check when clause');
        rollback;    
    when PROGRAM_ERROR then
        DBMS_OUTPUT.PUT_LINE('PL/SQL internal error');
        rollback;
    when ROWTYPE_MISMATCH then
        DBMS_OUTPUT.PUT_LINE('pl/sql has incompatible return typer');
        rollback;
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No data exists');
        rollback;
    WHEN DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug administration records or may be user does not have access to perform this task');
        rollback;
END add_shift;
/








-- patients record table
CREATE OR REPLACE PROCEDURE Add_patientrecord(
    v_pr_pid PatientRecord.PatientId%TYPE,
    v_pr_dcid PatientRecord.DoctorId%TYPE
)
AS    
BEGIN
    Insert INTO PatientRecord (PatientId,DoctorId) values( v_pr_pid,v_pr_dcid);
    DBMS_OUTPUT.put_line('Data is loaded Successfully!');
    commit;
EXCEPTION
    when ACCESS_INTO_NULL then
        DBMS_OUTPUT.PUT_LINE('Please check unassign attribute');
        rollback;
    when CASE_NOT_FOUND then
        DBMS_OUTPUT.PUT_LINE('Please check when clause');
        rollback;    
    when PROGRAM_ERROR then
        DBMS_OUTPUT.PUT_LINE('PL/SQL internal error');
        rollback;
    when ROWTYPE_MISMATCH then
        DBMS_OUTPUT.PUT_LINE('pl/sql has incompatible return typer');
        rollback;
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No data exists');
        rollback;
    WHEN DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug administration records or may be user does not have access to perform this task');
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
    when ACCESS_INTO_NULL then
        DBMS_OUTPUT.PUT_LINE('Please check unassign attribute');
        rollback;
    when CASE_NOT_FOUND then
        DBMS_OUTPUT.PUT_LINE('Please check when clause');
        rollback;    
    when PROGRAM_ERROR then
        DBMS_OUTPUT.PUT_LINE('PL/SQL internal error');
        rollback;
    when ROWTYPE_MISMATCH then
        DBMS_OUTPUT.PUT_LINE('pl/sql has incompatible return typer');
        rollback;
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No data exists');
        rollback;
    WHEN DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug administration records or may be user does not have access to perform this task');
        rollback;
END Add_DrugRecord;
