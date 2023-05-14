SELECT top 10 
	   [iso_code]
      ,[location]
      ,[continent]
      ,[population]
      ,[total_cases]   
      ,format(death_perpopulation,'0.##%') as death_population
	  ,format(infected_perpopulation,'0.##%') as infected_population
  FROM [Covid_Database].[dbo].[Current_Overview]
  where continent not in ('Class','Continent')
  and population > 1000000
  order by death_perpopulation desc
