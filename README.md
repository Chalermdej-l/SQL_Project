# SQL_Project

## Table of contents

* [Project Overview](#project-overview)
* [Prerequisite](#prerequisite)
* [Reproducibility](#reproducibility)

## Project Overview

This project use the [Covid-19 data](https://covid.ourworldindata.org/) from owid github page. This data is collect daily and show each country Covid data like death, positive case, vaccinated etc.
We will store the data in [SQL server management studio](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?). After download and procees using [Python Script](/Main.ipynb) with [Pandas](https://pandas.pydata.org/) package.
And connect to sql database using [SQL Alchemy](https://pypi.org/project/SQLAlchemy/) and [Pyodbc](https://pypi.org/project/pyodbc/) for connection. In this project I aim to store the data in SQL server by using a [store procedure](sql/sp/) to load in the data.
And create [view](sql/view) for further data anylysis. We will also explore the data with select [query](sql/query) to see the currenct situation of the Covid in each country 


## Prerequisite

To reproduce this you will need [SQL server management studio](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?)

You will also need the below package.
1. [Pandas](https://pandas.pydata.org/)
2. [Matplotlib](https://matplotlib.org/)
3. [Seaborn](https://seaborn.pydata.org/)
4. [Numpy](https://numpy.org/)
5. [SQL Alchemy](https://pypi.org/project/SQLAlchemy/)
6. [Pyodbc](https://pypi.org/project/pyodbc/)

## Reproducibility
Clone this project

```
git clone https://github.com/Chalermdej-l/PortfolioProject
```

Access the clone directory

```
cd PortfolioProject
```

Intall the require package by 

```
pip install -r requirements.txt
```

Download the data from keggle

```
kaggle datasets download -d rounakbanik/the-movies-dataset -p data --unzip –force
```

Once the package is install please access the [file](/Movie.ipynb) and run the code.
