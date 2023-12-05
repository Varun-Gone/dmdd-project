
# DMDD-Cancer-drug-research-and-development-database-system-project
The ambition of this project is to provide a system that improves and integrates the database system for cancer drug discovery teams (such as doctors, Nurses, and Patients) and provides analysis, tracking drugs efficiency and improving patient's health.
 
## Members
```
Dhrumil Patel 002776451
Malav Bhatt   002830972
Varun Gone    002743448
```
### Workflow
-> Workflow starts with a patient where the patient's records are saved in our database by either a doctor, nurse, or patient by him/herself.
-> After storing the data, the doctor will analyze the patient's records prescribe the drug administration, and forward the following procedures to the nurse
-> Nurse will take the test and enter data in the test records table
-> After that, the Doctor will analyze the patient record and examine the symptoms
-> The doctor would analyze whether symptoms are expected or not or if any other analysis is found
-> Doctors are responsible for updating, inserting, and deleting all data of patients, tests, and drugs.
-> In the end, if the result is not favorable then the procedure will be repeated and the doctor again prescribes the test the drug is considered a successful discovery for the cancer treatment world.
-> Here, doctors may not have a
ll access 
for data manipulation so, HR comes in place to manipulate 

data of doctors and nurses. Although they don't have access to any other data, confidentiality and integrity are maintained
### Code Execution
1. `Create_Database_Object_Script`
    * simply execute the ddl.sql file for executing all tables.
    * Here, the Ddl script is rerunable.
    * After executing there will be all necessary tables will be available.
      
2. `Create_Procedures_Functions_Script`such as
    * Creates many procedure Procedures 
        - Add_patient
        - Add_Doctors
        - Add_nurse 
        - Add_testtype and many more
     -| Please refer to DML files for more executions. here, a few constraints need to be careful Doctors have all right to update, delete, and insert data in the database except doctordetails, nursedtails while nurse has a similar kind of access as doctor but/can't update a few more table data such as testtype, shifs. Patients can insert their data but cannot update it so they have to contact with doctor or nurse.
     -| In case of deletion and update, we have followed the same trend as inserting data. The only difference is that doctors, nurses, and shift tables are updated by HR         only but HR cannot see or view other than that.

3. `Views_Script`
    * Creates 5 views to generate detailed insights for recorded data.
       - Patient_drug_administration
       - Doctor_Activity_View
       - Patient_Drug_Record
       - Drug_Efficacy_View
       - Nurse_Activity_view
  Here, a Few views are stored in the project for the analysis process/.
     -| In the view, HR can only view doctors and nurse data while nurse and doctor can view all data in all tables. Yet, patients can see only their drug's details such as drugs that have been taken to them.
