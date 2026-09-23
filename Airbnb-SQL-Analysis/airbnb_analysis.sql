SELECT * FROM airbnb LIMIT 5

-- Total records in airbnb.
SELECT count(*) as total_record
FROM airbnb

-- No of Unique Hosts in Airbnb.
select count(distinct host_id ) as unique_hosts
from airbnb

-- All Neighbourhood from airbnb.
select count(distinct neighbourhood) as unique_neighbourhood
from airbnb

-- All cities from Airbnb
select count(distinct city) as unique_city
 from airbnb

 -- All room type count.
 select room_type,count(*) as room_count
 from airbnb
 group by room_type
 order by room_count desc

 -- Missing Values of neighbourhood group 
 select city,count(*) as city_count,
 count(neighbourhood_group) as neighbour_count
 from airbnb
 group by city
 order by city_count desc

 --Listings by ciy
 select city,count(*) as listing_count
 from airbnb
 group by city
 order by listing_count desc

 -- Average Price by city.
 select city,
 round(avg(price),2) as avg_room_price
 from airbnb
 group by city
 order by avg_room_price desc

 --Price Ranges in city
 select city,
 min(price) as minimum_price,
 max(price) as maximum_price,
 round(Avg(price),2) as average_price
 from airbnb
 group by city
 order by average_price desc

 --Which Room type Dominates.
 select room_type,
 count(*) as listing
 ,round(count(*)*100/sum(count(*)) over()
 ,2) as listing_percentage
 from airbnb
 group by room_type
order by listing desc

--Room type by city.
select room_type,city,
count(*) as listings
from airbnb
group by room_type,city
order by listings desc

-- Top 10 Neighbourhood by listings.
select neighbourhood,city,
count(*) as listings
from airbnb
group by neighbourhood,city
order by listings desc

-- Top 10 Most Expensive neighbourhood.
select city,neighbourhood,
count(*) as listings,
round(avg(price),2) as avg_price
from airbnb
group by city,neighbourhood
having count(*) >= 50
order by avg_price desc
limit 10

-- Top 10 Hosts with most listings
 select host_id,host_name as host_max_name,
 count(*) as listings
 from airbnb
 group by host_id,host_name
 order by listings desc
 limit 10

--Minimum Nights Vs Price
select minimum_nights,count(*) as listings,
round(avg(price),2) as avg_price from 
airbnb
group by minimum_nights
order by listings desc

-- Review activity by room type.
select room_type,count(*) as listings,
round(avg(number_of_reviews),2) as avg_reviews,
round(avg(reviews_per_month),2) as avg_month_reviews
from airbnb
group by room_type
order by avg_reviews desc

--Rank Neighbourhood within each city.

select city,neighbourhood,count(*) as listings,
round(avg(price),2) as avg_price,
rank() over(partition by city order by avg(price) desc)
as rnk
from airbnb group by neighbourhood,city

