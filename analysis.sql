SELECT * FROM wineqt.wineqt;

SELECT * FROM project2.wineqt;
use project2;

-- Total Number of Records 
select count(*) as Total_record from wineqt;

-- Average Wine Quality
select avg(quality) as avg_quality from wineqt;

-- Minimum and Maximum Quality
select
	max(quality) as max_quality,
    min(quality) as min_quality 
from wineqt;

-- Count Wines by Quality
select quality ,count(*) as Total_wines
from wineqt
group by quality
order by quality;

-- Average Alcohol Content by Quality
select quality ,round(avg(alcohol),2) as avg_alcohol
from wineqt
group by quality
order by quality;

-- Average Fixed Acidity by Quality
select quality ,round(avg(`fixed acidity`),2) as avg_fixed_acidity
from wineqt
group by quality
order by quality;

-- Average Volatile Acidity by Qualitywineqt
select quality ,round(avg(`volatile acidity`),2) as avg_volatile_acidity
from wineqt
group by quality
order by quality;

-- Density Analysis
select quality,round(avg(density),4) as avg_density
from wineqt
group by quality
order by quality;

-- pH Analysis
select quality ,round(avg(pH),2) as avg_pH
from wineqt
group by quality
order by quality;

-- Sulphates Impact
select quality,round(avg(sulphates),2) as avg_sulphate
from wineqt
group by quality
order by quality;

-- ###############################Correlation-Style Insights in SQL#######################################
-- High Alcohol Wines  
select count(*) as wine_quality
from wineqt
where alcohol>10;

-- High Quality Wines
select count(*) as premium_wines
from wineqt
where quality>=7;

-- Percentage of Premium Wines
SELECT 
    ROUND(
        100.0 * SUM(CASE WHEN quality >= 7 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS premium_percentage
FROM wineqt;

-- Average Chemical Properties of High-Quality Wines
select
	round(avg(`fixed acidity`),2) as avg_fixed_acidity,
    round(avg(`volatile acidity`),2) as avg_volatile_acidity,
    round(avg(`citric acid`),2) as avg_citric_acid,
    round(avg(alcohol),2) as avg_alcohol
from wineqt
where quality>=7;

-- Create Quality Labels
select quality,
case
	when quality>=7 then "highhhhh"
    when quality>=5 then "Medium"
    else "Lowwwwww"
end as quality_category
from wineqt;

-- Top 10 Highest Alcohol Wines
select * from wineqt order by alcohol desc limit 10;  

-- Wines with Low Acidity and High Quality
select * from wineqt where `volatile acidity` <0.3 and quality >=7; 

-- Standard Deviation of Alcohol
select stddev(alcohol) as quality_vairence from wineqt; 

-- Variance in Quality
select variance(quality) as Quality_varience from wineqt; 

-- Compare Average Features Between Low and High Quality Wines
SELECT
    CASE
        WHEN quality >= 7 THEN 'High Quality'
        ELSE 'Low Quality'
    END AS category,

    ROUND(AVG(alcohol),2) AS avg_alcohol,
    ROUND(AVG(`volatile acidity`),2) AS avg_volatile_acidity,
    ROUND(AVG(sulphates),2) AS avg_sulphates

FROM wineqt
GROUP BY category;

-- Rank Wines by Alcohol Content
select alcohol ,quality, rank() over (order by alcohol desc ) as alcohol_rank from wineqt; 

-- Running Average
SELECT
    quality,
    alcohol,
    AVG(alcohol) OVER (ORDER BY quality) AS running_avg_alcohol
FROM wineqt; 



-- Strong Insights 

-- Higher alcohol content is associated with better wine quality.
-- Wines with lower volatile acidity tend to receive higher ratings.
-- Density slightly decreases as wine quality increases.
-- Premium wines form only a small percentage of the dataset.
-- Sulphates and citric acid positively influence wine quality.