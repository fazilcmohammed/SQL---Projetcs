#### Tools used:
#### SQL - for querying the data
#### Tableau - for visualization

## Business Problem
The ever-changing mobile landscape is a challenging space to navigate. . The percentage of mobile over desktop is only increasing. Android holds about 53.2% of the smartphone market, while iOS is 43%. To get more people to download the app, they need to make sure they can easily find the app. Mobile app analytics is a great way to understand the existing strategy to drive growth and retention of future user.
Here, I have a huge collection of data from app store of Apple and going to analyse the data effectively and extract meaningfull insights like the overview of user ratings for each application, apps per genre, user ratings for paid and free application and other key business metrics. Visualisations must also be created to identify trends and insights best and least genres application, the correlation between the app description and user rating, etc.  The end goal is to equip the business with data-driven insights that inform strategic decisions to improve operations and profitability. 

## Solution Plan
* For gaining valuable insights from their app store data CSV file, I will utilize SQL and data visualization with Tableau to extract relevant information and conduct insightful analyses. Data cleaning/processing, data transformation and analysis shall be done.
* By leveraging SQL's functions, I can uncover key metrics like total revenue, average user rating, and best/worst applicaitons in app store.
* Once the data has been extracted and prepared, I will leverage Tableau to present the findings through interactive visualizations. This will allow stakeholders to gain actionable insights into trending applications, user patterns, and performance through visually compelling charts, graphs, and reports.
* The end goal is equipping the business with data-driven insights to inform strategic decisions that improve operations and profitability.

## Execution
### Questions answered from the dataset:

__1) What are the Key Performance Indicators obtained from the Dataset?__

+ __Total Revenue:__
  
      SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;
### 1) Check the unique number of apps in both appstoretables.

      SELECT COUNT(DISTINCT PetID) FROM procedureshistory;
