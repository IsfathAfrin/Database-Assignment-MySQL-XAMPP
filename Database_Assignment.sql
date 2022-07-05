#1.Create a database named class_one_assignment.
CREATE DATABASE CLASS_ONE_ASSIGNMENT;

USE CLASS_ONE_ASSIGNMENT;

#2.create a table named customers.
CREATE TABLE CUSTOMERS(
id INT AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL,
phone VARCHAR(15) NOT NULL,
address VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
state VARCHAR(50) NOT NULL,
points INT(50) NOT NULL,
PRIMARY KEY(id)
);

SELECT * FROM customers;

#3.insert the following customer data:

INSERT INTO customers(first_name, last_name, date_of_birth, phone, address,city,state,points) VALUES
('Babara','MacCaffrey','1986-03-28','781-932-9754','0 Sage Terrace', 'Waltham','MA','2273'),
('Ines', 'Brushfield','1986-04-13','804-427-9456','14187 Commercial Trail','Hampton','VA','947'),
('Freddi','Boagey','1985-02-07','719-724-7869','251 Springs Junction','Colorado Springs','CO','2967'),
('Ambur','Roseburgh','1974-04-14','407-231-8017','30 Arapahoe Terrace','Orlando','FL','457'),
('Clemmie','Betchley','1973-11-07','','5 Spohn Circle','Arlington', 'TX','3675')
;
#4. Show only 2 members whose points are more than 1000.
SELECT * FROM customers WHERE points>1000;

#5. Find the customers whose age is in 1980 to 1990 or points less than 1000.
SELECT * FROM customers WHERE date_of_birth BETWEEN 1980 AND 1990 OR points<1000;

#6. Order the customers by points in ascending and descending order.
SELECT * FROM customers ORDER BY points 
SELECT * FROM customers ORDER BY points DESC

#7. Find the customer whose name contains 'burgh' using like and regexp.
SELECT * FROM customers WHERE CONCAT(first_name ," ",last_name) LIKE CONCAT('%burgh%')
SELECT * FROM customers WHERE CONCAT(first_name ," ",last_name) REGEXP 'burgh'

#8. Find the customer who does not have phone number.
SELECT * FROM customers WHERE phone='';

#9. Change the 'Date of Birth' column name into 'dob'.
ALTER TABLE customers CHANGE COLUMN date_of_birth dob DATE;

#10. Find the max point holder customer.
SELECT MAX(points) AS points FROM customers ; 

#11. Execute a query for the following scenario.
SELECT id, first_name,last_name,points,
CASE WHEN points < 1000 THEN 'Bronze'
WHEN points > 1000 AND points < 2000 THEN 'Silver'
WHEN points > 2000 AND points < 3000 THEN 'Gold'
ELSE 'Platinum'
END AS Member
FROM customers
