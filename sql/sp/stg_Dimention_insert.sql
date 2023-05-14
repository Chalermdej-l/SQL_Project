CREATE OR ALTER  PROCEDURE Stg_Dimention_insert
AS
    IF NOT EXISTS (SELECT *
                   FROM   sys.tables
                   WHERE  NAME = 'dimention')
      SELECT *
      INTO   dimention
      FROM   [stg].[stg_dimention]
    ELSE
        BEGIN
      TRUNCATE TABLE [dbo].[dimention]

        INSERT INTO [dbo].[dimention]
        SELECT [iso_code],
            coalesce([continent],'Other') as continent,
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