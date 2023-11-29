set SERVEROUTPUT ON;
-- adding data in the patient details
CREATE OR REPLACE PROCEDURE ADD_PATIENT(
    v_p_id patientdetails.patientid%TYPE,
    v_p_firstname patientdetails.firstname%TYPE,
    v_p_lastname patientdetails.lastname%TYPE,
    v_p_sname patientdetails.streetname%TYPE,
    v_p_cname patientdetails.city%TYPE,
    v_p_state patientdetails.state%TYPE,
    v_p_zipcode patientdetails.zipcode%TYPE)
    
AS
BEGIN
    Insert INTO patientdetails values(v_p_id,v_p_firstname, v_p_lastname, v_p_sname,v_p_cname, v_p_state,v_p_zipcode);
    DBMS_OUTPUT.put_line('Data of patient is stored');
    commit;
EXCEPTION
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('ERROR WHILE ENTERING DETAILS of PATIENT');
    rollback;
END ADD_PATIENT;

/

-- Adding data in the doctordetails
CREATE OR REPLACE PROCEDURE ADD_DOCTOR(
    v_d_id doctordetails.doctorid%TYPE,
    v_d_firstname doctordetails.firstname%TYPE,
    v_d_lastname doctordetails.lastname%TYPE,
    v_d_specialization doctordetails.specialization%TYPE
    ) 
AS
BEGIN
    Insert INTO doctordetails values(v_d_id,v_d_firstname, v_d_lastname, v_d_specialization);
    DBMS_OUTPUT.PUT_LINE('Doctors deatils has been added in the tale');
    commit;
EXCEPTION
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('ERROR WHILE ENTERING DETAILS of DOCTOR');
    rollback;

End add_DOCTOR;
/


--Nurses details
CREATE OR REPLACE PROCEDURE ADD_NURSE(
    v_n_id nursedetails.nurseid%TYPE,
    v_n_firstname nursedetails.firstname%TYPE,
    v_n_lastname nursedetails.lastname%TYPE
    ) 
AS
BEGIN
    Insert INTO nursedetails values(v_n_id,v_n_firstname, v_n_lastname);
    DBMS_OUTPUT.PUT_LINE('DATA IS ADDED SUCCESSFULLY! ');
    commit;
EXCEPTION
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('ERROR WHILE ENTERING DETAILS of NURSE');
    rollback;

End add_NURSE;
/


-- Adding drug details
CREATE OR REPLACE PROCEDURE ADD_DRUG(
    v_dr_id drugdetails.drugid%TYPE,
    v_dr_name drugdetails.DrugName%TYPE,
    v_dr_comp drugdetails.DrugComposition%TYPE,
    v_dr_sdeff drugdetails.KnownSideEffects%TYPE
)
AS    
BEGIN
    Insert INTO drugdetails values(v_dr_id, v_dr_name, v_dr_comp, v_dr_sdeff);
    DBMS_OUTPUT.PUT_LINE('DRUG DATA HAS BEEN ENTERED');
    commit;
EXCEPTION
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('ERROR Occur while executing data');
    rollback;
END ADD_DRUG;

/


--Adding testing data
CREATE OR REPLACE PROCEDURE ADD_TEST(
    v_t_id TestType.TestID%TYPE,
    v_t_name TestType.TestName%TYPE
)
AS    
BEGIN
    Insert INTO TestType values(v_t_id, v_t_name);
    DBMS_OUTPUT.put_line('Data is loaded Successfully!');
    commit;
EXCEPTION
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering test data');
    rollback;
END ADD_TEST;

/



-- patient's record detail
CREATE OR REPLACE PROCEDURE ADD_PRECORD(
    v_pr_id precords.RecordID%TYPE,
    v_pr_sybf precords.PatientSymptomsBefore%TYPE,
    v_pr_syaf precords.PatientSideEffectsAfter%TYPE,
    v_pr_pid precords.PatientId%TYPE,
    v_pr_did precords.DoctorId%TYPE
)
AS    
BEGIN
    
    Insert INTO precords values(v_pr_id, v_pr_sybf, v_pr_syaf, v_pr_pid, v_pr_did);
    DBMS_OUTPUT.put_line('Data is loaded Successfully!');
    commit;
EXCEPTION
    WHEN others THEN
    DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering patients record data' );
    rollback;
END ADD_PRECORD;

/

