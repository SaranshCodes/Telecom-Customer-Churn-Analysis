-- churn analysis

-- What customer traits are most associated with churn?

-- contract

select `Contract` , count(*) as Total_count ,
SUM(CASE WHEN `Customer Status` = 'Churned' THEN 1 ELSE 0 END) AS Churned_Customers,
round(SUM(CASE WHEN `Customer Status` = 'Churned' THEN 1 ELSE 0 END) *100/ count(*),2) as `churn_rate` 
from customer_churn group by contract;

-- Age

SELECT 
  CASE
    WHEN age < 30 THEN 'Under 30'
    WHEN age BETWEEN 30 AND 50 THEN '30-50'
    WHEN age BETWEEN 50 AND 70 THEN '50-70'
    WHEN age > 70 THEN 'Above 70'
  END AS Age_group,
SUM(CASE WHEN `Customer Status` = 'Churned' THEN 1 ELSE 0 END) AS Churned_Customers,
ROUND(SUM(CASE WHEN `Customer Status` = 'Churned' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS `Churn Rate`
FROM customer_churn
GROUP BY 
  CASE
    WHEN age < 30 THEN 'Under 30'
    WHEN age BETWEEN 30 AND 50 THEN '30-50'
    WHEN age BETWEEN 50 AND 70 THEN '50-70'
    WHEN age > 70 THEN 'Above 70'
  END;

-- Internet Type

select `Internet Type`,count(*) as Total_Customer,
sum(case when `Customer Status` ="Churned" then 1 else 0 end) as `Churned_Customer`,
round(sum(case when `Customer Status` ="Churned" then 1 else 0 end)*100 /count(*) , 2) as `Churn Rate`
from customer_churn 
group by `internet type`;

-- Is the company losing high-value customers? 
select `Customer Status`, round(avg(`Total Revenue`),2) as Avg_revenue,
	count(*) as count  from customer_churn group by `customer status`;
  -- Yes, company is losing hihg-value customers.

