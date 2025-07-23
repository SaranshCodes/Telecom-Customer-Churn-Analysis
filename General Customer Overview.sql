-- How many customers joined the company? 
SELECT count(`Customer Status`) as `Total Active Customers` 
	FROM customer_churn 
    WHERE `Customer Status`= "Joined";
-- What is the gender distribution (number and percentage) of joined customers?
select GENDER, count(GENDER) as COUNT, ROUND((count(GENDER) * 100)/(select count(*) from customer_churn),2) as PERCENTAGE 
	from customer_churn 
	where `Customer Status`= "Joined"
	group by  gender;
-- What is the age group distribution (number and percentage) for joined customers?
select case
	when age <30 then "Under 30"
	when age>=30 and age<50 then "30-50"
	when age between 50 and 70 then "50-70"
	when age >=70 then "Above 70"
end as Age_Group,
count(*) as count, 
round((count(age)*100)/(select count(*) from customer_churn),2) as Percentage from customer_churn 
where `Customer Status`= "Joined"
group by Age_Group;

-- Which cities have the most joined customers?
select city,count(`city`) as count 
	from customer_churn 
    where `Customer Status` ="Joined" 
    group by city 
    order by count desc 
    limit 10;

-- What types of internet services are used by joined customers (number and percentage)?
select `Internet Type`,count(`Internet Type`) as Count,
	round(count(`Internet Type`)*100/(select count(*) from customer_churn),2) as Percentage 
	from customer_churn 
    where `Customer Status`= "Joined" and `Internet Type` is NOT NULL group by `Internet Type`;

-- What is the average total revenue and monthly charge for joined customers?
select round(avg(`Total Revenue`),2) as `Average Revenue`,round(avg(`Monthly Charge`),2) as `Average Monthly Charge` 
	from customer_churn
	where `Customer Status` = "Joined";

-- What is the average monthly GB downloaded by joined customers?
select round(avg(`Avg Monthly GB Download`),2) as Avg_Monthly_GB_Download 
	from customer_churn 
	where `Customer Status`="Joined";

-- How many joined customers have unlimited data? (number and percentage)
select count(*) as `Customers having Unlimited Data` , 
round(count(`Unlimited Data`) *100 / (select count(*) from customer_churn),2) as Percentage 
	from customer_churn 
    where `Customer Status`= "Joined" and `Unlimited Data`= "Yes" ;

-- How many joined customers use each streaming service (TV, Movies, Music)?
select "Streaming TV" as "Service",count(*) 
	from customer_churn 
    where `Customer Status`= "Joined" and `Streaming TV`= "Yes" 
union all
select "Streaming Movies" ,count(*) from customer_churn 
	where `Customer Status`= "Joined" and `Streaming Movies`= "Yes"
union all
select "Streaming Music" ,count(*) from customer_churn 
	where `Customer Status`= "Joined" and `Streaming Music`= "Yes";

-- How many joined customers use all three streaming services?
select count(*) as `All Three Services` 
	from customer_churn 
	where `Customer Status`= "Joined" and 
    `Streaming TV`= "Yes" and 
    `Streaming Movies`= "Yes" and 
    `Streaming Music`= "Yes";
