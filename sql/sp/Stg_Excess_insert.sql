CREATE OR ALTER PROCEDURE Stg_Excess_insert
AS
    IF NOT EXISTS (SELECT *
                   FROM   sys.tables
                   WHERE  NAME = 'excess')
      SELECT *
      INTO   excess
      FROM   [stg].[stg_excess]
    ELSE
        IF exists (select top 1 * from  [dbo].[excess])
        BEGIN
        INSERT INTO [dbo].[excess]
        SELECT [iso_code],
                [date],
                [excess_mortality_cumulative_absolute],
                [excess_mortality_cumulative],
                [excess_mortality],
                [excess_mortality_cumulative_per_million]
        FROM   [stg].[stg_excess] stagging
                INNER JOIN (SELECT [iso_code]  AS NAME,
                                    Max([date]) AS maxday
                            FROM   [dbo].[excess]
                            GROUP  BY [iso_code]) main
                        ON stagging.iso_code = main.NAME
                            AND stagging.date > main.maxday 
        TRUNCATE TABLE [stg].[stg_excess]
        
        END

        ELSE

        INSERT INTO [dbo].[excess]
        SELECT [iso_code],
                [date],
                [excess_mortality_cumulative_absolute],
                [excess_mortality_cumulative],
                [excess_mortality],
                [excess_mortality_cumulative_per_million]
        FROM   [stg].[stg_excess] stagging