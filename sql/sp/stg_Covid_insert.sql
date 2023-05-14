

CREATE OR ALTER  PROCEDURE[dbo].[Stg_Covid_insert]

AS

/***---------------------------------------------------------------------------

Creator - Chalermdej

Objective - Procedure to load in covid table data if table not exist will create
            If exist if insert the latest data base on the max date

---------------------------------------------------------------------------***/

--Check if table already exist if not create the table from stg table data
    IF NOT EXISTS (SELECT *
                   FROM   sys.tables
                   WHERE  NAME = 'covid')
      SELECT *
      INTO   covid
      FROM   [stg].[stg_covid]
    ELSE
    
--Check if there is record in the table if there is find the max day and only insert the new day data

		IF exists (select top 1 * from  [dbo].[covid])
			BEGIN
			INSERT INTO [dbo].[covid]
			SELECT [iso_code],
					[date],
					[total_cases],
					[new_cases],
					[new_cases_smoothed],
					[total_deaths],
					[new_deaths],
					[new_deaths_smoothed],
					[total_cases_per_million],
					[new_cases_per_million],
					[new_cases_smoothed_per_million],
					[total_deaths_per_million],
					[new_deaths_per_million],
					[new_deaths_smoothed_per_million],
					[reproduction_rate],
					[icu_patients],
					[icu_patients_per_million],
					[hosp_patients],
					[hosp_patients_per_million],
					[weekly_icu_admissions],
					[weekly_icu_admissions_per_million],
					[weekly_hosp_admissions],
					[weekly_hosp_admissions_per_million]
			FROM   [stg].[stg_covid] stagging
					INNER JOIN (SELECT [iso_code]  AS NAME,
										Max([date]) AS maxday
								FROM   [dbo].[covid]
								GROUP  BY [iso_code]) main
							ON stagging.iso_code = main.NAME
								AND stagging.date > main.maxday 
        
			TRUNCATE TABLE [stg].[stg_covid]
        END

--If table exist but not data than insert all data from stg to the table
		ELSE
			INSERT INTO [dbo].[covid]
			SELECT [iso_code],
					[date],
					[total_cases],
					[new_cases],
					[new_cases_smoothed],
					[total_deaths],
					[new_deaths],
					[new_deaths_smoothed],
					[total_cases_per_million],
					[new_cases_per_million],
					[new_cases_smoothed_per_million],
					[total_deaths_per_million],
					[new_deaths_per_million],
					[new_deaths_smoothed_per_million],
					[reproduction_rate],
					[icu_patients],
					[icu_patients_per_million],
					[hosp_patients],
					[hosp_patients_per_million],
					[weekly_icu_admissions],
					[weekly_icu_admissions_per_million],
					[weekly_hosp_admissions],
					[weekly_hosp_admissions_per_million]
			FROM   [stg].[stg_covid] stagging



