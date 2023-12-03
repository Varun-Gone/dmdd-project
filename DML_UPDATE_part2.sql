
--Drug administration update
CREATE OR REPLACE PROCEDURE UPDATE_DRUGADMINISTRATION(
    v_da_id DrugAdministration.DrugAdministrationID%TYPE,
    v_da_pn DrugAdministration.PrescriptionNo%TYPE,
    v_da_dam DrugAdministration.DateAdministered%TYPE ,
    v_da_drid DrugAdministration.DrugId%TYPE,
    v_da_pid DrugAdministration.PatientId%TYPE,
    v_da_did DrugAdministration.DoctorId%TYPE,
    v_da_nid DrugAdministration.NurseId%TYPE)    
AS    
BEGIN
    update DrugAdministration set DrugAdministrationID = v_da_id, PrescriptionNo = v_da_pn, DateAdministered = v_da_dam , DrugId = v_da_drid, PatientId= v_da_pid, DoctorId= v_da_did, 
    NurseId= v_da_nid
    where DrugAdministrationID = v_da_id;
    DBMS_OUTPUT.put_line('Data is updated Successfully!');
    commit;
    
EXCEPTION
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No data exists');
        rollback;
    WHEN DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug administration records');
        rollback;
End UPDATE_DRUGADMINISTRATION;
/








-- testadministration update
CREATE OR REPLACE PROCEDURE UPDATE_TESTADMINISTRATION(
    va_ta_id TestAdministrationRecords.TestAdministrationID%TYPE, 
    v_ta_pn TestAdministrationRecords.DateAdministered%TYPE,
    v_ta_dam TestAdministrationRecords.TestResult%TYPE ,
    v_ta_drid TestAdministrationRecords.TestID%TYPE,
    v_ta_pid TestAdministrationRecords.DoctorId%TYPE,
    v_ta_did TestAdministrationRecords.NurseId%TYPE)
AS    
BEGIN
    update TestAdministrationRecords set TestAdministrationID = va_ta_id, DateAdministered=v_ta_pn, TestResult=v_ta_dam ,TestID=v_ta_drid ,DoctorId=v_ta_pid, 
    NurseId=v_ta_did  
    where TestAdministrationID = va_ta_id;
    DBMS_OUTPUT.put_line('Data is updated Successfully!');
    commit;
EXCEPTION
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No data exists');
        rollback;
    WHEN DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug administration records' || SQLERRM);
        rollback;
End UPDATE_TESTADMINISTRATION;
/









-- test records update
CREATE OR REPLACE PROCEDURE update_test_record(
    v_tr_id TestRecords.TestRecordID%TYPE, 
    v_tr_rid TestRecords.RecordID%TYPE,
    v_tr_tsaid TestRecords.TestAdministrationID%TYPE
)
AS    
BEGIN
    update TestRecords set TestRecordID = v_tr_id, RecordID=v_tr_rid, 
    TestAdministrationID=v_tr_tsaid where TestRecordID = v_tr_id;
    DBMS_OUTPUT.put_line('Data is updated Successfully!');
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
        rollback;
END update_test_record;
/








-- shift records update
CREATE OR REPLACE PROCEDURE update_shift(
    v_s_oldnid SHIFTS.Nurseid%TYPE,
    v_s_nid SHIFTS.Nurseid%TYPE,
    v_s_did SHIFTS.DoctorID%TYPE
)
AS    
BEGIN
    
    update SHIFTS set Nurseid = v_s_nid, DoctorID = v_s_did where Nurseid = v_s_oldnid;
    DBMS_OUTPUT.put_line('Data is updated Successfully!');
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
        rollback;
END update_shift;
/








-- patients records update
CREATE OR REPLACE PROCEDURE Update_patientrecord(
    v_pr_id PatientRecord.PatientRecordID%TYPE,
    v_pr_pid PatientRecord.PatientId%TYPE,
    v_pr_dcid PatientRecord.DoctorId%TYPE
)
AS    
BEGIN
    update PatientRecord set PatientRecordID = v_pr_id, PatientId=v_pr_pid, 
    DoctorId=v_pr_dcid where PatientRecordID = v_pr_id;
    DBMS_OUTPUT.put_line('Data is loaded Successfully!');
    commit;
EXCEPTION
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No data exists');
        rollback;
    WHEN DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering patients record data' || SQLERRM );
        rollback;
END Update_patientrecord;
/








-- Drug record update
CREATE OR REPLACE PROCEDURE Add_DrugRecord(
    v_dr_id DrugRecord.DrugRecordID%TYPE,
    v_dr_daid DrugRecord.DrugAdministrationID%TYPE,
    v_dr_drd DrugRecord.RecordID%TYPE
)
AS    
BEGIN
    update DrugRecord set DrugRecordID = v_dr_id, DrugAdministrationID=v_dr_daid, 
    RecordID=v_dr_drd where DrugRecordID = v_dr_id;
    DBMS_OUTPUT.put_line('Data is loaded Successfully!');
    commit;
EXCEPTION
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No data exists');
        rollback;
    WHEN DUP_VAL_ON_INDEX Then
        DBMS_OUTPUT.PUT_LINE('Same data detected, Please check the Unique Datas');
        rollback;
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('ERROR Occur while entering drug record data' );
        rollback;
END Add_DrugRecord;
/