
--Drug administration update
CREATE OR REPLACE PROCEDURE DELETE_DRUGADMINISTRATION(
    v_da_id DrugAdministration.DrugAdministrationID%TYPE)
AS    
BEGIN
    delete from DrugAdministration where DrugAdministrationID = v_da_id;
    DBMS_OUTPUT.put_line('Data is deleted!');
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
End DELETE_DRUGADMINISTRATION;
/








-- testadministration update
CREATE OR REPLACE PROCEDURE DELETE_TESTADMINISTRATION(
    va_ta_id TestAdministrationRecords.TestAdministrationID%TYPE)
AS    
BEGIN
    delete from TestAdministrationRecords where TestAdministrationID = va_ta_id;
    DBMS_OUTPUT.put_line('Data is deleted!');
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
End DELETE_TESTADMINISTRATION;
/









-- test records update
CREATE OR REPLACE PROCEDURE update_test_record(
    v_tr_id TestRecords.TestRecordID%TYPE 
)
AS    
BEGIN
    delete from TestRecords where TestRecordID = v_tr_id;
    DBMS_OUTPUT.put_line('Data is deleted!');
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
END update_test_record;
/








-- shift records update
CREATE OR REPLACE PROCEDURE delete_shift(
    v_s_nid SHIFTS.Nurseid%TYPE,
    v_s_did SHIFTS.DoctorID%TYPE
)
AS    
BEGIN
    
    delete from SHIFTS where Nurseid = v_s_nid and DoctorID=v_s_did;
    DBMS_OUTPUT.put_line('Data is deleted!');
    commit;
EXCEPTION
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No data exists');
        rollback;
    WHEN DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering test record data' );
        rollback;when ACCESS_INTO_NULL then
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
END delete_shift;
/








-- patients records update
CREATE OR REPLACE PROCEDURE Delete_patientrecord(
    v_pr_id PatientRecord.PatientRecordID%TYPE
)
AS    
BEGIN
    delete from PatientRecord where PatientRecordID = v_pr_id;
    DBMS_OUTPUT.put_line('Data is deleted!');
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
END Delete_patientrecord;
/








-- Drug record update
CREATE OR REPLACE PROCEDURE Delete_DrugRecord(
    v_dr_id DrugRecord.DrugRecordID%TYPE
)
AS    
BEGIN
    delete from DrugRecord where DrugRecordID = v_dr_id;
    DBMS_OUTPUT.put_line('Data is deleted!');
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
END Delete_DrugRecord;
/