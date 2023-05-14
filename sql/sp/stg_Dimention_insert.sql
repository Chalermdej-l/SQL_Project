CREATE OR ALTER  PROCEDURE Stg_Dimention_insert
AS


/***---------------------------------------------------------------------------

Creator - Chalermdej

Objective - Procedure to load in dimention table data if table not exist will create
            If exist if insert the latest data base on the max date

---------------------------------------------------------------------------***/

--Check if table already exist if not create the table from stg table data

    IF NOT EXISTS (SELECT *
                   FROM   sys.tables
                   WHERE  NAME = 'dimention')
      SELECT [iso_code],
            case 
            when [continent] is null and location like '%income%' then 'Class' 
            when [continent] is null and location not like '%income%' then 'Continent' 
            else [continent] end as continent,
            [location],
            [population_density],
            [median_age],
            [aged_65_older],
            [aged_70_older],
            [gdp_per_capita],
            [extreme_poverty],
            [cardiovasc_death_rate],
            [diabetes_prevalence],
            [female_smokers],
            [male_smokers],
            [handwashing_facilities],
            [hospital_beds_per_thousand],
            [life_expectancy],
            [human_development_index],
            [population]
      INTO   dimention
      FROM   [stg].[stg_dimention]

--If table already exist then truncate the table and insert the new data in

    ELSE
        BEGIN
      TRUNCATE TABLE [dbo].[dimention]

        INSERT INTO [dbo].[dimention]
        SELECT [iso_code],
            case 
            when [continent] is null and location like '%income%' then 'Class' 
            when [continent] is null and location not like '%income%' then 'Continent' 
            else [continent] end as continent,
            [location],
            [population_density],
            [median_age],
            [aged_65_older],
            [aged_70_older],
            [gdp_per_capita],
            [extreme_poverty],
            [cardiovasc_death_rate],
            [diabetes_prevalence],
            [female_smokers],
            [male_smokers],
            [handwashing_facilities],
            [hospital_beds_per_thousand],
            [life_expectancy],
            [human_development_index],
            [population]
        FROM   [stg].[stg_dimention] 

        TRUNCATE TABLE [stg].[stg_dimention] 
    
        END