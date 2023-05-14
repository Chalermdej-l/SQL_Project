import sqlalchemy

class configcovid:

    # data type config
    str_col = ['iso_code' ,'continent','location','tests_units']
    date_col = ['date']
    float_col = ['total_cases','new_cases','new_cases_smoothed','total_deaths','new_deaths','new_deaths_smoothed','total_cases_per_million','new_cases_per_million','new_cases_smoothed_per_million','total_deaths_per_million','new_deaths_per_million','new_deaths_smoothed_per_million','reproduction_rate','icu_patients','icu_patients_per_million','hosp_patients','hosp_patients_per_million','weekly_icu_admissions','weekly_icu_admissions_per_million','weekly_hosp_admissions','weekly_hosp_admissions_per_million','total_tests','new_tests','total_tests_per_thousand','new_tests_per_thousand','new_tests_smoothed','new_tests_smoothed_per_thousand','positive_rate','tests_per_case','total_vaccinations','people_vaccinated','people_fully_vaccinated','total_boosters','new_vaccinations','new_vaccinations_smoothed','total_vaccinations_per_hundred','people_vaccinated_per_hundred','people_fully_vaccinated_per_hundred','total_boosters_per_hundred','new_vaccinations_smoothed_per_million','new_people_vaccinated_smoothed','new_people_vaccinated_smoothed_per_hundred','stringency_index','population_density','median_age','aged_65_older','aged_70_older','gdp_per_capita','extreme_poverty','cardiovasc_death_rate','diabetes_prevalence','female_smokers','male_smokers','handwashing_facilities','hospital_beds_per_thousand','life_expectancy','human_development_index','population','excess_mortality_cumulative_absolute','excess_mortality_cumulative','excess_mortality','excess_mortality_cumulative_per_million']

    # table name and type
    dimention_col = {
    'iso_code':sqlalchemy.VARCHAR(10)    
    ,'continent':sqlalchemy.VARCHAR(50)   
    ,'location':sqlalchemy.VARCHAR(100)   
    ,'population_density':sqlalchemy.DECIMAL(10,3)
    ,'median_age':sqlalchemy.DECIMAL(5,3)
    ,'aged_65_older':sqlalchemy.DECIMAL(10,3)
    ,'aged_70_older':sqlalchemy.DECIMAL(10,3)
    ,'gdp_per_capita':sqlalchemy.DECIMAL(10,3)
    ,'extreme_poverty':sqlalchemy.DECIMAL(5,3)
    ,'cardiovasc_death_rate':sqlalchemy.DECIMAL(10,3)
    ,'diabetes_prevalence':sqlalchemy.DECIMAL(10,3)
    ,'female_smokers':sqlalchemy.DECIMAL(5,3)
    ,'male_smokers':sqlalchemy.DECIMAL(5,3)
    ,'handwashing_facilities':sqlalchemy.DECIMAL(10,3)
    ,'hospital_beds_per_thousand':sqlalchemy.DECIMAL(5,3)
    ,'life_expectancy':sqlalchemy.DECIMAL(10,3)
    ,'human_development_index':sqlalchemy.DECIMAL(10,3)
    ,'population':sqlalchemy.BigInteger
    }

    covid_col = {
    'iso_code':sqlalchemy.VARCHAR(10)    
    ,'date':sqlalchemy.Date()
    ,'total_cases':sqlalchemy.BIGINT()
    ,'new_cases':sqlalchemy.Integer()
    ,'new_cases_smoothed':sqlalchemy.DECIMAL(10,3)
    ,'total_deaths':sqlalchemy.BIGINT()
    ,'new_deaths':sqlalchemy.Integer()
    ,'new_deaths_smoothed':sqlalchemy.DECIMAL(10,3)
    ,'total_cases_per_million':sqlalchemy.DECIMAL(10,3)
    ,'new_cases_per_million':sqlalchemy.DECIMAL(10,3)
    ,'new_cases_smoothed_per_million':sqlalchemy.DECIMAL(10,3)
    ,'total_deaths_per_million':sqlalchemy.DECIMAL(10,3)
    ,'new_deaths_per_million':sqlalchemy.DECIMAL(10,3)
    ,'new_deaths_smoothed_per_million':sqlalchemy.DECIMAL(10,3)
    ,'reproduction_rate':sqlalchemy.DECIMAL(10,3)
    ,'icu_patients':sqlalchemy.Integer()
    ,'icu_patients_per_million':sqlalchemy.DECIMAL(10,3)
    ,'hosp_patients':sqlalchemy.Integer()
    ,'hosp_patients_per_million':sqlalchemy.DECIMAL(10,3)
    ,'weekly_icu_admissions':sqlalchemy.Integer()
    ,'weekly_icu_admissions_per_million':sqlalchemy.DECIMAL(10,3)
    ,'weekly_hosp_admissions':sqlalchemy.Integer()
    ,'weekly_hosp_admissions_per_million':sqlalchemy.DECIMAL(10,3)
    }

    vaccinated_col = {
    'iso_code':sqlalchemy.VARCHAR(10)    
    ,'date':sqlalchemy.Date()
    ,'total_tests':sqlalchemy.BIGINT()
    ,'new_tests':sqlalchemy.BIGINT()
    ,'total_tests_per_thousand':sqlalchemy.DECIMAL(10,3)
    ,'new_tests_per_thousand':sqlalchemy.DECIMAL(10,3)
    ,'new_tests_smoothed':sqlalchemy.BIGINT()
    ,'new_tests_smoothed_per_thousand':sqlalchemy.DECIMAL(10,3)
    ,'positive_rate':sqlalchemy.DECIMAL(10,3)
    ,'tests_per_case':sqlalchemy.DECIMAL(10,3)
    ,'tests_units':sqlalchemy.VARCHAR(30)    
    ,'total_vaccinations':sqlalchemy.BIGINT()
    ,'people_vaccinated':sqlalchemy.BIGINT()
    ,'people_fully_vaccinated':sqlalchemy.BIGINT()
    ,'total_boosters':sqlalchemy.BIGINT()
    ,'new_vaccinations':sqlalchemy.BIGINT()
    ,'new_vaccinations_smoothed':sqlalchemy.BIGINT()
    ,'total_vaccinations_per_hundred':sqlalchemy.DECIMAL(10,3)
    ,'people_vaccinated_per_hundred':sqlalchemy.DECIMAL(10,3)
    ,'people_fully_vaccinated_per_hundred':sqlalchemy.DECIMAL(10,3)
    ,'total_boosters_per_hundred':sqlalchemy.DECIMAL(10,3)
    ,'new_vaccinations_smoothed_per_million':sqlalchemy.DECIMAL(10,3)
    ,'new_people_vaccinated_smoothed':sqlalchemy.BIGINT()
    ,'new_people_vaccinated_smoothed_per_hundred':sqlalchemy.DECIMAL(10,3)
    }
    excess_col = {
    'iso_code':sqlalchemy.VARCHAR(10)    
    ,'date':sqlalchemy.Date()
    ,'excess_mortality_cumulative_absolute':sqlalchemy.DECIMAL(10,3)
    ,'excess_mortality_cumulative':sqlalchemy.DECIMAL(10,3)
    ,'excess_mortality':sqlalchemy.DECIMAL(10,3)
    ,'excess_mortality_cumulative_per_million':sqlalchemy.DECIMAL(10,3)
    }

    sp_Covid = open('sql/sp/stg_Covid_insert.sql').read()
    sp_Vaccinated = open('sql/sp/stg_Vaccinated_insert.sql').read()
    sp_Dimention = open('sql/sp/stg_Dimention_insert.sql').read()
    sp_Excess = open('sql/sp/stg_Excess_insert.sql').read()

    sp_list =[sp_Covid,sp_Vaccinated,sp_Dimention,sp_Excess]
    sp_excute_list = ['Stg_Covid_insert','Stg_Vaccinated_insert','Stg_Dimention_insert','Stg_Excess_insert']