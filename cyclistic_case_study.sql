/*

This is the SQL queries used to import, clean, and analyse data from Cyclistic.
Cyclistic (Divvy) is a fictional bike sharing company used for the capstone project of the Google Data Analytics Professional Certificate.

The database used is pgadmin4 for PostgreSQL.

Steps in this case study used:
1.) downloaded csv files from public data
2.) imported each csv file into one table
3.) check if any data needs to be cleaned
4.) create queries for data visualization

*/

--Step 3--

select ride_id, count(1)
from public."2023_2022"
group by ride_id
having count(1) > 1;

select *
from public."2023_2022"
where started_at is null and ended_at is null;

select *
from public."2023_2022"
where started_at is null or ended_at is null;

--Step 4--

--Calculate ride_length
SELECT (ended_at - started_at) AS ride_length
FROM public."2023_2022"
WHERE member_casual ='member'

SELECT (ended_at - started_at) AS ride_length
FROM public."2023_2022"
WHERE member_casual ='casual'

--Calculate usage by type of bike
SELECT rideable_type, COUNT(*)
FROM public."2023_2022"
WHERE member_casual ='member'
GROUP BY rideable_type

SELECT rideable_type, COUNT(*)
FROM public."2023_2022"
WHERE member_casual ='casual'
GROUP BY rideable_type

--Calculate usage of bikes by day of the week
SELECT EXTRACT (isodow FROM started_at) AS dow, COUNT (*)
FROM public."2023_2022"
WHERE member_casual ='member'
GROUP BY dow

SELECT EXTRACT (isodow FROM started_at) AS dow, COUNT (*)
FROM public."2023_2022"
WHERE member_casual ='casual'
GROUP BY dow

--Calculate by hour of day
SELECT EXTRACT (HOUR FROM started_at) AS per_hour, COUNT (*)
FROM public."2023_2022"
WHERE member_casual ='member'
GROUP BY per_hour
ORDER BY per_hour ASC

SELECT EXTRACT (HOUR FROM started_at) AS per_hour, COUNT (*)
FROM public."2023_2022"
WHERE member_casual ='casual'
GROUP BY per_hour
ORDER BY per_hour ASC

--Usage by month
SELECT EXTRACT (MONTH FROM started_at) AS per_month, COUNT (*)
FROM public."2023_2022"
WHERE member_casual ='member'
GROUP BY per_month
ORDER BY per_month ASC

SELECT EXTRACT (MONTH FROM started_at) AS per_month, COUNT (*)
FROM public."2023_2022"
WHERE member_casual ='casual'
GROUP BY per_month
ORDER BY per_month ASC
