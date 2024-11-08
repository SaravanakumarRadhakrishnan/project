# Travel Booking System
# Description: Create a system to manage travel bookings, including flights, hotels, and customer reservations. 
# Implement features for booking management, availability checks, and customer profiles.

create database Travel_Booking_System;
use Travel_Booking_System;
create table flights(flight_id int auto_increment primary key,flight_number varchar(10) not null,
departure_city varchar(50) not null,arrival_city varchar(50)not null,departure_time datetime not null,arrival_time datetime not null,
class varchar(10) not null,seat_available int not null,price decimal(10,2) not null
);


create table hotels(hotel_id int auto_increment primary key,hotel_name varchar(100)not null,location varchar(100) not null,
available_rooms int not null,price_per_day decimal(10,2) not null
);

create table customers(customer_id int auto_increment primary key,first_name varchar(50) not null,last_name varchar(50) not null,
email_id varchar(100) not null unique,phone_number varchar(15)
);

create table reservations(reservation_id int auto_increment primary key,customer_id int,hotel_id int,flight_id int,
reservation_date datetime default current_timestamp,check_in_date date,check_out_date date,
foreign key (customer_id) references customers (customer_id),
foreign key (hotel_id) references hotels (hotel_id),
foreign key (flight_id) references flights (flight_id)
);

create table bookings(booking_id int auto_increment primary key,reservation_id int,customer_id int,
booking_date datetime default current_timestamp,total_amount decimal (10,2) not null,
status enum('confirmed','cancelled','pending') default 'pending',
foreign key (reservation_id) references reservations (reservation_id),
foreign key (customer_id) references customers (customer_id)
);

select * from reservations;
select * from bookings;

INSERT INTO flights (flight_number, departure_city, arrival_city, departure_time, arrival_time, class, seat_available, price)
VALUES
('IND101', 'Mumbai', 'Delhi', '2024-10-10 06:00:00', '2024-10-10 08:30:00', 'Economy', 100, 4500.00),
('IND102', 'Delhi', 'Mumbai', '2024-10-10 09:00:00', '2024-10-10 11:30:00', 'Business', 30, 12000.00),
('IND103', 'Chennai', 'Bangalore', '2024-10-11 12:00:00', '2024-10-11 13:00:00', 'Economy', 150, 3000.00),
('IND104', 'Bangalore', 'Chennai', '2024-10-11 14:00:00', '2024-10-11 15:00:00', 'Economy', 200, 3500.00),
('IND105', 'Kolkata', 'Delhi', '2024-10-12 07:30:00', '2024-10-12 10:00:00', 'Business', 50, 11000.00),
('IND106', 'Delhi', 'Kolkata', '2024-10-12 11:00:00', '2024-10-12 13:30:00', 'Economy', 180, 5500.00),
('IND107', 'Mumbai', 'Goa', '2024-10-13 09:00:00', '2024-10-13 10:30:00', 'Economy', 120, 4000.00),
('IND108', 'Goa', 'Mumbai', '2024-10-13 11:30:00', '2024-10-13 13:00:00', 'Business', 40, 9000.00),
('IND109', 'Hyderabad', 'Chennai', '2024-10-14 05:30:00', '2024-10-14 07:00:00', 'Economy', 150, 3200.00),
('IND110', 'Chennai', 'Hyderabad', '2024-10-14 08:00:00', '2024-10-14 09:30:00', 'Business', 20, 9500.00),
('IND111', 'Bangalore', 'Pune', '2024-10-15 13:00:00', '2024-10-15 15:00:00', 'Economy', 100, 3700.00),
('IND112', 'Pune', 'Bangalore', '2024-10-15 16:00:00', '2024-10-15 18:00:00', 'Business', 25, 10500.00),
('IND113', 'Kochi', 'Mumbai', '2024-10-16 08:00:00', '2024-10-16 10:00:00', 'Economy', 200, 6000.00),
('IND114', 'Mumbai', 'Kochi', '2024-10-16 11:00:00', '2024-10-16 13:00:00', 'Business', 60, 13000.00),
('IND115', 'Ahmedabad', 'Delhi', '2024-10-17 09:00:00', '2024-10-17 11:00:00', 'Economy', 180, 4500.00),
('IND116', 'Delhi', 'Ahmedabad', '2024-10-17 12:00:00', '2024-10-17 14:00:00', 'Business', 35, 10000.00),
('IND117', 'Bangalore', 'Delhi', '2024-10-18 07:00:00', '2024-10-18 09:30:00', 'Economy', 210, 5200.00),
('IND118', 'Delhi', 'Bangalore', '2024-10-18 10:30:00', '2024-10-18 13:00:00', 'Business', 45, 11500.00),
('IND119', 'Pune', 'Mumbai', '2024-10-19 05:00:00', '2024-10-19 06:00:00', 'Economy', 90, 2500.00),
('IND120', 'Mumbai', 'Pune', '2024-10-19 07:00:00', '2024-10-19 08:00:00', 'Business', 15, 8000.00),
('IND121', 'Jaipur', 'Delhi', '2024-10-20 15:00:00', '2024-10-20 16:30:00', 'Economy', 130, 4000.00),
('IND122', 'Delhi', 'Jaipur', '2024-10-20 17:30:00', '2024-10-20 19:00:00', 'Business', 20, 9000.00),
('IND123', 'Lucknow', 'Mumbai', '2024-10-21 06:30:00', '2024-10-21 08:30:00', 'Economy', 110, 5500.00),
('IND124', 'Mumbai', 'Lucknow', '2024-10-21 09:30:00', '2024-10-21 11:30:00', 'Business', 40, 12500.00),
('IND125', 'Hyderabad', 'Goa', '2024-10-22 13:00:00', '2024-10-22 14:30:00', 'Economy', 120, 3700.00),
('IND126', 'Goa', 'Hyderabad', '2024-10-22 15:30:00', '2024-10-22 17:00:00', 'Business', 30, 9500.00),
('IND127', 'Bangalore', 'Kolkata', '2024-10-23 07:00:00', '2024-10-23 10:00:00', 'Economy', 180, 6500.00),
('IND128', 'Kolkata', 'Bangalore', '2024-10-23 11:00:00', '2024-10-23 14:00:00', 'Business', 50, 14000.00),
('IND129', 'Mumbai', 'Bangalore', '2024-10-24 17:00:00', '2024-10-24 19:00:00', 'Economy', 170, 6000.00),
('IND130', 'Bangalore', 'Mumbai', '2024-10-24 20:00:00', '2024-10-24 22:00:00', 'Business', 35, 11500.00);

select * from flights;

INSERT INTO hotels (hotel_name, location, available_rooms, price_per_day)
VALUES
('The Oberoi', 'Mumbai', 50, 12000.00),
('Taj Mahal Palace', 'Mumbai', 30, 15000.00),
('ITC Maurya', 'Delhi', 100, 10000.00),
('The Leela Palace', 'Delhi', 70, 14000.00),
('The Park', 'Kolkata', 80, 8000.00),
('Hyatt Regency', 'Kolkata', 60, 9500.00),
('Vivanta by Taj', 'Bangalore', 90, 11000.00),
('The Ritz-Carlton', 'Bangalore', 40, 18000.00),
('Radisson Blu', 'Jaipur', 120, 8500.00),
('Marriott', 'Jaipur', 70, 12000.00),
('Holiday Inn', 'Chennai', 150, 7000.00),
('Taj Coromandel', 'Chennai', 50, 13000.00),
('ITC Grand Chola', 'Chennai', 100, 14500.00),
('The Gateway Hotel', 'Pune', 60, 9000.00),
('JW Marriott', 'Pune', 75, 13500.00),
('Novotel', 'Goa', 110, 9500.00),
('The Lalit', 'Goa', 50, 13000.00),
('The Leela', 'Goa', 40, 17500.00),
('Radisson Blu', 'Hyderabad', 100, 9500.00),
('The Westin', 'Hyderabad', 80, 12000.00),
('Taj Krishna', 'Hyderabad', 60, 13500.00),
('Le Meridien', 'Kochi', 90, 8500.00),
('Crowne Plaza', 'Kochi', 75, 11000.00),
('The Oberoi Cecil', 'Shimla', 40, 17000.00),
('Wildflower Hall', 'Shimla', 50, 22000.00),
('Radisson Blu', 'Udaipur', 110, 10500.00),
('Taj Lake Palace', 'Udaipur', 45, 24000.00),
('The Lalit Laxmi Vilas Palace', 'Udaipur', 60, 13000.00),
('Marriott', 'Lucknow', 90, 9500.00),
('Radisson Blu', 'Chennai', 90, 10500.00);

select * from hotels;

INSERT INTO customers (first_name, last_name, email_id, phone_number)
VALUES
('Rahul', 'Sharma', 'rahul.sharma@gmail.com', '9876543210'),
('Aditi', 'Verma', 'aditi.verma@yahoo.com', '8765432109'),
('Siddharth', 'Patel', 'sid.patel@gmail.com', '9876512345'),
('Pooja', 'Singh', 'pooja.singh@hotmail.com', '9123456789'),
('Vikram', 'Rao', 'vikram.rao@gmail.com', '8897654321'),
('Anjali', 'Mehta', 'anjali.mehta@gmail.com', '9876567890'),
('Rohan', 'Kapoor', 'rohan.kapoor@yahoo.com', '9876561234'),
('Priya', 'Chopra', 'priya.chopra@gmail.com', '8765432098'),
('Aman', 'Gupta', 'aman.gupta@gmail.com', '9876541221'),
('Sneha', 'Nair', 'sneha.nair@yahoo.com', '9123459876'),
('Karan', 'Desai', 'karan.desai@gmail.com', '9876523456'),
('Isha', 'Jain', 'isha.jain@hotmail.com', '9876563452'),
('Suresh', 'Reddy', 'suresh.reddy@gmail.com', '8896543210'),
('Manisha', 'Yadav', 'manisha.yadav@gmail.com', '9765432109'),
('Harsh', 'Shah', 'harsh.shah@gmail.com', '9876547654'),
('Neha', 'Khan', 'neha.khan@hotmail.com', '9876554321'),
('Ravi', 'Mishra', 'ravi.mishra@gmail.com', '9123467890'),
('Sanya', 'Singh', 'sanya.singh@yahoo.com', '9123457689'),
('Ajay', 'Joshi', 'ajay.joshi@gmail.com', '9876541245'),
('Divya', 'Bajaj', 'divya.bajaj@hotmail.com', '9123451289'),
('Ankur', 'Srivastava', 'ankur.srivastava@gmail.com', '9876543267'),
('Shalini', 'Kumar', 'shalini.kumar@yahoo.com', '9876541256'),
('Arjun', 'Khatri', 'arjun.khatri@gmail.com', '9765432110'),
('Nidhi', 'Malhotra', 'nidhi.malhotra@gmail.com', '9876531245'),
('Varun', 'Bose', 'varun.bose@yahoo.com', '9876541268'),
('Maya', 'Saxena', 'maya.saxena@gmail.com', '9876546723'),
('Vivek', 'Pandey', 'vivek.pandey@gmail.com', '9876545678'),
('Shreya', 'Bhatt', 'shreya.bhatt@gmail.com', '9123451276'),
('Kunal', 'Pillai', 'kunal.pillai@gmail.com', '9876547810'),
('Meera', 'Iyer', 'meera.iyer@gmail.com', '9876534875');

select * from customers;

INSERT INTO reservations (customer_id, hotel_id, flight_id, check_in_date, check_out_date)
VALUES
(1, 1, 1, '2024-10-12', '2024-10-15'),
(2, 2, 2, '2024-10-15', '2024-10-17'),
(3, 3, 3, '2024-10-10', '2024-10-13'),
(4, 4, 4, '2024-10-18', '2024-10-21'),
(5, 5, 5, '2024-10-19', '2024-10-22'),
(6, 6, 6, '2024-10-22', '2024-10-25'),
(7, 7, 7, '2024-10-11', '2024-10-14'),
(8, 8, 8, '2024-10-14', '2024-10-16'),
(9, 9, 9, '2024-10-20', '2024-10-23'),
(10, 10, 10, '2024-10-23', '2024-10-26'),
(11, 11, 11, '2024-10-10', '2024-10-13'),
(12, 12, 12, '2024-10-13', '2024-10-16'),
(13, 13, 13, '2024-10-15', '2024-10-18'),
(14, 14, 14, '2024-10-18', '2024-10-21'),
(15, 15, 15, '2024-10-19', '2024-10-22'),
(16, 16, 16, '2024-10-21', '2024-10-23'),
(17, 17, 17, '2024-10-23', '2024-10-26'),
(18, 18, 18, '2024-10-11', '2024-10-14'),
(19, 19, 19, '2024-10-14', '2024-10-16'),
(20, 20, 20, '2024-10-20', '2024-10-23'),
(21, 21, 21, '2024-10-10', '2024-10-12'),
(22, 22, 22, '2024-10-12', '2024-10-15'),
(23, 23, 23, '2024-10-17', '2024-10-19'),
(24, 24, 24, '2024-10-19', '2024-10-21'),
(25, 25, 25, '2024-10-21', '2024-10-24'),
(26, 26, 26, '2024-10-24', '2024-10-26'),
(27, 27, 27, '2024-10-11', '2024-10-13'),
(28, 28, 28, '2024-10-14', '2024-10-16'),
(29, 29, 29, '2024-10-16', '2024-10-18'),
(30, 30, 30, '2024-10-18', '2024-10-20');

select * from reservations;

INSERT INTO bookings (reservation_id, customer_id, booking_date, total_amount, status) VALUES
(1, 1, '2023-10-01 10:30:00', 5000.00, 'confirmed'),
(2, 2, '2023-10-02 12:00:00', 3000.00, 'pending'),
(3, 3, '2023-10-03 14:30:00', 4500.50, 'cancelled'),
(4, 4, '2023-10-04 09:00:00', 2500.00, 'confirmed'),
(5, 5, '2023-10-05 11:45:00', 3200.00, 'confirmed'),
(6, 6, '2023-10-06 13:00:00', 6000.75, 'pending'),
(7, 7, '2023-10-07 15:30:00', 7000.00, 'confirmed'),
(8, 8, '2023-10-08 10:15:00', 5500.25, 'pending'),
(9, 9, '2023-10-09 12:45:00', 4200.00, 'cancelled'),
(10, 10, '2023-10-10 16:00:00', 2300.00, 'confirmed'),
(11, 11, '2023-10-11 10:30:00', 5100.50, 'pending'),
(12, 12, '2023-10-12 11:00:00', 3500.00, 'confirmed'),
(13, 13, '2023-10-13 14:00:00', 4000.00, 'cancelled'),
(14, 14, '2023-10-14 09:15:00', 2950.00, 'pending'),
(15, 15, '2023-10-15 13:30:00', 3800.00, 'confirmed'),
(16, 16, '2023-10-16 15:45:00', 4700.25, 'pending'),
(17, 17, '2023-10-17 10:45:00', 6400.00, 'confirmed'),
(18, 18, '2023-10-18 12:30:00', 2900.75, 'pending'),
(19, 19, '2023-10-19 14:15:00', 3300.00, 'cancelled'),
(20, 20, '2023-10-20 16:45:00', 5200.00, 'confirmed'),
(21, 21, '2023-10-21 10:00:00', 4400.00, 'confirmed'),
(22, 22, '2023-10-22 11:30:00', 5600.00, 'pending'),
(23, 23, '2023-10-23 13:00:00', 6700.50, 'cancelled'),
(24, 24, '2023-10-24 15:30:00', 4900.00, 'confirmed'),
(25, 25, '2023-10-25 10:15:00', 2800.25, 'pending'),
(26, 26, '2023-10-26 12:45:00', 6200.00, 'confirmed'),
(27, 27, '2023-10-27 14:30:00', 3700.00, 'cancelled'),
(28, 28, '2023-10-28 16:00:00', 4100.75, 'confirmed'),
(29, 29, '2023-10-29 09:45:00', 5700.00, 'pending'),
(30, 30, '2023-10-30 11:00:00', 4600.00, 'confirmed');

select * from bookings;
                    
select * from bookings
DELIMITER $$ 
CREATE PROCEDURE Get_count_by_status( IN count INT)
BEGIN
    select count(booking_id) as result_count , status
    from bookings 
    group by status
    having count(booking_id) >= count;
END $$
DELIMITER ;
CALL Get_count_by_status(5)

DELIMITER $$
CREATE PROCEDURE GetCustomersByBookingss (IN confirm_status varchar(100)) 
BEGIN
     SELECT a.customer_id, a.first_name, a.last_name, a.email_id, a.phone_number,
            b.reservation_id, b.customer_id, b.booking_date, b.status
     FROM customers AS a
     JOIN bookings AS b ON a.customer_id = b.customer_id 
     WHERE b.status = confirm_status;
END $$
DELIMITER ;

CALL GetCustomersByBookingss('confirmed');

DELIMITER $$
CREATE PROCEDURE Find_customer (IN ID int)
BEGIN
     SELECT *
     FROM customers
     WHERE customer_id=ID;
END $$
DELIMITER ;
CALL Find_customer(27);

DELIMITER $$
CREATE PROCEDURE Find_flight (in F_flight_number varchar(20))
BEGIN
     SELECT * FROM flights WHERE flight_number = F_flight_number;
END $$
DELIMITER ;
CALL Find_flight('IND101');

DELIMITER $$
CREATE PROCEDURE Get_class_by_price ()
BEGIN
     SELECT a.flight_number,a.class,a.price
     FROM flights as a
	 WHERE a.price<=5000;
END $$
DELIMITER ;
CALL Get_class_by_price ();

DELIMITER $$
CREATE PROCEDURE Get_hotel_price()
BEGIN
     SELECT *
     FROM hotels 
	 WHERE price_per_day<=10000;
END $$
DELIMITER ;
CALL Get_hotel_price()

DELIMITER $$

CREATE PROCEDURE Get_flightprice_by_hotelprice(IN Total_price DECIMAL(10,2))
BEGIN
    SELECT a.flight_id, a.departure_city, a.arrival_city, a.class, a.price, 
           b.hotel_id, b.hotel_name, b.location, b.price_per_day,
		   (a.price + b.price_per_day) AS Total_amount
    FROM flights AS a 
    JOIN hotels AS b ON a.flight_id = b.hotel_id
    WHERE (a.price + b.price_per_day) <= Total_price ORDER BY Total_amount DESC ;
END $$

DELIMITER ;

CALL Get_flightprice_by_hotelprice(15000.00);

DELIMITER $$ 
CREATE PROCEDURE Get_details_hotel_flight_customer_by_reservation( IN Total DECIMAL(10,2), IN Staying_day INT )
BEGIN
    -- Query to get flight and hotel details based on Total amount
    SELECT a.flight_id, a.departure_city, a.arrival_city, a.class, a.price, 
           b.hotel_id, b.hotel_name, b.location, b.price_per_day,
           (a.price + b.price_per_day) AS Total_amount
    FROM flights AS a
    JOIN hotels AS b ON a.flight_id = b.hotel_id
    WHERE (a.price + b.price_per_day) <= Total;

    -- Query to get customer and reservation details based on Staying_day
    SELECT c.customer_id, c.first_name, c.last_name, c.email_id, c.phone_number,
           d.reservation_id, d.reservation_date, d.check_in_date, d.check_out_date,
           DATEDIFF(d.check_out_date, d.check_in_date) AS Total_days
    FROM customers AS c
    JOIN reservations AS d ON c.customer_id = d.customer_id
    WHERE DATEDIFF(d.check_out_date, d.check_in_date) >= Staying_day;
END $$ 
DELIMITER ;

CALL Get_details_hotel_flight_customer_by_reservation(15000.00,3)

DELIMITER $$
CREATE PROCEDURE Get_booking_By_customers(IN Booking_Status varchar (50))
BEGIN 
     SELECT a.booking_id,a.reservation_id,a.booking_date,a.total_amount,a.status,
     b.customer_id,b.first_name,b.last_name,b.phone_number
     FROM bookings AS a
     JOIN customers AS B ON a.customer_id = b.customer_id 
     WHERE a.status LIKE 'cancelled%' OR 'pending%'=  Booking_Status;
END $$
DELIMITER ;

CALL Get_booking_By_customers('cancelled')

