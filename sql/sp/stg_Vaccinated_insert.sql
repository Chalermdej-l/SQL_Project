CREATE OR ALTER  PROCEDURE Stg_Vaccinated_insert
AS


/***---------------------------------------------------------------------------

Creator - Chalermdej

Objective - Procedure to load in excess table data if table not exist will create
            If exist if insert the latest data base on the max date

---------------------------------------------------------------------------***/

--Check if table already exist if not create the table from stg table data


    IF NOT EXISTS (SELECT *
                   FROM   sys.tables
                   WHERE  NAME = 'vaccinated')
      SELECT *
      INTO   vaccinated
      FROM   [stg].[stg_vaccinated]

--Check if there is record in the table if there is find the max day and only insert the new day data

    ELSE
        IF exists (select top 1 * from  [dbo].[vaccinated])
        BEGIN
        INSERT INTO [dbo].[vaccinated]
        SELECT [iso_code],
                [date],
                [total_tests],
                [new_tests],
                [total_tests_per_thousand],
                [new_tests_per_thousand],
                [new_tests_smoothed],
                [new_tests_smoothed_per_thousand],
                [positive_rate],
                [tests_per_case],
                [tests_units],
                [total_vaccinations],
                [people_vaccinated],
                [people_fully_vaccinated],
                [total_boosters],
                [new_vaccinations],
                [new_vaccinations_smoothed],
                [total_vaccinations_per_hundred],
                [people_vaccinated_per_hundred],
                [people_fully_vaccinated_per_hundred],
                [total_boosters_per_hundred],
                [new_vaccinations_smoothed_per_million],
                [new_people_vaccinated_smoothed],
                [new_people_vaccinated_smoothed_per_hundred]
        FROM   [stg].[stg_vaccinated] stagging
                INNER JOIN (SELECT [iso_code]  AS NAME,
                                    Max([date]) AS maxday
                            FROM   [dbo].[vaccinated]
                            GROUP  BY [iso_code]) main
                        ON stagging.iso_code = main.NAME
                            AND stagging.date > main.maxday 

        TRUNCATE TABLE [stg].[stg_vaccinated]
        END

--If table exist but not data than insert all data from stg to the table

        ELSE
            INSERT INTO [dbo].[vaccinated]
            SELECT [iso_code],
                    [date],
                    [total_tests],
                    [new_tests],
                    [total_tests_per_thousand],
                    [new_tests_per_thousand],
                    [new_tests_smoothed],
                    [new_tests_smoothed_per_thousand],
                    [positive_rate],
                    [tests_per_case],
                    [tests_units],
                    [total_vaccinations],
                    [people_vaccinated],
                    [people_fully_vaccinated],
                    [total_boosters],
                    [new_vaccinations],
                    [new_vaccinations_smoothed],
                    [total_vaccinations_per_hundred],
                    [people_vaccinated_per_hundred],
                    [people_fully_vaccinated_per_hundred],
                    [total_boosters_per_hundred],
                    [new_vaccinations_smoothed_per_million],
                    [new_people_vaccinated_smoothed],
                    [new_people_vaccinated_smoothed_per_hundred]
            FROM   [stg].[stg_vaccinated] stagging