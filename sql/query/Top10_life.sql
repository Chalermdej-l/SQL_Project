SELECT top 10 
	   [iso_code]
      ,[location]
      ,[continent]
      ,[population]
	  ,life_expectancy
      ,[total_cases]   
      ,format([infected_perpopulation],'0.##%') as infected_population
	  ,format(vaccinations_perpopulation,'0.##%') as vaccinations_population
	  ,format(death_perpopulation,'0.##%') as death_population
  FROM [Covid_Database].[dbo].[Current_Overview]
  where continent not in ('Class','Continent')
   and population > 1000000
  order by life_expectancy desc