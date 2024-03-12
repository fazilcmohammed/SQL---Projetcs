# Apple Store Analysis

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

+ __Total Apps:__
  
      SELECT COUNT(id) number_of_apps
      FROM applestore;
![2 KPI 1](https://github.com/fazilcmohammed/SQL---Projetcs/assets/140707546/351ee3ee-2d96-4014-abdd-37e598144211)

There are 7197 apps are there in the dataset when the data collected from applestore.

+ __App_Genres:__

      SELECT COUNT(DISTINCT prime_genre) app_genres
      FROM applestore
![3 KPI 2](https://github.com/fazilcmohammed/SQL---Projetcs/assets/140707546/6fe60d17-739f-41e3-aa6a-8bc6a69c5026)

The collection includes apps with generes in 23 categories like gaming, shopping, finance, and much more.

+ __Total Revenue:__

      SELECT ROUND(SUM(price), 0) AS Total_revenue
      FROM applestore
![1  KPI 3](https://github.com/fazilcmohammed/SQL---Projetcs/assets/140707546/318c66b6-d886-4b10-b9f3-59eabb0bb62b)  

Applestore has generated a revenue around $12424.
  
  
__2) Check the unique number of apps in both tables.__

* Number of apps in applestore table

      SELECT COUNT(DISTINCT id) apps_in_applestore_table
      FROM applestore 
![2 1](https://github.com/fazilcmohammed/SQL---Projetcs/assets/140707546/46512fe8-76dd-4ddd-8847-7214d687dc37)

* Number of apps in applestore description table

      SELECT COUNT(DISTINCT id) apps_in_applestore_description_table
      FROM applestore_description_combined
![2 2](https://github.com/fazilcmohammed/SQL---Projetcs/assets/140707546/ee1b1beb-4562-497e-91a8-c9cbf4f55b09)

By running both these queries, we can see that total 7197 unique apps and their descriptions are available on the provided datasets.

__3) Check is there have missing values.__

* Missing values in applestore table

      SELECT COUNT(*) missingvalues
      FROM applestore
      WHERE track_name IS NULL OR user_rating IS NULL OR prime_genre IS NULL
![3](https://github.com/fazilcmohammed/SQL---Projetcs/assets/140707546/7128b50e-368d-4d9a-bb2e-bbe9b241ac57)

* Missing values in applestore description table

      SELECT COUNT(*) missingvalues_in_applestoredescription
      FROM applestore_description_combined
      WHERE app_desc IS NULL
![3 1](https://github.com/fazilcmohammed/SQL---Projetcs/assets/140707546/7b8469e2-b0f7-4cf8-8245-a1a4fe085439)

We checked for null values present in the applestore table by checking the track_name(name of apps), user_rating(rating given by users) and prime_genre(genre of apps) columns.
And no null values are present. Also done with the appstore description table and again no missing values has found.

__4) Find out the number of apps per genre.__

      SELECT prime_genre, COUNT(*) numapps 
      FROM applestore
      GROUP BY prime_genre
      ORDER BY numapps DESC
![4](https://github.com/fazilcmohammed/SQL---Projetcs/assets/140707546/2bb8a2a9-9c68-460c-8386-b2b170e7df24)

__5) Check if apps with more supported languages have higher ratings.__

    SELECT CASE 
	  WHEN lang_num > 10 THEN '<10 languages'
	  WHEN lang_num BETWEEN 10 AND 30 THEN '10-30 languages'
	  ELSE '>10 languages'
		END AS language_bucket,
		AVG(user_rating) apprating
    FROM applestore
    GROUP BY CASE
		WHEN lang_num > 10 THEN '<10 languages'
		WHEN lang_num BETWEEN 10 AND 30 THEN '10-30 languages'
		ELSE '>10 languages'
		END
    ORDER BY apprating DESC
![5](https://github.com/fazilcmohammed/SQL---Projetcs/assets/140707546/d41eee67-a289-4bb8-b68c-7b90a97af2d8)

Language is an important element in applications. From the query above, there is a possible positive correlation between the number of languages supported by an app and its average rating. This means that apps with more supported languages tend to have higher average ratings.

__6) Show the app genres with low rating.__

    SELECT TOP 10 prime_genre, AVG(user_rating) avgrating
    FROM applestore
    GROUP BY prime_genre
    ORDER BY avgrating
![6](https://github.com/fazilcmohammed/SQL---Projetcs/assets/140707546/9abba487-579f-45fc-89cb-be459bc47003)

Here are the app genres with the lowest average ratings:
* Catalogs with an average rating of 2.1
* Finance with an average rating of 2.43
* Book with an average rating of 2.48
* Navigation with an average rating of 2.68
* Lifestyle with an average rating of 2.81

__7) is there have a correlation between the length of the app description and the user rating.__

    SELECT CASE
		WHEN LEN(b.app_desc) < 100 THEN 'short'
		WHEN LEN(b.app_desc) BETWEEN 500 AND 1000 THEN 'medium'
		ELSE 'long'
		END AS description_length_bucket,
		AVG(a.user_rating) AS avg_rating
    FROM applestore a
    JOIN applestore_description_combined b
    ON a.id = b.id
    GROUP BY CASE
		WHEN LEN(b.app_desc) < 100 THEN 'short'
		WHEN LEN(b.app_desc) BETWEEN 500 AND 1000 THEN 'medium'
		ELSE 'long'
		END
    ORDER BY avg_rating DESC
![7](https://github.com/fazilcmohammed/SQL---Projetcs/assets/140707546/df023022-3954-4c41-96df-76ef69c74fb3)

Yes. There is a small correlation between the app description and user rating. We can say that the users are giving a huge description on the app and also giving good rating to the application.

__8) List the top rated apps for each genre.__

    SELECT prime_genre, track_name, user_rating
    FROM (SELECT
		prime_genre,
		track_name,
		user_rating,
		RANK() OVER (PARTITION BY prime_genre ORDER BY user_rating DESC, rating_count_tot DESC) AS RANK
		FROM applestore) AS a
    WHERE a.RANK = 1
![8](https://github.com/fazilcmohammed/SQL---Projetcs/assets/140707546/7a82e9c2-7605-4ee9-8cd5-28523a7066e3)

The top rated apps for each genre includes Color Therapy for adults from Book genre, then Turbo-Scan from genre Business, followed by Mobile Classifieds from genre Catalog. These are 3 books and genres from the huge list.

## Recommendations
