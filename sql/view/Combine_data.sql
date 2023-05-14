CREATE or ALTER view [dbo].[Combine_data] as


/***---------------------------------------------------------------------------

Creator - Chalermdej

Objective - Combine all the data into one souces from all the table for futher analysis

---------------------------------------------------------------------------***/

SELECT c.[iso_code]
	  ,[continent]
      ,[location]
      ,c.[date]
      ,coalesce([total_cases],0) as total_cases
      ,coalesce([new_cases],0) as new_cases 
      ,coalesce([new_cases_smoothed],0) as new_cases_smoothed 
      ,coalesce([total_deaths],0) as total_deaths 
      ,coalesce([new_deaths],0) as new_deaths 
      ,[new_deaths_smoothed]
      ,[total_cases_per_million]
      ,[new_cases_per_million]
      ,[new_cases_smoothed_per_million]
      ,[total_deaths_per_million]
      ,[new_deaths_per_million]
      ,[new_deaths_smoothed_per_million]
      ,[reproduction_rate]
      ,[icu_patients]
      ,[icu_patients_per_million]
      ,[hosp_patients]
      ,[hosp_patients_per_million]
      ,[weekly_icu_admissions]
      ,[weekly_icu_admissions_per_million]
      ,[weekly_hosp_admissions]
      ,[weekly_hosp_admissions_per_million]	
      ,[population_density]
      ,[median_age]
      ,[aged_65_older]
      ,[aged_70_older]
      ,[gdp_per_capita]
      ,[extreme_poverty]
      ,[cardiovasc_death_rate]
      ,[diabetes_prevalence]
      ,[female_smokers]
      ,[male_smokers]
      ,[handwashing_facilities]
      ,[hospital_beds_per_thousand]
      ,[life_expectancy]
      ,[human_development_index]
      ,[population]
      ,coalesce([total_tests],0) as total_tests
      ,coalesce([new_tests],0) as new_tests
      ,[total_tests_per_thousand]
      ,[new_tests_per_thousand]
      ,[new_tests_smoothed]
      ,[new_tests_smoothed_per_thousand]
      ,[positive_rate]
      ,[tests_per_case]
      ,[tests_units]
      ,coalesce([total_vaccinations],0) as total_vaccinations
      ,coalesce([people_vaccinated],0) as people_vaccinated
      ,coalesce([people_fully_vaccinated],0) as people_fully_vaccinated
      ,coalesce([total_boosters],0) as total_boosters
      ,coalesce([new_vaccinations],0) as new_vaccinations
      ,[new_vaccinations_smoothed]
      ,[total_vaccinations_per_hundred]
      ,[people_vaccinated_per_hundred]
      ,[people_fully_vaccinated_per_hundred]
      ,[total_boosters_per_hundred]
      ,[new_vaccinations_smoothed_per_million]
      ,[new_people_vaccinated_smoothed]
      ,[new_people_vaccinated_smoothed_per_hundred]
      ,[excess_mortality_cumulative_absolute]
      ,[excess_mortality_cumulative]
      ,[excess_mortality]
      ,[excess_mortality_cumulative_per_million]
  FROM   [Covid_Database].[dbo].[covid] c
                INNER JOIN [dbo].[vaccinated] v ON c.iso_code = v.iso_code AND c.date = v.date
                INNER JOIN [dbo].[dimention] d ON c.iso_code = d.iso_code
			    LEFT JOIN [dbo].[excess] e ON c.iso_code = e.iso_code and c.date = e.date