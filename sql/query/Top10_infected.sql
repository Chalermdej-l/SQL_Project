SELECT top 10 
	   [iso_code]
      ,[location]
      ,[continent]
      ,[population]
      ,[total_cases]   
      ,format([infected_perpopulation],'0.##%') as infected_population
	  ,format(vaccinations_perpopulation,'0.##%') as vaccinations_population
  FROM [Covid_Database].[dbo].[Current_Overview]
  where continent not in ('Class','Continent')
  and population > 1000000
  order by infected_perpopulation desc