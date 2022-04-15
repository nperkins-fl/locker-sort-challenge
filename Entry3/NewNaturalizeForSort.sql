USE tempdb
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE = 'FUNCTION' AND ROUTINE_NAME = 'NewNaturalizeForSort' AND ROUTINE_SCHEMA = 'dbo') BEGIN
    DROP FUNCTION [dbo].[NewNaturalizeForSort]
END
GO

CREATE FUNCTION [dbo].[NewNaturalizeForSort]
(
    @input AS VARCHAR(MAX)  -- should this be max???
) RETURNS VARCHAR(MAX)
BEGIN 
    -- could be used as input with defaults maybe with additional checks???
    -- AFAIK this is the defaults that the library used
    DECLARE @NUMERIC_PADDING_LEN INT = 50;
    DECLARE @NUMERIC_PADDING_CHAR CHAR(1) = '0';
    DECLARE @MAX_LEN INT = 1000;

    DECLARE @SEARCH_PATTERN AS VARCHAR(8) = '%[^0-9]%';

    SET @input = LTRIM(RTRIM(@input));
    
    DECLARE @alphaIndex INT = PATINDEX(@SEARCH_PATTERN, @input)
    DECLARE @chunk VARCHAR(MAX); -- does this need to be max???
    DECLARE @result VARCHAR(MAX) = '';

    WHILE (@alphaIndex > 0) BEGIN
        IF (@alphaIndex = 1) BEGIN
            SET @chunk = SUBSTRING(@input, 1, 1);

            SET @result = @result + @chunk;

            SET @input = SUBSTRING(@input, @alphaIndex + 1, LEN(@input));
        END
        ELSE BEGIN
            SET @chunk = SUBSTRING(@input, 1, @alphaIndex - 1); 

            SET @result = @result + REPLICATE(@NUMERIC_PADDING_CHAR, @NUMERIC_PADDING_LEN - LEN(@chunk)) + @chunk;

            SET @input = SUBSTRING(@input, @alphaIndex, LEN(@input));
        END;

        -- get next alpha char
        SET @alphaIndex = PATINDEX(@SEARCH_PATTERN, @input)
    END;

    -- have only numbers left so pad the rest
    IF (LEN(@input) > 0) BEGIN
        SET @result = @result + REPLICATE(@NUMERIC_PADDING_CHAR, @NUMERIC_PADDING_LEN - LEN(@input)) + @input;
    END;

    RETURN @result;
END;
GO