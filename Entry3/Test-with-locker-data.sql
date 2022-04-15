-- make sure to run NewNaturalizeForSort.sql first!!!

USE sis
GO

DECLARE @SampleDataSet AS TABLE (
    LockerNumber VARCHAR(255) NOT NULL,
    Expected VARCHAR(2000) NULL,
    Actual VARCHAR(2000) NULL
);

INSERT INTO @SampleDataSet (LockerNumber)
SELECT DISTINCT LockerNumber 
FROM tblLocker

UPDATE @SampleDataSet 
SET Expected = dbo.NaturalizeForSort(LockerNumber),
    Actual = tempdb.dbo.NewNaturalizeForSort(LockerNumber)

SELECT *,
    LEN(Expected) AS ExpectedLen,
    LEN(Actual) AS ActualLen,
    IIF(Expected = Actual, 'Pass', 'Fail') AS Test
FROM @SampleDataSet
ORDER BY Test, ExpectedLen DESC
