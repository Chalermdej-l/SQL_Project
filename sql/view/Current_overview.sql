
CREATE or ALTER view [dbo].[Current_overview] as


/***---------------------------------------------------------------------------

Creator - Chalermdej

Objective - Show the latest data for each country of what the current situation for Covid is.

---------------------------------------------------------------------------***/

SELECT c.iso_code,
	   d.location,
       d.continent    AS continent,
	   c.date,
	   d.population,
       gdp_per_capita,
	   life_expectancy,
       COALESCE(c.total_cases, 0)        AS total_cases,
       COALESCE(c.total_deaths, 0)       AS total_deaths,
       COALESCE(v.people_vaccinated, 0) AS people_vaccinated,
       COALESCE(v.people_fully_vaccinated, 0)     AS people_fully_vaccinated,

	   --Calculating the percentage per population
	    (COALESCE(c.total_cases, 0) * 1.0 ) / ( d.population * 1.0 )     AS infected_perpopulation,
        (COALESCE(c.total_deaths, 0) * 1.0 ) / ( c.total_cases * 1.0 )       AS death_infectedrate,
        (COALESCE(c.total_deaths, 0) * 1.0 ) / ( d.population * 1.0 )         AS death_perpopulation,
	    (COALESCE(v.people_vaccinated, 0)*1.0) /  ( d.population * 1.0 )    AS vaccinations_perpopulation,
	    (COALESCE(v.people_fully_vaccinated, 0)*1.0) /  ( d.population * 1.0)    AS fullyvaccinations_perpopulation
FROM   [Covid_Database].[dbo].[covid] c

--Join dimention data to get country name and population
       INNER JOIN [dbo].[dimention] d
               ON c.iso_code = d.iso_code

--Filter the covid table to get the latest data for each country
       INNER JOIN (SELECT iso_code,
                          Max(date) AS day
                   FROM   [Covid_Database].[dbo].[covid]
                   WHERE  total_cases IS NOT NULL
                   GROUP  BY iso_code) m
               ON c.date = m.day
                  AND c.iso_code = m.iso_code

--Join vaccinated table to get vaccinated data
       LEFT JOIN (SELECT iso_code AS code2,
                         people_vaccinated,
                         people_fully_vaccinated
                  FROM   [Covid_Database].[dbo].[vaccinated] v
                         INNER JOIN (SELECT iso_code  AS code,
                                            Max(date) AS day
                                     FROM   [Covid_Database].[dbo].[vaccinated]
                                     WHERE  NOT( people_vaccinated IS NULL
                                                 AND people_fully_vaccinated IS NULL
                                               )
                                     GROUP  BY iso_code) m
                                 ON v.iso_code = m.code
                                    AND v.date = m.day) v
              ON c.iso_code = v.code2 