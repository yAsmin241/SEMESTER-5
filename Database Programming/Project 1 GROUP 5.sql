#------------------- PROJECT 1 (GROUP 5) -----------------------

# PART A - Database Creation (DDL)

CREATE DATABASE MovieBooking;
USE MovieBooking;

CREATE TABLE Customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    fName VARCHAR(50) NOT NULL,
    lName VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,  # constraint: UNIQUE
    phone VARCHAR(20),
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP   #constraint: DEFAULT
);

CREATE TABLE Movies (
	movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50), 
    duration_minutes INT CHECK (duration_minutes > 0),
    release_date DATE,
    rating DECIMAL (3,1),
    description TEXT
);

CREATE TABLE Showtimes (
	showtime_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    hall_number INT NOT NULL,
    show_date DATE NOT NULL,
    start_time TIME NOT NULL,
    price DOUBLE NOT NULL,
    
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE
);



CREATE TABLE Seats (
	seat_id INT AUTO_INCREMENT PRIMARY KEY,
    hall_number INT NOT NULL,
    seat_number VARCHAR(5) NOT NULL,
    seat_type VARCHAR(20) DEFAULT 'Standard'
);

CREATE TABLE Bookings (
	booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    showtime_id INT,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DOUBLE,
    status VARCHAR(20) DEFAULT 'Confirmed',
    
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (showtime_id) REFERENCES Showtimes(showtime_id)
);

CREATE TABLE Payments (
	payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50),
    amount DOUBLE,
    
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) ON DELETE SET NULL
);
    
CREATE TABLE LuckyDraw (
	winner_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(50),
    prize_amount DOUBLE
);

ALTER TABLE CUstomers ADD COLUMN loyalty_point INT DEFAULT 0;

DROP TABLE LuckyDraw;


# PART B - DATA MANIPULATION (DML) 

INSERT INTO Customers (fName, lName, email, phone, loyalty_point) 
VALUES
('Ali','Baba','alibaba@gmail.com','012-3456789', 100),
('Ain','Bella','ainbella@gmail.com','013-4567890', 50),
('Yasmin','Batrisyia','yasmin@gmail.com','014-5678901', 20),
('Dania','Syarifah','dania@gmail.com','016-7890123', 150),
('Firzana','Nur','firzana@gmail.com','017-8901234', 200),
('Ahmad','Wajdi','wajdi@gmail.com','019-0123456', 50),
('Aik','Cheong','aikcheong@gmail.com','010-1234567', 0),
('Mary','Chan','mary@gmail.com','012-1122334', 40),
('Thanu','Kumaran','thanu@gmail.com','013-2233445', 50),
('Cha','Woo','chawoomin@gmail.com','014-5566778', 250);



INSERT INTO Movies (title, genre, duration_minutes, release_date, rating, description)
VALUES
('Avengers: Endgame', 'Action', 195, '2019-04-26', 8.4, 'After the devastating events of Infinity War, the universe is in ruins.'),
('Inception', 'Sci-Fi', 148, '2010-07-16', 8.8, 'A thief who steals corporate secrets through the use of dream-sharing technology.'),
('The Dark Knight', 'Action', 152, '2008-07-18', 9.0, 'Batman sets out to dismantle the remaining criminal organizations that plague the streets.'),
('Spider-Man: No Way Home', 'Action', 148, '2021-12-17', 8.2, 'With Spider-Mans identity now revealed, Peter asks Doctor Strange for help.'),
('Frozen II', 'Animation', 103, '2019-11-22', 6.8, 'Anna, Elsa, Kristoff, Olaf and Sven leave Arendelle to travel to an ancient, autumn-bound forest of an enchanted land.'),
('Joker', 'Drama', 122, '2019-10-04', 8.4, 'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society.'),
('The Lion King', 'Animation', 118, '2019-07-19', 6.9, 'After the murder of his father, a young lion prince flees his kingdom only to learn the true meaning of responsibility and bravery.'),
('Parasite', 'Thriller', 132, '2019-05-30', 8.6, 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.'),
('Titanic', 'Romance', 195, '1997-12-19', 7.8, 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.'),
('Interstellar', 'Sci-Fi', 169, '2014-11-07', 8.6, 'A team of explorers travel through a wormhole in space in an attempt to ensure humanitys survival.');

INSERT INTO Showtimes (movie_id, hall_number, show_date, start_time, price)
VALUES
(1, 1, '2025-12-01', '14:00:00', 20.00),
(1, 2, '2025-12-01', '18:00:00', 22.00),
(2, 1, '2025-12-01', '20:00:00', 25.00),
(3, 3, '2025-12-02', '10:00:00', 15.00),
(4, 2, '2025-12-02', '13:00:00', 18.00),
(5, 4, '2025-12-03', '12:00:00', 24.00),
(5, 4, '2025-12-03', '11:00:00', 24.00),
(6, 1, '2025-12-04', '22:00:00', 16.00),
(7, 5, '2025-12-04', '21:00:00', 20.00),
(10, 3, '2025-12-05', '15:00:00', 23.00);

INSERT INTO Seats (hall_number, seat_number, seat_type)
VALUES
# Hall 1: 20 seats (Standard, VIP, Premium)
(1, 'A1', 'Standard'),
(1, 'A2', 'Standard'),
(1, 'A3', 'Standard'),
(1, 'A4', 'Standard'),
(1, 'A5', 'Standard'),
(1, 'B1', 'Standard'),
(1, 'B2', 'Standard'),
(1, 'B3', 'Standard'),
(1, 'B4', 'Standard'),
(1, 'B5', 'Standard'),
(1, 'C1', 'VIP'),
(1, 'C2', 'VIP'),
(1, 'C3', 'VIP'),
(1, 'C4', 'VIP'),
(1, 'C5', 'VIP'),
(1, 'D1', 'Premium'),
(1, 'D2', 'Premium'),
(1, 'D3', 'Premium'),
(1, 'D4', 'Premium'),
(1, 'D5', 'Premium'),

# Hall 2: 15 seats
(2, 'A1', 'Standard'),
(2, 'A2', 'Standard'),
(2, 'A3', 'Standard'),
(2, 'A4', 'Standard'),
(2, 'A5', 'Standard'),
(2, 'B1', 'VIP'),
(2, 'B2', 'VIP'),
(2, 'B3', 'VIP'),
(2, 'B4', 'VIP'),
(2, 'B5', 'VIP'),
(2, 'C1', 'Premium'),
(2, 'C2', 'Premium'),
(2, 'C3', 'Premium'),
(2, 'C4', 'Premium'),
(2, 'C5', 'Premium'),

# Hall 3: 10 seats
(3, 'A1', 'Standard'),
(3, 'A2', 'Standard'),
(3, 'A3', 'Standard'),
(3, 'B1', 'VIP'),
(3, 'B2', 'VIP'),
(3, 'B3', 'VIP'),
(3, 'C1', 'Premium'),
(3, 'C2', 'Premium'),
(3, 'C3', 'Premium'),
(3, 'C4', 'Premium'),

# Hall 4: 10 seats
(4, 'A1', 'Standard'),
(4, 'A2', 'Standard'),
(4, 'A3', 'Standard'),
(4, 'B1', 'VIP'),
(4, 'B2', 'VIP'),
(4, 'B3', 'VIP'),
(4, 'C1', 'Premium'),
(4, 'C2', 'Premium'),
(4, 'C3', 'Premium'),
(4, 'C4', 'Premium'),

# Hall 5: 10 seats
(5, 'A1', 'Standard'),
(5, 'A2', 'Standard'),
(5, 'A3', 'Standard'),
(5, 'B1', 'VIP'),
(5, 'B2', 'VIP'),
(5, 'B3', 'VIP'),
(5, 'C1', 'Premium'),
(5, 'C2', 'Premium'),
(5, 'C3', 'Premium'),
(5, 'C4', 'Premium');

# Verification
SELECT 'Seats table populated successfully!' AS Status;
SELECT COUNT(*) AS Total_Seats FROM Seats;



-- Reset auto-increment to 1
DELETE FROM Bookings;
ALTER TABLE Bookings AUTO_INCREMENT = 1;

INSERT INTO Bookings (customer_id, showtime_id, booking_date, total_amount, status)
VALUES
# Confirmed bookings (high-value transactions)
(1, 1, '2025-11-15 09:30:00', 40.00, 'Confirmed'),
(2, 1, '2025-11-15 10:00:00', 60.00, 'Confirmed'),
(3, 2, '2025-11-16 11:30:00', 44.00, 'Confirmed'),
(4, 2, '2025-11-16 12:00:00', 88.00, 'Confirmed'),
(5, 3, '2025-11-17 14:00:00', 75.00, 'Confirmed'),
(6, 4, '2025-11-18 08:30:00', 45.00, 'Confirmed'),
(7, 5, '2025-11-18 09:00:00', 36.00, 'Confirmed'),
(8, 6, '2025-11-19 13:00:00', 72.00, 'Confirmed'),
(9, 7, '2025-11-20 10:30:00', 48.00, 'Confirmed'),
(10, 8, '2025-11-20 15:00:00', 32.00, 'Confirmed'),
(1, 9, '2025-11-21 16:00:00', 60.00, 'Confirmed'),
(2, 10, '2025-11-22 11:00:00', 46.00, 'Confirmed'),
(3, 1, '2025-11-23 12:00:00', 80.00, 'Confirmed'),
(4, 3, '2025-11-23 13:30:00', 50.00, 'Confirmed'),
(5, 5, '2025-11-24 14:00:00', 54.00, 'Confirmed'),

# Pending bookings (awaiting payment confirmation)
(6, 7, '2025-11-24 15:30:00', 24.00, 'Pending'),
(7, 2, '2025-11-25 08:00:00', 22.00, 'Pending'),
(8, 4, '2025-11-25 09:30:00', 15.00, 'Pending'),
(9, 6, '2025-11-26 10:00:00', 24.00, 'Pending'),
(10, 8, '2025-11-26 11:30:00', 32.00, 'Pending'),

# Cancelled bookings (customer cancellations)
(1, 3, '2025-11-10 14:00:00', 25.00, 'Cancelled'),
(2, 5, '2025-11-11 15:30:00', 18.00, 'Cancelled'),
(3, 7, '2025-11-12 16:00:00', 24.00, 'Cancelled'),

# More confirmed bookings (recent activity)
(4, 9, '2025-11-27 08:30:00', 40.00, 'Confirmed'),
(5, 10, '2025-11-27 09:00:00', 69.00, 'Confirmed'),
(6, 1, '2025-11-28 10:30:00', 80.00, 'Confirmed'),
(7, 3, '2025-11-28 11:00:00', 75.00, 'Confirmed'),
(8, 5, '2025-11-29 13:30:00', 36.00, 'Confirmed'),
(9, 7, '2025-11-29 14:00:00', 48.00, 'Confirmed'),
(10, 9, '2025-11-30 15:00:00', 40.00, 'Confirmed'),

# Additional bookings for comprehensive testing
(1, 2, '2025-12-01 09:00:00', 44.00, 'Confirmed'),
(2, 4, '2025-12-01 10:00:00', 45.00, 'Confirmed'),
(3, 6, '2025-12-01 11:00:00', 72.00, 'Confirmed');

# Verification
SELECT 'Bookings table populated successfully!' AS Status;
SELECT COUNT(*) AS Total_Bookings FROM Bookings;

DELETE FROM Payments;
ALTER TABLE Payments auto_increment = 1;
INSERT INTO Payments (booking_id, payment_date, payment_method, amount)
VALUES
# Payments for confirmed bookings (booking_id 1-15)
(1, '2025-11-15 09:31:00', 'Credit Card', 40.00),
(2, '2025-11-15 10:01:00', 'Debit Card', 60.00),
(3, '2025-11-16 11:31:00', 'E-Wallet', 44.00),
(4, '2025-11-16 12:01:00', 'Credit Card', 88.00),
(5, '2025-11-17 14:01:00', 'Cash', 75.00),
(6, '2025-11-18 08:31:00', 'Credit Card', 45.00),
(7, '2025-11-18 09:01:00', 'Debit Card', 36.00),
(8, '2025-11-19 13:01:00', 'E-Wallet', 72.00),
(9, '2025-11-20 10:31:00', 'Credit Card', 48.00),
(10, '2025-11-20 15:01:00', 'Cash', 32.00),
(11, '2025-11-21 16:01:00', 'Credit Card', 60.00),
(12, '2025-11-22 11:01:00', 'Debit Card', 46.00),
(13, '2025-11-23 12:01:00', 'E-Wallet', 80.00),
(14, '2025-11-23 13:31:00', 'Credit Card', 50.00),
(15, '2025-11-24 14:01:00', 'Cash', 54.00),


# Payments for cancelled bookings (to be refunded)
(21, '2025-11-10 14:01:00', 'Credit Card', 25.00),
(22, '2025-11-11 15:31:00', 'Debit Card', 18.00),
(23, '2025-11-12 16:01:00', 'E-Wallet', 24.00),

# More payments for recent bookings
(24, '2025-11-27 08:31:00', 'Credit Card', 40.00),
(25, '2025-11-27 09:01:00', 'E-Wallet', 69.00),
(26, '2025-11-28 10:31:00', 'Debit Card', 80.00),
(27, '2025-11-28 11:01:00', 'Credit Card', 75.00),
(28, '2025-11-29 13:31:00', 'Cash', 36.00),
(29, '2025-11-29 14:01:00', 'Credit Card', 48.00),
(30, '2025-11-30 15:01:00', 'Debit Card', 40.00);

# Verification
SELECT 'Payments table populated successfully!' AS Status;
SELECT COUNT(*) AS Total_Payments FROM Payments;

# update
DELETE FROM Payments;
DELETE FROM Bookings;
ALTER TABLE Bookings AUTO_INCREMENT = 1;

SELECT booking_id, status, total_amount 
FROM Bookings
ORDER BY booking_id;


UPDATE Bookings 
SET status = 'Confirmed' 
WHERE booking_id IN (16, 17) AND status = 'Pending';

SELECT 'UPDATE 1 Completed: Pending bookings #16 and #17 confirmed' AS Operation_Status;

SET SQL_SAFE_UPDATES = 0;

UPDATE Showtimes 
SET price = ROUND(price * 1.15, 2) 
WHERE show_date = '2025-12-01';

SELECT 'UPDATE 2 Completed: Weekend premium (15%) applied to Dec 1 showtimes' AS Operation_Status;

UPDATE Customers 
SET loyalty_point = loyalty_point + 20 
WHERE customer_id IN (1, 2, 3, 4, 5);

SELECT 'UPDATE 3 Completed: 20 bonus loyalty points added for customers 1-5' AS Operation_Status;

UPDATE Bookings 
SET status = 'Cancelled' 
WHERE status = 'Pending' 
AND booking_date < DATE_SUB(CURDATE(), INTERVAL 10 DAY);

SELECT 'UPDATE 4 Completed: Old pending bookings (>10 days) auto-cancelled' AS Operation_Status;

#Start transaction, commmit means update successfull, rollback means update unsuccessfull
START TRANSACTION ;

UPDATE Bookings b
INNER JOIN Customers c ON b.customer_id = c.customer_id
SET b.total_amount = ROUND(b.total_amount * 0.90, 2)
WHERE c.loyalty_point >= 150 
AND b.status = 'Confirmed' 
AND b.booking_id <= 15;
-- if all steps okay
COMMIT;
SELECT 'UPDATE 5 Completed: 10% VIP discount applied for high-loyalty customers' AS Operation_Status;
-- if any steps fails
ROLLBACK;
SELECT 'UPDATE 5 is unsuccessfull' AS Operation_Status;

UPDATE Seats 
SET seat_type = 'Deluxe' 
WHERE seat_number LIKE 'C%' 
AND hall_number IN (4, 5);

SELECT 'UPDATE 6 Completed: Row C seats in halls 4&5 upgraded to Deluxe' AS Operation_Status;

UPDATE Movies 
SET rating = ROUND(rating + 0.3, 1) 
WHERE movie_id IN (
    SELECT DISTINCT s.movie_id 
    FROM Showtimes s 
    INNER JOIN Bookings b ON s.showtime_id = b.showtime_id 
    WHERE b.status = 'Confirmed'
    GROUP BY s.movie_id
    HAVING COUNT(b.booking_id) >= 3
);

SELECT 'UPDATE 7 Completed: Popular movie ratings increased by 0.3 points' AS Operation_Status;

UPDATE Showtimes 
SET price = price + 3.00 
WHERE hall_number = 1 
AND start_time >= '18:00:00';

SELECT 'UPDATE 8 Completed: Hall 1 evening shows increased by $3' AS Operation_Status;

# delete

DELETE FROM Bookings 
WHERE status = 'Cancelled' 
AND booking_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

SELECT 'DELETE 1 Completed: Cancelled bookings older than 30 days removed' AS Operation_Status;

DELETE FROM Seats 
WHERE seat_id IN (
    SELECT seat_id FROM (
        SELECT seat_id FROM Seats 
        WHERE hall_number = 5 AND seat_number IN ('A1', 'A2')
    ) AS temp
);

SELECT 'DELETE 2 Completed: Seats A1, A2 removed from Hall 5 (renovation)' AS Operation_Status;

DELETE FROM Showtimes 
WHERE show_date < '2025-11-01';

SELECT 'DELETE 3 Completed: Past showtimes (before Nov 2025) removed' AS Operation_Status;

DELETE s1 FROM Seats s1
INNER JOIN Seats s2 
WHERE s1.seat_id > s2.seat_id 
AND s1.hall_number = s2.hall_number 
AND s1.seat_number = s2.seat_number;

SELECT 'DELETE 4 Completed: Duplicate seat entries removed' AS Operation_Status;

DELETE FROM Bookings 
WHERE booking_id = 23 AND status = 'Cancelled';

SELECT 'DELETE 5 Completed: Specific cancelled booking #23 removed' AS Operation_Status;

DELETE FROM Payments 
WHERE booking_id NOT IN (SELECT booking_id FROM Bookings);

SELECT 'DELETE 6 Completed: Orphaned payment records cleaned' AS Operation_Status;

DELETE FROM Customers 
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Bookings)
AND loyalty_point = 0 
AND registration_date < DATE_SUB(CURDATE(), INTERVAL 60 DAY);

SELECT 'DELETE 7 Completed: Inactive test customers removed' AS Operation_Status;

# filter

SELECT booking_id, customer_id, showtime_id, total_amount, booking_date, status
FROM Bookings 
WHERE status = 'Confirmed';

SELECT b.booking_id, 
       CONCAT(c.fName, ' ', c.lName) AS customer_name, 
       b.total_amount, 
       b.booking_date
FROM Bookings b
INNER JOIN Customers c ON b.customer_id = c.customer_id
WHERE b.status = 'Confirmed' AND b.total_amount > 50.00
ORDER BY b.total_amount DESC;

SELECT booking_id, customer_id, status, total_amount, booking_date
FROM Bookings 
WHERE status = 'Pending' OR status = 'Cancelled'
ORDER BY booking_date DESC;

SELECT booking_id, customer_id, status, total_amount, booking_date
FROM Bookings 
WHERE NOT status = 'Cancelled'
ORDER BY booking_date DESC;

SELECT s.showtime_id, 
       m.title AS movie_title, 
       s.show_date, 
       s.start_time, 
       s.price, 
       s.hall_number
FROM Showtimes s
INNER JOIN Movies m ON s.movie_id = m.movie_id
WHERE s.show_date BETWEEN '2025-12-01' AND '2025-12-31'
ORDER BY s.show_date, s.start_time;

SELECT booking_id, customer_id, total_amount, booking_date, status
FROM Bookings 
WHERE total_amount BETWEEN 30.00 AND 70.00
ORDER BY total_amount;

SELECT movie_id, title, genre, rating, duration_minutes
FROM Movies 
WHERE title LIKE '%The%'
ORDER BY rating DESC;

SELECT customer_id, 
       CONCAT(fName, ' ', lName) AS full_name, 
       email, 
       loyalty_point
FROM Customers 
WHERE email LIKE '%@gmail.com'
ORDER BY loyalty_point DESC;

SELECT movie_id, title, genre, rating, release_date
FROM Movies 
WHERE genre LIKE 'Action%'
ORDER BY rating DESC;

SELECT customer_id, 
       CONCAT(fName, ' ', lName) AS full_name, 
       email, 
       phone
FROM Customers 
WHERE phone IS NULL;

SELECT movie_id, title, genre, description
FROM Movies 
WHERE description IS NOT NULL
ORDER BY rating DESC;

SELECT s.showtime_id, 
       m.title, 
       m.genre,
       s.show_date, 
       s.start_time, 
       s.price, 
       s.hall_number
FROM Showtimes s
INNER JOIN Movies m ON s.movie_id = m.movie_id
WHERE s.show_date BETWEEN '2025-12-01' AND '2025-12-31'
AND s.start_time >= '18:00:00'
AND s.price > 20.00
ORDER BY s.show_date, s.start_time;

SELECT DISTINCT 
       c.customer_id, 
       CONCAT(c.fName, ' ', c.lName) AS customer_name, 
       c.email,
       c.loyalty_point,
       COUNT(b.booking_id) AS total_bookings,
       SUM(b.total_amount) AS total_spent
FROM Customers c
INNER JOIN Bookings b ON c.customer_id = b.customer_id
WHERE c.loyalty_point >= 100
AND b.status = 'Confirmed'
GROUP BY c.customer_id, c.fName, c.lName, c.email, c.loyalty_point
ORDER BY c.loyalty_point DESC;

# sorting

SELECT movie_id, title, genre, release_date, rating, duration_minutes
FROM Movies 
ORDER BY release_date ASC;

SELECT movie_id, title, genre, rating, duration_minutes, release_date
FROM Movies 
ORDER BY rating DESC;

SELECT s.showtime_id, 
       m.title, 
       s.show_date, 
       s.start_time, 
       s.price, 
       s.hall_number
FROM Showtimes s
INNER JOIN Movies m ON s.movie_id = m.movie_id
ORDER BY s.show_date ASC, s.start_time ASC;

SELECT s.showtime_id, 
       m.title, 
       s.show_date, 
       s.start_time, 
       s.price
FROM Showtimes s
INNER JOIN Movies m ON s.movie_id = m.movie_id
ORDER BY s.price DESC 
LIMIT 5;

SELECT b.booking_id, 
       CONCAT(c.fName, ' ', c.lName) AS customer_name, 
       b.total_amount, 
       b.booking_date, 
       b.status
FROM Bookings b
INNER JOIN Customers c ON b.customer_id = c.customer_id
ORDER BY b.booking_date DESC 
LIMIT 10;

SELECT b.booking_id, 
       CONCAT(c.fName, ' ', c.lName) AS customer_name, 
       b.total_amount, 
       b.booking_date,
       b.status
FROM Bookings b
INNER JOIN Customers c ON b.customer_id = c.customer_id
WHERE b.status = 'Confirmed'
ORDER BY b.total_amount DESC 
LIMIT 5;

SELECT s.showtime_id, 
       m.title, 
       s.show_date, 
       s.start_time, 
       s.price
FROM Showtimes s
INNER JOIN Movies m ON s.movie_id = m.movie_id
WHERE s.show_date >= CURDATE()
ORDER BY s.price ASC
LIMIT 8;

SELECT customer_id, 
       CONCAT(fName, ' ', lName) AS full_name, 
       email, 
       loyalty_point,
       registration_date
FROM Customers
ORDER BY loyalty_point DESC
LIMIT 5;

# aggregation

SELECT COUNT(*) AS total_bookings 
FROM Bookings;

SELECT COUNT(*) AS confirmed_bookings 
FROM Bookings 
WHERE status = 'Confirmed';

SELECT status, 
       COUNT(*) AS booking_count
FROM Bookings
GROUP BY status
ORDER BY booking_count DESC;

#group by, having
SELECT hall_number,
	COUNT(*) AS showtime_count,
    round(AVG(price),2) AS avg_price
FROM Showtimes
GROUP BY hall_number
HAVING AVG(price) > 15;

#sum, concat, round, sum
SELECT SUM(total_amount) AS total_revenue,
       CONCAT('RM', ROUND(SUM(total_amount), 2)) AS formatted_revenue
FROM Bookings 
WHERE status = 'Confirmed';

#count, sum, concat, round, group by, order by
SELECT payment_method, 
       COUNT(*) AS transaction_count,
       SUM(amount) AS total_amount,
       CONCAT('RM', ROUND(SUM(amount), 2)) AS formatted_total
FROM Payments
GROUP BY payment_method
ORDER BY total_amount DESC;

#round, concat
SELECT AVG(total_amount) AS average_booking,
       ROUND(AVG(total_amount), 2) AS rounded_average,
       CONCAT('RM', ROUND(AVG(total_amount), 2)) AS formatted_avg
FROM Bookings 
WHERE status = 'Confirmed';

#count, avg, round, min, max, group by, order by
SELECT hall_number, 
       COUNT(*) AS showtime_count,
       AVG(price) AS avg_price,
       ROUND(AVG(price), 2) AS rounded_avg_price,
       MIN(price) AS min_price,
       MAX(price) AS max_price
FROM Showtimes
GROUP BY hall_number
ORDER BY hall_number;

#avg, round
SELECT AVG(loyalty_point) AS avg_loyalty_points,
       ROUND(AVG(loyalty_point), 2) AS rounded_avg
FROM Customers;

#max
SELECT MAX(total_amount) AS highest_booking_amount
FROM Bookings;

#max,min,round,avg
SELECT MAX(price) AS highest_price,
       MIN(price) AS lowest_price,
       ROUND(MAX(price) - MIN(price), 2) AS price_range,
       ROUND(AVG(price), 2) AS average_price
FROM Showtimes;

#max
SELECT movie_id, 
       title, 
       genre, 
       rating, 
       duration_minutes, 
       release_date
FROM Movies 
WHERE rating = (SELECT MAX(rating) FROM Movies);

#min
SELECT MIN(total_amount) AS lowest_booking_amount
FROM Bookings 
WHERE total_amount > 0;

#count + concat + case when + round + sum + avg + max + min
SELECT
COUNT(*) AS total_bookings,
COUNT(CASE WHEN status = 'Confirmed' THEN 1 END) AS confirmed_count,
COUNT(CASE WHEN status = 'Pending' THEN 1 END) AS pending_count,
COUNT(CASE WHEN status = 'Cancelled' THEN 1 END) AS cancelled_count,
CONCAT('RM', ROUND(SUM(total_amount), 2)) AS total_revenue,
CONCAT('RM', ROUND(AVG(total_amount), 2)) AS avg_booking_value,
CONCAT('RM', ROUND(MAX(total_amount), 2)) AS max_booking,
CONCAT('RM', ROUND(MIN(total_amount), 2)) AS min_booking
FROM Bookings;

# no.4 - 8
#TRUNCATE
truncate table payments; 

#UPPER + CONCAT
select fName, lName,
concat(fName, ' ', lName) as FullName,
upper(concat(fName, ' ', lName)) as UpperFullName
from customers; 

#LENGTH
select title,
length(title) as LengthTitle
from movies; 

#SUBSTR + CONCAT 
select fName, lName,
substr(fName,1,2), 
concat(substr(fName,1,2),lName) as userName
from customers;

#SUBQUERIES - Multiple row 
select fName as bookingABove30
from customers 
where customer_id IN (
	select customer_id
    from bookings
    where total_amount >= 30
);

#SUBQUERIES - single row 
select email
from customers
where loyalty_point > (
	select avg(loyalty_point)
    from customers
);

#subqueries - correlated 
select m.movie_id,
       m.title,
       (
           select MIN(s.price)
           from showtimes s
           where s.movie_id = m.movie_id
       ) as price
from movies m;

#union 
select hall_number
from seats
union 
select hall_number
from showtimes;

#not exist
select m.movie_id, m.title
from movies m
where not exists (
	select 1
    from showtimes s
    where m.movie_id = s.movie_id
);

#no.9 onwards
-- Natural join; between Bookings and Customers (both have customer_id)
SELECT *
FROM Bookings
NATURAL JOIN Customers
LIMIT 5;

-- Inner join; between Bookings and Showtimes
SELECT b.booking_id, c.fName, c.lName, s.show_date, s.start_time
FROM Bookings b
INNER JOIN Customers c ON b.customer_id = c.customer_id
INNER JOIN Showtimes s ON b.showtime_id = s.showtime_id
WHERE b.status = 'Confirmed';

-- Left join; showing all customers and their bookings (even if they have no bookings)
SELECT c.fName, c.lName, b.booking_id, b.status
FROM Customers c
LEFT JOIN Bookings b ON c.customer_id = b.customer_id;

-- inserting a customer with no booking for clearer inner join demonstration
INSERT INTO Customers (fName, lName)
VALUES ('Charlie', 'Wong');

-- self join; finding all pairs of bookings for each customer
SELECT 
    a.booking_id AS first_booking, 
    b.booking_id AS second_booking, 
    a.customer_id,
    CONCAT(c.fName, ' ', c.lName) AS customer_name
FROM Bookings a
INNER JOIN Bookings b 
    ON a.customer_id = b.customer_id 
    AND a.booking_id < b.booking_id
INNER JOIN Customers c
    ON a.customer_id = c.customer_id;

-- OPTIMIZATION USING INDEXES
-- BTREE INDEXING
CREATE INDEX idx_hall_number ON Showtimes(hall_number);

EXPLAIN
SELECT hall_number, 
       COUNT(*) AS showtime_count,
       AVG(price) AS avg_price,
       ROUND(AVG(price), 2) AS rounded_avg_price,
       MIN(price) AS min_price,
       MAX(price) AS max_price
FROM Showtimes
GROUP BY hall_number
ORDER BY hall_number;

-- FULLTEXT INDEXING
ALTER TABLE Movies
ADD FULLTEXT INDEX idx_movie_title_genre (title, genre);

EXPLAIN
SELECT *
FROM Movies
WHERE MATCH(title, genre) AGAINST('Action')
LIMIT 0, 1000;








