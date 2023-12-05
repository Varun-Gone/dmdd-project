set SERVEROUTPUT ON;
-- adding data in the patient details
CREATE OR REPLACE PROCEDURE DELETE_PATIENT(
    v_p_id patientdetails.patientid%TYPE)
AS
BEGIN
    delete from patientdetails where patientid = patientid;
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
END DELETE_PATIENT;

/


-- Adding data in the doctordetails
CREATE OR REPLACE PROCEDURE DELETE_DOCTOR(
    v_d_id doctordetails.doctorid%TYPE
    ) 
AS
BEGIN
    delete from doctordetails where doctorid = v_d_id;
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
End DELETE_DOCTOR;
/


--Nurses details
CREATE OR REPLACE PROCEDURE DELETE_NURSE(
    v_n_id nursedetails.nurseid%TYPE
    ) 
AS
BEGIN
    delete from nursedetails where nurseid = v_n_id;
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
End DELETE_NURSE;
/


-- Adding drug details
CREATE OR REPLACE PROCEDURE DELETE_DRUG(
    v_dr_id drugdetails.drugid%TYPE
)
AS    
BEGIN
    delete from drugdetails where drugid = v_dr_id;
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
END DELETE_DRUG;

/


--Adding testing data
CREATE OR REPLACE PROCEDURE DELETE_TEST(
    v_t_id TestType.TestID%TYPE
)
AS    
BEGIN
    delete from TestType where TestID = v_t_id;
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
END DELETE_TEST;

/



-- patient's record detail
CREATE OR REPLACE PROCEDURE DELETE_PRECORD(
    v_pr_id precords.RecordID%TYPE
)
AS    
BEGIN
    delete from precords where RecordID = v_pr_id;
    DBMS_OUTPUT.put_line('Data is deleted!');
    commit;
EXCEPTION
    WHEN no_data_found then
     DBMS_OUTPUT.PUT_LINE('No data exists');
     rollback;
    WHEN DUP_VAL_ON_INDEX Then
     DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
     rollback;
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering patients record data' );
    rollback;
END DELETE_PRECORD;

/
