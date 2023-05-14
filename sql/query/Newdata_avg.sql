WITH Combine_newdata
     AS (SELECT iso_code,
                continent,
                population,
                location,
                date,
                new_cases,
                new_deaths,
                new_tests,
                new_vaccinations,
				people_fully_vaccinated,
				people_vaccinated
         FROM    [Covid_Database].[dbo].[Combine_data])
SELECT d1.date,
       d1.iso_code,
       d1.location,
       d1.continent,
       COALESCE((d1.people_vaccinated), 0)*1.0 /  ( d1.population * 1.0 )    AS vaccinations_perpopulation,
	   COALESCE((d1.people_fully_vaccinated), 0)*1.0 /  ( d1.population * 1.0 )    AS fullyvaccinations_perpopulation,
       --New test
       Max(COALESCE(d1.new_tests, 0)) AS new_tests,
       Format(COALESCE(Sum(d2.new_tests),0) * 1.0 / 30.0, '0.##') AS newtests_monthlyavg,
       Max(COALESCE(d1.new_tests, 0)) - (COALESCE(Sum(d2.new_tests),0) / 30 ) AS newtests_toavg,

       --New case       
       Max(COALESCE(d1.new_cases, 0)) AS new_cases,
       Format(COALESCE(Sum(d2.new_cases),0) * 1.0 / 30.0, '0.##') AS newcases_monthlyavg,
       Max(COALESCE(d1.new_cases, 0)) - (COALESCE(Sum(d2.new_cases),0) / 30 ) AS newcases_toavg,

       --New death       
       Max(COALESCE(d1.new_deaths, 0)) AS new_deaths,
       Format(COALESCE(Sum(d2.new_deaths),0) * 1.0 / 30.0, '0.##') AS newdeaths_monthlyavg,
       Max(COALESCE(d1.new_deaths, 0)) - (COALESCE(Sum(d2.new_deaths),0) / 30 ) AS newdeaths_toavg,

       --New vaccination       
       Max(COALESCE(d1.new_vaccinations, 0)) AS new_vaccinations,
       Format(COALESCE(Sum(d2.new_vaccinations),0) * 1.0 / 30.0, '0.##') AS newvaccinations_monthlyavg,
       Max(COALESCE(d1.new_vaccinations, 0)) - (COALESCE(Sum(d2.new_vaccinations),0) / 30 ) AS newvaccination_toavg
FROM   Combine_newdata d1
       LEFT JOIN Combine_newdata d2
              ON d1.iso_code = d2.iso_code
                 AND Datediff(day, d1.date, d2.date) < 0
                 AND Datediff(day, d1.date, d2.date) >- 30
GROUP  BY d1.date,
          d1.iso_code,
          d1.location,
          d1.continent,
		  d1.people_fully_vaccinated,
		  d1.people_vaccinated,
		  d1.population
ORDER  BY d1.iso_code,
          d1.date 