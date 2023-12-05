CREATE or replace VIEW doctoractivity AS
SELECT 
    d.DoctorID,
    d.FirstName AS "DoctorFirstName",
    d.LastName AS "DoctorLastName",
    COUNT(da.DrugAdministrationID) AS "TotalDrugsPrescribed",
    d1.DrugName AS "PrescribedDrug",
    DENSE_RANK() OVER (PARTITION BY d.DoctorID ORDER BY COUNT(da.drugID) DESC) AS "DrugRankByDoctor",
FROM 
    DoctorDetails d
LEFT JOIN 
    DrugAdministration da ON d.DoctorID = da.DoctorId
LEFT JOIN 
    DrugDetails d1 ON da.DrugID = d1.DrugID
GROUP BY 
    d.DoctorID, d.FirstName, d.LastName, d1.DrugName;
    
select * from Doctoractivity;

Create or replace view drugefficacy as
with drugfficacy AS
    (SELECT 
        dd.DrugID,
        dd.DrugName,
        dd.DrugComposition,
        CASE 
            WHEN dd.KnownSideEffects LIKE '%' || pr.PatientSideEffectsAfter || '%' THEN 1 
            ELSE 0 
        END AS EfficacyBinaryValue,
        pr.recordid
    FROM 
        DrugDetails dd
    left JOIN 
        DrugAdministration da ON dd.DrugID = da.DrugID
    left JOIN 
        DrugRecord dr ON da.DrugAdministrationID = dr.DrugAdministrationID
    left JOIN 
        pRecords pr ON dr.RecordID = pr.RecordID),
DrugAdminCount AS (
    SELECT 
        DrugID,
        COUNT(*) AS TotalDrugCount
    FROM 
        DrugAdministration
    GROUP BY 
        DrugID
),
TestEfficacy AS (
    SELECT 
        dar.DrugID,
        COUNT(tr.RecordID) AS TestsWithEfficacy
    FROM 
        Drugfficacy dar
    LEFT JOIN 
        TestRecords tr ON dar.recordID = tr.RecordID
    LEFT JOIN 
        TestAdministrationRecords tar ON tr.TestAdministrationID = tar.TestAdministrationID
    WHERE 
        dar.EfficacyBinaryValue = 1
    GROUP BY 
        dar.DrugID
)
SELECT 
    de.DrugID,
    de.DrugName,
    de.DrugComposition,
    de.EfficacyBinaryValue,
    COALESCE(TestsWithEfficacy, 0) * 100.0 / da.TotalDrugCount AS PercentageEfficacy
FROM 
    Drugfficacy de
LEFT JOIN 
    DrugAdminCount da ON de.DrugID = da.DrugID
LEFT JOIN 
    TestEfficacy te ON de.DrugID = te.DrugID;


CREATE or replace VIEW TreatmentStatusView AS
SELECT
    pd.PatientID,
    pd.FirstName AS PatientFirstName,
    pd.LastName AS PatientLastName,
    dd.DoctorID,
    dd.FirstName AS DoctorFirstName,
    dd.LastName AS DoctorLastName,
    CASE
        WHEN tar.TestResult = 'Negative' THEN 'Cured'
        WHEN pr.PatientSideEffectsAfter IS NOT NULL
             AND EXISTS (
                 SELECT 1 
                 FROM DrugDetails d 
                 WHERE d.KnownSideEffects LIKE '%' || pr.PatientSideEffectsAfter || '%'
             ) 
             AND tar.TestResult = 'Positive' THEN 'Ongoing'
        ELSE 'TreatmentNotWorking'
    END AS TreatmentStatus
FROM
    PatientDetails pd
left JOIN
    pRecords pr ON pd.PatientID = pr.PatientId
left JOIN
    DoctorDetails dd ON pr.DoctorID = dd.DoctorID
LEFT JOIN
    TestRecords tr ON pr.RecordID = tr.RecordID
LEFT JOIN
    TestAdministrationRecords tar ON tr.TestAdministrationID = tar.TestAdministrationID
LEFT JOIN
    DrugRecord dr ON pr.RecordID = dr.RecordID
LEFT JOIN
    DrugAdministration da ON dr.DrugAdministrationID = da.DrugAdministrationID
LEFT JOIN
    DrugDetails dd1 ON da.DrugID = dd1.DrugID;


CREATE or replace VIEW nurseactivity AS
SELECT 
    n.NurseID,
    n.FirstName AS "NurseFirstName",
    n.LastName AS "NurseLastName",
    COUNT(da.DrugAdministrationID) AS "TotalDrugsAdministered",
    d1.DrugName AS "AdministeredDrug",
    DENSE_RANK() OVER (PARTITION BY n.NurseID ORDER BY COUNT(distinct da.DrugID) DESC) AS "DrugRankByNurse",
    DENSE_RANK() OVER (ORDER BY COUNT(da.DrugAdministrationID) DESC) AS "TotalDrugsRank"
FROM 
    NurseDetails n
LEFT JOIN 
    DrugAdministration da ON n.NurseID = da.NurseId
LEFT JOIN 
    DrugDetails d1 ON da.DrugID = d1.DrugID
GROUP BY 
    n.NurseID, n.FirstName, n.LastName, d1.DrugName;



Create or replace view drugefficacy as
with drugfficacy AS
    (SELECT 
        dd.DrugID,
        dd.DrugName,
        dd.DrugComposition,
        CASE 
            WHEN dd.KnownSideEffects LIKE '%' || pr.PatientSideEffectsAfter || '%' THEN 1 
            ELSE 0 
        END AS EfficacyBinaryValue,
        pr.recordid
    FROM 
        DrugDetails dd
    left JOIN 
        DrugAdministration da ON dd.DrugID = da.DrugID
    left JOIN 
        DrugRecord dr ON da.DrugAdministrationID = dr.DrugAdministrationID
    left JOIN 
        pRecords pr ON dr.RecordID = pr.RecordID),
DrugAdminCount AS (
    SELECT 
        DrugID,
        COUNT(*) AS TotalDrugCount
    FROM 
        DrugAdministration
    GROUP BY 
        DrugID
),
TestEfficacy AS (
    SELECT 
        dar.DrugID,
        COUNT(tr.RecordID) AS TestsWithEfficacy
    FROM 
        Drugfficacy dar
    LEFT JOIN 
        TestRecords tr ON dar.recordID = tr.RecordID
    LEFT JOIN 
        TestAdministrationRecords tar ON tr.TestAdministrationID = tar.TestAdministrationID
    WHERE 
        tar.testresult like 'Positive'
    GROUP BY 
        dar.DrugID
)
SELECT 
    distinct de.DrugID,
    de.DrugName,
    de.DrugComposition,
    COALESCE(TestsWithEfficacy, 0) * 100.0 / da.TotalDrugCount AS PercentageEfficacy
FROM 
    Drugfficacy de
LEFT JOIN 
    DrugAdminCount da ON de.DrugID = da.DrugID
LEFT JOIN 
    TestEfficacy te ON de.DrugID = te.DrugID;

select * from drugefficacy;

CREATE or replace VIEW PatientDrugAdministration AS
SELECT 
    pd.PatientID,
    pd.FirstName AS PatientFirstName,
    pd.LastName AS PatientLastName,
    COUNT(da.DrugAdministrationID) AS TotalDrugsAdministered,
    LISTAGG(dd.DrugName, ', ') WITHIN GROUP (ORDER BY da.DrugAdministrationID) AS AdministeredDrugs
FROM 
    PatientDetails pd
LEFT JOIN 
    pRecords pr ON pd.PatientID = pr.PatientId
LEFT JOIN 
    DrugRecord dr ON pr.RecordID = dr.RecordID
LEFT JOIN 
    DrugAdministration da ON dr.DrugAdministrationID = da.DrugAdministrationID
LEFT JOIN 
    DrugDetails dd ON da.DrugID = dd.DrugID
GROUP BY 
    pd.PatientID, pd.FirstName, pd.LastName;





