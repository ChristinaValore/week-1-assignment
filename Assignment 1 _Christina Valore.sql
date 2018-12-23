/*Christina Valore
Winter Bridge 2018
12/23/18*/

/* 1. Which destination in the flights database is the furthest distance away, based on information in 
the flights table. Show the SQL query(s) that support your conclusion.

The furthest destination is flight 51 from JFK to HNL with a distance of 4,983 miles.*/

select distinct flight, origin, dest, distance from flights.flights where distance in (select max(distance) from flights.flights) ;

/*2. What are the different numbers of engines in the planes table?  For each number of engines, which aircraft have 
the most number of seats?  Show the SQL statement(s) that support your result. 

The aircrafts can have 1, 2, 3 or 4 engines. The aircraft with 4 engines holds the max number of seats at 450.*/

select engines, max(seats) from flights.planes group by engines;

/*3. Show the total number of flights.

The total number of flights is 336,776.*/

select count(*) from flights;

/*4. Show the total number of flights by airline (carrier).*/

select carrier, count(*) from flights group by carrier;

/*carrier  count(*)
9E	  18460
AA	  32729
AS	  714
B6	  54635
DL	  48110
EV	  54173
F9	  685
FL	  3260
HA	  342
MQ	  26397
OO	  32
UA	  58665
US	  20536
VX	  5162
WN	  12275
YV	  601*/


/*5. Show all of the airlines, ordered by number of flights in descending order.*/

select carrier, count(*) as flight_count from flights group by carrier order by flight_count desc;

/*carrier  flight_count
UA	   58665
B6	   54635
EV	   54173
DL	   48110
AA	   32729
MQ	   26397
US	   20536
9E	   18460
WN	   12275
VX	   5162
FL	   3260
AS	   714
F9	   685
YV	   601
HA	   342
OO	   32*/


/*6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.*/

select carrier, count(*) as flight_count from flights group by carrier order by flight_count desc limit 5;

/*carrier	flight_count
UA	        58665
B6	        54635
EV	        54173
DL	        48110
AA	        32729*/


/*7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of 
flights in descending order.*/

select carrier, count(*) as flight_count from flights where distance >=1000 group by carrier order by flight_count desc limit 5 ;

/*carrier  flight_count
UA	  41135
B6	  30022
DL	  28096
AA	  23583
EV	  6248*/


/*8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and 
write down both the question, and the query that answers the question 

Show the top 4 airlines, by number of flights where departure delay is 1 or greater, ordered by number of flights 
in descending order.*/

select carrier, count(*) as flight_count from flights where dep_delay>=1 group by carrier order by flight_count desc limit 4 ;

/*carrier  flight_count
UA	  27261
EV	  23139
B6	  21445
DL	  15241*/
