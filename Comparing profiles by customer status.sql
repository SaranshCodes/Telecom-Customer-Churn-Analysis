--  What is the gender distribution for churned, joined, and stayed customers?
with status_customer as 
(select `customer status`,count(*) as total_count from customer_churn group by `Customer Status`)
select c.`customer status` , c.gender, count(*) as count,
round((count(*)*100)/ (select st.total_count ),2) as percentage from customer_churn as c 
join status_customer as st
on c.`customer status`=st.`customer status`
group by `customer status`,gender
order by `customer status`,gender;

-- What is the age group distribution for each customer status (churned, joined, stayed)?
with age_customer as(
select `Customer Status`, 
case
	when age <30 then "Under 30"
	when age>=30 and age<50 then "30-50"
	when age between 50 and 70 then "50-70"
	when age >=70 then "Above 70"
end as Age_group,
count(*) as count
from customer_churn group by `Customer Status`,
case
	when age <30 then "Under 30"
	when age>=30 and age<50 then "30-50"
	when age between 50 and 70 then "50-70"
	when age >=70 then "Above 70"
end),
status_total as(
select `Customer Status`, count(*) as total_count from customer_churn group by `Customer Status`)
select a.`Customer Status`,a.age_group,a.count,
round(a.count*100 / (select st.total_count),2) as percentage from Age_customer as a
join status_total as st on 
a.`Customer Status`=st.`Customer Status`
order by a.`Customer Status`,a.age_group;
 
-- Which cities have the most churned, joined, and stayed customers?
select city,`Customer status`,count(*) as count from customer_churn 
group by city,`customer status`  
order by count desc;

-- What internet service types are used across the three customer statuses (with % and count)?
with status_customer as (select `customer status`, count(*) as total_count from customer_churn group by `customer status`)
select `internet type` , c.`customer status`, count(*) as count,
round(count(*) *100 / (select st.total_count),2) as percentage from customer_churn as c 
join
 status_customer as st 
 on st.`Customer Status`=c.`Customer Status`
group by `internet type`,`customer status`;

-- What is the average revenue and average GB consumed per status?
select `customer status`,
round(avg(`total revenue`),2) as `Average total revenue`,
round(avg(`avg monthly gb download`),2) as `Average GB consumed` 
from customer_churn group by `customer status`;

-- How does unlimited data usage vary between churned, joined, and stayed customers?
select `customer status`, count(*) as count, 
round(count(*)*100/(select count(*) from customer_churn where `unlimited data`="yes"),2) as percentage 
from customer_churn where `unlimited data`="Yes" 
group by `customer status`;

-- How many customers with each status use streaming TV, movies, or music?
select `customer status` ,
sum(case 
when `streaming tv`="yes" then 1 else 0 end) as streaming_tv,
sum(case 
when `streaming movies`="yes" then 1 else 0 end) as streaming_movies,
sum(case 
when `streaming music`="yes" then 1 else 0 end) as streaming_music 
from customer_churn group by `customer status`;

-- How many churned/stayed/joined customers use all streaming services?

select count(*) as Total_users from customer_churn
 where `streaming tv`="yes" and `streaming movies`="yes" and `streaming music`="yes";