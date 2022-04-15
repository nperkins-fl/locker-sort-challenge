SELECT * FROM (
SELECT 'A' AS LockerNumber UNION ALL
SELECT 'B' AS LockerNumber UNION ALL
SELECT 'C' AS LockerNumber UNION ALL
SELECT 'AD' AS LockerNumber 
) AS DataSet1
 order by dbo.udf_NaturalizeForSort(LockerNumber)  
 
SELECT *
FROM
(
SELECT 'A10' AS LockerNumber UNION ALL
SELECT 'A111' AS LockerNumber UNION ALL
SELECT 'A121' AS LockerNumber UNION ALL
SELECT 'A131' AS LockerNumber UNION ALL
SELECT 'A141' AS LockerNumber UNION ALL
SELECT '5A' AS LockerNumber UNION ALL
SELECT 'A5' AS LockerNumber UNION ALL
SELECT 'A2' AS LockerNumber UNION ALL
SELECT 'A3' AS LockerNumber UNION ALL
SELECT 'A4' AS LockerNumber UNION ALL
SELECT 'A1' AS LockerNumber UNION ALL
SELECT 'A6' AS LockerNumber UNION ALL
SELECT 'A7' AS LockerNumber UNION ALL
SELECT 'A8' AS LockerNumber UNION ALL
SELECT 'A9' AS LockerNumber UNION ALL
SELECT 'A15' AS LockerNumber UNION ALL
SELECT 'A16' AS LockerNumber UNION ALL
SELECT 'A127' AS LockerNumber UNION ALL
SELECT 'A1800' AS LockerNumber UNION ALL
SELECT 'A119' AS LockerNumber UNION ALL
SELECT 'A20' AS LockerNumber 
) AS DataSet1
 order by dbo.udf_NaturalizeForSort(LockerNumber)  

SELECT *
FROM
(
SELECT '1A' AS LockerNumber UNION ALL
SELECT '22A' AS LockerNumber UNION ALL
SELECT '3A' AS LockerNumber UNION ALL
SELECT '4A' AS LockerNumber UNION ALL
SELECT '5A' AS LockerNumber UNION ALL
SELECT '62A' AS LockerNumber UNION ALL
SELECT '17A' AS LockerNumber UNION ALL
SELECT '8A' AS LockerNumber UNION ALL
SELECT '9A' AS LockerNumber UNION ALL
SELECT '10A' AS LockerNumber UNION ALL
SELECT '11A' AS LockerNumber UNION ALL
SELECT '12A' AS LockerNumber UNION ALL
SELECT '13A' AS LockerNumber UNION ALL
SELECT '14A' AS LockerNumber UNION ALL
SELECT '15A' AS LockerNumber UNION ALL
SELECT '16A' AS LockerNumber UNION ALL
SELECT '1117A' AS LockerNumber UNION ALL
SELECT '108A' AS LockerNumber UNION ALL
SELECT '239A' AS LockerNumber UNION ALL
SELECT '20A' AS LockerNumber 
) AS DataSet2
 order by dbo.udf_NaturalizeForSort(LockerNumber)  

SELECT *
FROM
(
SELECT '11A1' AS LockerNumber UNION ALL
SELECT '1A2' AS LockerNumber UNION ALL
SELECT '1A3' AS LockerNumber UNION ALL
SELECT '112A4' AS LockerNumber UNION ALL
SELECT '1AB51' AS LockerNumber UNION ALL
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
) AS DataSet3
order by dbo.udf_NaturalizeForSort(LockerNumber) 