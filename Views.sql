create view Patient_Drug_Record as
select d.drugrecordid, a.Patientid, a.firstname, a.lastname, b.drugname, c.firstname as doctorfirstname, c.lastname as doctorlastname, e.patientsideeffectsafter 
from drugrecord d, patientdetails a, drugdetails b, doctordetails c, precords e, drugadministration f
where d.recordid = e.recordid and e.patientid = a.patientid and e.doctorid = c.doctorid
and d.drugadministrationid = f.drugadministrationid and f.drugid = b.drugid;

CREATE VIEW Doctor_Activity_View AS 
SELECT dd.DoctorID, dd.FirstName, dd.LastName, COUNT(DISTINCT pr.PatientId) AS PatientCount, COUNT(DISTINCT da.DrugAdministrationID) AS DrugAdminCount, COUNT(DISTINCT tar.TestAdministrationID) AS TestAdminCount 
FROM DoctorDetails dd
LEFT JOIN PatientRecord pr ON dd.DoctorID = pr.DoctorId
LEFT JOIN DrugAdministration da ON dd.DoctorID = da.DoctorId
LEFT JOIN TestAdministrationRecords tar ON dd.DoctorID = tar.DoctorId
GROUP BY dd.DoctorID, dd.FirstName, dd.LastName;

create view drug_efficacy as
select a.drugid, a.drugname, a.drugcomposition, a.knownsideeffects, b.patientsideeffectsafter
from drugdetails a, precords b, drugrecord c, drugadministration d
where a.drugid = d.drugid and d.drugadministrationid = c.drugadministrationid and c.recordid = b.recordid;

create view Nurse_Activity_View as
select dd.NurseID, dd.FirstName, dd.LastName, COUNT(DISTINCT da.DrugAdministrationID) AS DrugAdminCount, COUNT(DISTINCT tar.TestAdministrationID) AS TestAdminCount 
FROM NurseDetails dd
LEFT JOIN DrugAdministration da ON dd.NurseID = da.NurseId
LEFT JOIN TestAdministrationRecords tar ON dd.NurseID = tar.NurseId
GROUP BY dd.NurseID, dd.FirstName, dd.LastName;


