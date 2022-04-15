SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

CREATE FUNCTION RevisedNaturalizeForSort
(
    @LockerCode NVARCHAR(MAX)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @RevisedLockerCode NVARCHAR(MAX);

    WITH Generator (Number)
    AS (SELECT 1
        UNION ALL
        SELECT Number + 1
        FROM Generator
        WHERE Number < LEN(@LockerCode))
    SELECT @RevisedLockerCode
        = COALESCE(@RevisedLockerCode, '')
          + CASE
                WHEN ISNUMERIC(LockerCodeCharacters.[current]) = 1
                     AND ISNUMERIC(LAG(LockerCodeCharacters.[current], 1, NULL) OVER (ORDER BY (SELECT 1))) = 0
                     AND ISNUMERIC(LEAD(LockerCodeCharacters.[current], 1, NULL) OVER (ORDER BY (SELECT 1))) = 0 THEN
                    '0' + LockerCodeCharacters.[current]
                ELSE
                    LockerCodeCharacters.[current]
            END
    FROM Generator
        CROSS APPLY
    (
        SELECT SUBSTRING(@LockerCode, Number, 1)
    ) AS LockerCodeCharacters([current]);

    RETURN @RevisedLockerCode;
END;
GO
