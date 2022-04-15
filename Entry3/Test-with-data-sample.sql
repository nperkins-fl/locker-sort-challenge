-- make sure to run NewNaturalizeForSort.sql first!!!
USE sis
GO


DECLARE @SampleDataSet AS TABLE (
    LockerNumber VARCHAR(255) NOT NULL,
    Expected VARCHAR(2000) NULL,
    Actual VARCHAR(2000) NULL
);

INSERT INTO @SampleDataSet (LockerNumber)
SELECT LockerNumber
FROM
(
SELECT 'A1' AS LockerNumber UNION ALL
SELECT 'A2' AS LockerNumber UNION ALL
SELECT 'A3' AS LockerNumber UNION ALL
SELECT 'A4' AS LockerNumber UNION ALL
SELECT 'A5' AS LockerNumber UNION ALL
SELECT 'A6' AS LockerNumber UNION ALL
SELECT 'A7' AS LockerNumber UNION ALL
SELECT 'A8' AS LockerNumber UNION ALL
SELECT 'A9' AS LockerNumber UNION ALL
SELECT 'A10' AS LockerNumber UNION ALL
SELECT 'A11' AS LockerNumber UNION ALL
SELECT 'A12' AS LockerNumber UNION ALL
SELECT 'A13' AS LockerNumber UNION ALL
SELECT 'A14' AS LockerNumber UNION ALL
SELECT 'A15' AS LockerNumber UNION ALL
SELECT 'A16' AS LockerNumber UNION ALL
SELECT 'A17' AS LockerNumber UNION ALL
SELECT 'A18' AS LockerNumber UNION ALL
SELECT 'A19' AS LockerNumber UNION ALL
SELECT 'A20' AS LockerNumber 
) AS DataSet1
UNION
SELECT LockerNumber
FROM
(
SELECT '1A' AS LockerNumber UNION ALL
SELECT '2A' AS LockerNumber UNION ALL
SELECT '3A' AS LockerNumber UNION ALL
SELECT '4A' AS LockerNumber UNION ALL
SELECT '5A' AS LockerNumber UNION ALL
SELECT '6A' AS LockerNumber UNION ALL
SELECT '7A' AS LockerNumber UNION ALL
SELECT '8A' AS LockerNumber UNION ALL
SELECT '9A' AS LockerNumber UNION ALL
SELECT '10A' AS LockerNumber UNION ALL
SELECT '11A' AS LockerNumber UNION ALL
SELECT '12A' AS LockerNumber UNION ALL
SELECT '13A' AS LockerNumber UNION ALL
SELECT '14A' AS LockerNumber UNION ALL
SELECT '15A' AS LockerNumber UNION ALL
SELECT '16A' AS LockerNumber UNION ALL
SELECT '17A' AS LockerNumber UNION ALL
SELECT '18A' AS LockerNumber UNION ALL
SELECT '19A' AS LockerNumber UNION ALL
SELECT '20A' AS LockerNumber 
) AS DataSet2
UNION
SELECT LockerNumber
FROM
(
SELECT '1A1' AS LockerNumber UNION ALL
SELECT '1A2' AS LockerNumber UNION ALL
SELECT '1A3' AS LockerNumber UNION ALL
SELECT '1A4' AS LockerNumber UNION ALL
SELECT '1A5' AS LockerNumber UNION ALL
SELECT '1A11' AS LockerNumber UNION ALL
SELECT '1A12' AS LockerNumber UNION ALL
SELECT '1A13' AS LockerNumber UNION ALL
SELECT '1A14' AS LockerNumber UNION ALL
SELECT '1A15' AS LockerNumber UNION ALL
SELECT '10A1' AS LockerNumber UNION ALL
SELECT '10A2' AS LockerNumber UNION ALL
SELECT '10A3' AS LockerNumber UNION ALL
SELECT '10A4' AS LockerNumber UNION ALL
SELECT '10A5' AS LockerNumber UNION ALL
SELECT '10A11' AS LockerNumber UNION ALL
SELECT '10A12' AS LockerNumber UNION ALL
SELECT '10A13' AS LockerNumber UNION ALL
SELECT '10A14' AS LockerNumber UNION ALL
SELECT '10A15' AS LockerNumber
) AS DataSet3;

UPDATE @SampleDataSet 
SET Expected = dbo.NaturalizeForSort(LockerNumber),
    Actual = tempdb.dbo.NewNaturalizeForSort(LockerNumber)

select *, 
    LEN(Expected) AS ExpectedLen, 
    LEN(Actual) AS ActualLen, 
    IIF(Expected = Actual, 'Pass', 'Fail') AS Test 
from @SampleDataSet
ORDER BY Test