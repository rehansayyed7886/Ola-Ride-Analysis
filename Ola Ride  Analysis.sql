SELECT *
  FROM [Ola_Ride].[dbo].[OLA_DataSet]

--1. Retrieve all successful bookings:
    create view [dbo].[Successful_Bookings] as
    select * from [Ola_Ride].[dbo].[OLA_DataSet]
    where Booking_Status = 'Success' 

    --1. Retrieve all successful bookings:
    Select * from [dbo].[Successful_Bookings]


--2. Find the average ride distance for each vehicle type:
    create view [dbo].[Avg_Ride_Distance_By_Vehicle_Type] as
    select Vehicle_Type,  Avg(Ride_Distance) as Avg_ride_distance from [Ola_Ride].[dbo].[OLA_DataSet]
    group by Vehicle_Type;

--2. Find the average ride distance for each vehicle type:
    select * from [dbo].[Avg_Ride_Distance_By_Vehicle_Type]


--3. Get the total number of cancelled rides by customers:
    
    CREATE VIEW dbo.Cancelled_Rides_By_Customers
AS
SELECT COUNT(*) AS Cancelled_Rides_Count
FROM Ola_Ride.dbo.OLA_DataSet
WHERE LTRIM(RTRIM(Booking_Status)) = 'Canceled by Customer';

--3. Get the total number of cancelled rides by customers:
   Select * from [dbo].[Cancelled_Rides_By_Customers]


--4. List the top 5 customers who booked the highest number of rides:

CREATE VIEW dbo.Top_5_Customers AS 
select top 5 Customer_ID ,count(*) 
as Total_Rides_Booked from [Ola_Ride].[dbo].[OLA_DataSet]
group by Customer_ID
order by Total_Rides_Booked desc;

--4.List the top 5 customers who booked the highest number of rides:
SELECT * FROM [dbo].[Top_5_Customers]


--5. Get the number of rides cancelled by drivers due to personal and car-related issues:

create view dbo.Cancelled_Rides_by_Driver_P_C_Issues as
SELECT count(*) AS Cancelled_Rides_by_Driver_Count_P_C_Issues 
from [Ola_Ride].[dbo].[OLA_DataSet]
where Canceled_Rides_by_Driver in ('Personal & Car related Issue')

--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from [dbo].[Cancelled_Rides_by_Driver_P_C_Issues]

--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view dbo.Prime_Sedan_Driver_Ratings as
select max(Driver_Ratings), min(Driver_Ratings) from [Ola_Ride].[dbo].[OLA_DataSet]
where Vehicle_Type = 'Prime Sedan'

--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from [dbo].[Prime_Sedan_Driver_Ratings]

--7. Retrieve all rides where payment was made using UPI:

create view dbo.Rides_Paid_By_UPI as
select * from [Ola_Ride].[dbo].[OLA_DataSet]
where Payment_Method = 'UPI'

--7. Retrieve all rides where payment was made using UPI:
select * from [dbo].[Rides_Paid_By_UPI]

--8. Find the average customer rating per vehicle type:

create view dbo.Avg_Customer_Rating_Per_Vehicle_Type as
select Vehicle_Type, round(avg(Customer_Rating),2) as Avg_Customer_Rating from [Ola_Ride].[dbo].[OLA_DataSet]
group by Vehicle_Type

--8. Find the average customer rating per vehicle type:
select * from [dbo].[Avg_Customer_Rating_Per_Vehicle_Type]
order by Avg_Customer_Rating desc


--9. Calculate the total booking value of rides completed successfully:

create view "total booking value of rides completed successfully" as
select round(sum(Booking_Value),2) as 'Total_successful_Value' from [Ola_Ride].[dbo].[OLA_DataSet]
where Booking_Status = 'Success'

--9. Calculate the total booking value of rides completed successfully:
select * from "total booking value of rides completed successfully"

--10. List all incomplete rides along with the reason

create view Incomplete_rides_Reason_1 as 
select booking_ID,Incomplete_rides_reason 
from [Ola_Ride].[dbo].[OLA_DataSet]
where Incomplete_Rides = 'Yes';

select * from Incomplete_rides_Reason_1; 