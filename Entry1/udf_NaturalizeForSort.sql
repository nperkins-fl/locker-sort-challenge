USE [sis];
GO
/****** Object:  UserDefinedFunction [dbo].[udf_NaturalizeForSort]    Script Date: 3/3/2022 4:03:52 PM ******/
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO


ALTER FUNCTION [dbo].[udf_NaturalizeForSort]
(
    @src VARCHAR(1024)
)
RETURNS VARCHAR(MAX)
AS
BEGIN

    DECLARE @p INT,
            @p2 INT,
            @num VARCHAR(100);
    DECLARE @ret_val VARCHAR(MAX) = '';
    DECLARE @plen INT = 10;
    DECLARE @letter CHAR(1) = '0';
    IF (PATINDEX('%[0-9]%', @src) = 0)
        SET @ret_val = @src;
    ELSE
    BEGIN
        SET @p = PATINDEX('%[0-9]%', @src);


        WHILE (@p > 0)
        BEGIN
            SET @p2 = PATINDEX('%[^0-9]%', SUBSTRING(@src, @p, 1000));
            IF (@p2 > 0)
            BEGIN
                SET @num = SUBSTRING(@src, @p, @p2 - 1);
                SET @ret_val += LEFT(@src, @p - 1) + CASE
                                                         WHEN LEN(@num) < @plen THEN
                                                             RIGHT(REPLICATE(@letter, @plen) + @num, @plen)
                                                         ELSE
                                                             @num
                                                     END;;
                SET @src = SUBSTRING(@src, @p + @p2 - 1, LEN(@src));
                SET @p = PATINDEX('%[0-9]%', @src);
            END;
            ELSE
            BEGIN
                SET @num = SUBSTRING(@src, @p, LEN(@src));
                SET @ret_val += LEFT(@src, @p - 1) + CASE
                                                         WHEN LEN(@num) < @plen THEN
                                                             RIGHT(REPLICATE(@letter, @plen) + @num, @plen)
                                                         ELSE
                                                             @num
                                                     END;
                SET @src = '';
                BREAK;
            END;

        END; -- while (@p > 0)
        IF LEN(@src) > 0
            SET @ret_val += @src;
    END; -- else
    RETURN @ret_val;
END; -- function

