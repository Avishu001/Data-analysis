--Ques 1. What is the total number of reservations in the dataset?
select count(Booking_ID) as Total_Reservations
from hotel_reservation_data

--Ques 2. Which meal plan is the most popular among guests?
-- We can use TOP 1 in below query the result will be the Meal Plan 1
select type_of_meal_plan,count(type_of_meal_plan) as Popularity 
from hotel_reservation_data
group by type_of_meal_plan 
order by count(type_of_meal_plan) desc

--Ques 3. What is the average price per room for reservations involving children?
select avg(cast(avg_price_per_room as decimal(10,2))) as Average_price
from hotel_reservation_data 
where no_of_children>0

--Ques 4. How many reservations were made for the year 20XX (replace XX with the desired year)?
select COUNT(Booking_ID) as Reservation_Year 
from hotel_reservation_data
where year(arrival_date)=2018

--Ques 5. What is the most commonly booked room type?-- We can use Top 1 in below query which will give us Room_Type_1 record select room_type_reserved,count(room_type_reserved) as no_of_reservationfrom hotel_reservation_datagroup by room_type_reservedorder by count(room_type_reserved) desc--Ques 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?select Count(Booking_ID) as Weekend_Reservationfrom hotel_reservation_data where no_of_weekend_nights>0--Ques 7. What is the highest and lowest lead time for reservations?select max(lead_time) as Highest_lead_time ,min(lead_time) as Lowest_lead_timefrom hotel_reservation_data--Ques 8. What is the most common market segment type for reservations?-- We can use TOP 1 in below query which will give us Online market segment with 518 bookingsselect market_segment_type,count(market_segment_type) as no_of_reservationfrom hotel_reservation_datagroup by market_segment_typeorder by count(market_segment_type) desc--Ques 9. How many reservations have a booking status of "Confirmed"?select count(Booking_ID) as Confirmed_booking from hotel_reservation_datawhere booking_status='Not_Canceled'--Ques 10. What is the total number of adults and children across all reservations?select sum(no_of_adults) as Total_Adults, sum(no_of_children) as Total_Childrenfrom hotel_reservation_data--Ques 11. What is the average number of weekend nights for reservations involving children?select avg(cast(no_of_weekend_nights as decimal(10,2))) as Avg_no_of_Weekend_nightfrom hotel_reservation_datawhere no_of_children>0--Ques 12. How many reservations were made in each month of the year?select datename(month,arrival_date) as Months ,count(datename(month,arrival_date)) as no_of_reservationsfrom hotel_reservation_datagroup by datename(month,arrival_date),DATEPART(mm, arrival_date)order by DATEPART(mm, arrival_date)--Ques 13. What is the average number of nights (both weekend and weekday) spent by guests --		   for each room type?select room_type_reserved, avg(cast(no_of_week_nights+no_of_weekend_nights as decimal(10,2))) as Average_Nightsfrom hotel_reservation_datagroup by room_type_reserved--Ques 14. For reservations involving children, what is the most common room type, and what is the average
--         price for that room type?-- We can also use TOP 1 in the below query with that it will only show the first record i.e. Room_Type_1 recordselect room_type_reserved,count(Booking_ID) as Bookings_with_children,avg(avg_price_per_room)as Average_Price from hotel_reservation_data where no_of_children>0group by room_type_reserved --Ques 15. Find the market segment type that generates the highest average price per room.select market_segment_type,avg(cast(avg_price_per_room as decimal(10,2))) as Average_Pricefrom hotel_reservation_datagroup by market_segment_type order by avg(avg_price_per_room) desc 