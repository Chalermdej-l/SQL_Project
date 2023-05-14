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

To reproduce this you will need to install [SQL server management studio](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?) and host a local server.

Once install you will need to create a database with the name `Covid_Database`

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
git clone https://github.com/Chalermdej-l/SQL_Project.git
```

Access the clone directory

```
cd SQL_Project
```

Intall the require package by 

```
pip install -r requirements.txt
```

Once the package is install please access the [file](/Main.ipynb) and run the code.

The script will download the data and store the data in a stagging table and create a [store procedure](sql/sp/) to insert the file
If the table does not exist yet this will create one and this script will also create a [view](sql/view) to use in the select [query](sql/query).
