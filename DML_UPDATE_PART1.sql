set SERVEROUTPUT ON;
-- adding data in the patient details
CREATE OR REPLACE PROCEDURE UPDATE_PATIENT(
    v_p_id patientdetails.patientid%TYPE,
    v_p_firstname patientdetails.firstname%TYPE,
    v_p_lastname patientdetails.lastname%TYPE,
    v_p_sname patientdetails.streetname%TYPE,
    v_p_cname patientdetails.city%TYPE,
    v_p_state patientdetails.state%TYPE,
    v_p_zipcode patientdetails.zipcode%TYPE)
    
AS
BEGIN
    update patientdetails set patientid = v_p_id, firstname = v_p_firstname, lastname = v_p_lastname, 
    streetname = v_p_sname, city = v_p_cname, 
    state = v_p_state, zipcode = v_p_zipcode 
    where patientid = v_p_id ;
    DBMS_OUTPUT.put_line('Data is updated Successfully!');
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
        DBMS_OUTPUT.PUT_LINE('Pl/sql has incompatible return typer');
        rollback;
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No data exists');
        rollback;
    when DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    when others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug administration records or may be user does not have access to perform this task');
        rollback;
END UPDATE_PATIENT;

/


-- Adding data in the doctordetails
CREATE OR REPLACE PROCEDURE UPDATE_DOCTOR(
    v_d_id doctordetails.doctorid%TYPE,
    v_d_firstname doctordetails.firstname%TYPE,
    v_d_lastname doctordetails.lastname%TYPE,
    v_d_specialization doctordetails.specialization%TYPE
    ) 
AS
BEGIN
    update doctordetails set doctorid = v_d_id, firstname = v_d_firstname, lastname = v_d_lastname, 
    specialization = v_d_specialization 
    where doctorid = v_d_id ;
    DBMS_OUTPUT.put_line('Data is updated Successfully!');
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
    when DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    when others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug administration records or may be user does not have access to perform this task');
        rollback;

End UPDATE_DOCTOR;
/


--Nurses details
CREATE OR REPLACE PROCEDURE UPDATE_NURSE(
    v_n_id nursedetails.nurseid%TYPE,
    v_n_firstname nursedetails.firstname%TYPE,
    v_n_lastname nursedetails.lastname%TYPE
    ) 
AS
BEGIN
    update nursedetails set nurseid = v_n_id, firstname = v_n_firstname, lastname = v_n_lastname 
    where nurseid = v_n_id ;
    DBMS_OUTPUT.put_line('Data is updated Successfully!');
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
    when DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    when others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug administration records or may be user does not have access to perform this task');
        rollback;

End UPDATE_NURSE;
/


-- Adding drug details
CREATE OR REPLACE PROCEDURE UPDATE_DRUG(
    v_dr_id drugdetails.drugid%TYPE,
    v_dr_name drugdetails.DrugName%TYPE,
    v_dr_comp drugdetails.DrugComposition%TYPE,
    v_dr_sdeff drugdetails.KnownSideEffects%TYPE
)
AS    
BEGIN
    update drugdetails set drugid = v_dr_id, Drugname = v_dr_name, DrugComposition = v_dr_comp, 
    KnownSideEffects = v_dr_sdeff
    where drugid = v_dr_id ;
    DBMS_OUTPUT.put_line('Data is updated Successfully!');
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
    When DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    When others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug administration records or may be user does not have access to perform this task');
        rollback;
END UPDATE_DRUG;

/


--Adding testing data
CREATE OR REPLACE PROCEDURE UPDATE_TEST(
    v_t_id TestType.TestID%TYPE,
    v_t_name TestType.TestName%TYPE
)
AS    
BEGIN
    update TestType set TestID = v_t_id, TestName = v_t_name
    where TestID = v_t_id ;
    DBMS_OUTPUT.put_line('Data is updated Successfully!');
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
    When DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    When others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug administration records or may be user does not have access to perform this task');
        rollback;
END UPDATE_TEST;

/



-- patient's record detail
CREATE OR REPLACE PROCEDURE UPDATE_PRECORD(
    v_pr_id precords.RecordID%TYPE,
    v_pr_sybf precords.PatientSymptomsBefore%TYPE,
    v_pr_syaf precords.PatientSideEffectsAfter%TYPE,
    v_pr_pid precords.PatientId%TYPE,
    v_pr_did precords.DoctorId%TYPE
)
AS    
BEGIN
    update precords set RecordID = v_pr_id, PatientSymptomsBefore = v_pr_sybf, PatientSideEffectsAfter = v_pr_syaf,
    PatientId = v_pr_pid, DoctorId = v_pr_did
    where RecordID = v_pr_id ;
    DBMS_OUTPUT.put_line('Data is updated Successfully!');
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
    When DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    When others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug administration records or may be user does not have access to perform this task');
        rollback;
END UPDATE_PRECORD;

/

