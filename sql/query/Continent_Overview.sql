SELECT top 10 
	   [iso_code]
      ,[location]
      ,[continent]
      ,[population]
      ,format([population]*1.0 / sum([population]) over (partition by continent),'0.##%') as percent_oftotal
      ,[total_cases]   
      ,format(death_perpopulation,'0.##%') as death_population
	  ,format(infected_perpopulation,'0.##%') as infected_population
	  ,format(vaccinations_perpopulation,'0.##%') as vaccinations_population
	  ,format(fullyvaccinations_perpopulation,'0.##%') as fullyvaccinations_population
  FROM [Covid_Database].[dbo].[Current_Overview]
  where continent = 'Continent'
  order by population desc