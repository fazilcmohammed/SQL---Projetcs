# The Vet's Clinic
This project delves into the fascinating world of animal healthcare through the lens of data analysis. We'll utilize SQL, a powerful language for working with relational databases, to uncover valuable insights from a veterinary clinic's data.

## Project Overview
In this project, I am assisting the veterinarian clinic to make sense of their data. Their data is dispersed across multiple csv file and they need first to upload all the data to database and then performing the analysis.

### Project Scope
Veterinary clinics play a crucial role in safeguarding the well-being of animals, forming deep bonds with pet owners and their furry companions. The data exploration phase involved SQL queries to extract, clean, and transform the dataset for analysis. Subsequently, a Tableau dashboard was developed to visualize key insights and trends. By analyzing their data,   we can gain a deeper understanding of:

Patient demographics: Explore the types of animals treated, their breeds, and age distributions.
Common procedures and treatments: Identify the most frequently performed procedures, medications prescribed, and potential seasonal trends.
Financial performance: Analyze revenue generated from different services, identify areas for potential growth, and understand client spending habits.
Client trends: Track client appointment history, identify patterns in pet ownership, and gain insights into client behavior.

### Tools and Technologies:
The project utilized the following tools and technologies:
* __SQL (Structured Query Language)__: The primary language used for data manipulation, exploration, and analysis.
* __SQL Server Management Studio (SSMS)__: For database creation, data parsing, and initial data exploration.
* __Tableau__: For creating a variety of visualizations and interactive dashboards based on SQL query findings.
* __Excel__: While not directly used in the project, the dataset obtained from 'Our World in Data' was in Excel format, serving as the initial file type for data exploration.

This combination of tools facilitated a comprehensive approach to the analysis, from database creation and exploration using SQL to visual representation and interactive dashboards in Tableau. The dataset's initial format in Excel underscored the importance of diverse tools in handling and extracting insights from real-world datasets.
### Data Exploration
The Vet's Clinic dataset includes information on Pet details contains name, kind, gender, age of pet, owner details like owner name, address, state, procedure history carry date of procedure, type of procedure, and procedure details like procedure type and code, details, price, etc.
* database_creation.sql: This script focuses on creating databases and creating tables with the provided csv files and performing initial data processing steps to prepare the dataset for analysis.
* Created a virtual table environment with the help of view function in sql for various complex operations.
* data_exploration.sql: This script consists of steps taken after the initial database creation, focusing on extracting relevant data for exploratory data analysis. It includes the following tasks:
Selecting relevant data for analysis, including metrics such as total cases, procedures types, etc.
Finding potential Key Performance Indicators (KPIs) such as total patients, total revenue, and count of available procedure types.
Conducting major analysis:
  - Extracting information on pets names and owner names side-by-side.
  - Finding out which pets from this clinic had procedures performed.
  - Match up all procedures performed to their descriptions.
  - Extracting a table of individual costs (procedure prices) incurred by owners of pets from the clinic in question (this table should have owner and procedure price side -by-side)

### Tableau Dashboard
#### Access the live dashboard on Tableau Public : [The Vet's Clinic Dashboard](https://public.tableau.com/app/profile/mohammed.fazil.c/viz/TheVetsClinic/Dashboard1?publish=yes)

The Tableau dashboard was designed to visualize key insights and trends in Vets Clini, including total patients, revenue, procedure types, and their details. The dashboard includes KPIs, text charts, column chart, pie chart and line graphs to provide a comprehensive overview of the pandemic's impact.

### Dashboard Components:
* Key Performance Indicators (KPIs):
  - Total number of patients
  - Total revenue generated
  - Number of procudere types in clinic
* Column Chart :
  - Type of animales treated most.
* Line chart:
  - Revenue by Procedure per month
  - Admissions per month
* Pie Chart:
  - Total Revenue per Procedure type
