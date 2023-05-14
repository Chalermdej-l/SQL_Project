CREATE OR ALTER PROCEDURE Stg_Excess_insert
AS

/***---------------------------------------------------------------------------

Creator - Chalermdej

Objective - Procedure to load in excess table data if table not exist will create
            If exist if insert the latest data base on the max date

---------------------------------------------------------------------------***/

--Check if table already exist if not create the table from stg table data

    IF NOT EXISTS (SELECT *
                   FROM   sys.tables
                   WHERE  NAME = 'excess')
      SELECT *
      INTO   excess
      FROM   [stg].[stg_excess]

    ELSE

--Check if there is record in the table if there is find the max day and only insert the new day data

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

--If table exist but not data than insert all data from stg to the table

        ELSE

        INSERT INTO [dbo].[excess]
        SELECT [iso_code],
                [date],
                [excess_mortality_cumulative_absolute],
                [excess_mortality_cumulative],
                [excess_mortality],
                [excess_mortality_cumulative_per_million]
        FROM   [stg].[stg_excess] stagging