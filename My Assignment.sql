use classicmodels;
show tables;

# Day - 3 (1)

select * from customers; 
select customernumber, customername, state, creditlimit from customers 
where state is not null and creditlimit between 50000 and 100000 order by creditlimit desc;

# Day - 3 (2)

select * from products;
select distinct productline from products where productLine like '%%%cars';

# Day - 4 (1)

select * from orders;
select ordernumber, status, ifnull(comments,'-') as comments from orders;

# Day - 4 (2)

select * from employees;
select employeenumber,
		firstname,
		jobtitle,
			case
				when jobtitle = 'President' then 'P'
                when jobtitle like 'Sales Manager%' then 'SM'
                when jobtitle like 'Sale Manager%' then 'SM'
                when jobtitle = 'Sales Rep' then 'SP'
                when jobtitle like 'VP%%%' then 'VP'
			end as jobtitleabbreviation
    from employees;

# Day - 5 (1)

select * from payments;
select year(paymentDate) as paymentYear,
       min(amount) as minimumAmount
from payments
group by paymentYear;

# Day - 5 (2)

select * from orders;
select year(orderDate) as orderYear,
       concat('Q', quarter(orderDate)) as orderQuarter,
       count(distinct customerNumber) as uniqueCustomers,
       count(*) as totalOrders
from orders
group by orderYear, orderQuarter
order by orderYear, orderQuarter;

# Day - 5 (3)

select * from payments;
select
    monthname(paymentDate) as month,
    format(sum(amount) / 1000, 0) as formattedAmount
from payments
group by month
having sum(amount) between 500000 and 1000000
order by sum(amount) desc;

# Day - 6 (1)

use classicmodels;
create table journey (
    Bus_ID int primary key not null,
    Bus_Name varchar(255) not null,
    Source_Station varchar(255) not null,
    Destination varchar(255) not null,
    Email varchar(255) unique
);
# Day - 6 (2)

create table vendor (
	Vendor_ID int unique not null,
    Name varchar(20) not null,
    Email varchar(40) unique,
	Country varchar(40) default'N/A'
);

# Day - 6 (3)

create table Movies (
	Movies_ID int unique not null,
    Name varchar(40) not null,
    Release_Year int default ('-'),
    Cast varchar(200) not null,
    Gender enum ('Male','Female') not null,
	No_of_shows int check ( No_of_shows >= 0) not null
 );
    
# Day - 6 (4) (a)

create table Product (
	Product_ID int primary key,
    Product_Name varchar(200) unique not null,
    Description text,
    Supplier_ID int,
    foreign key (Supplier_ID) references Suppliers(Supplier_ID)
    );
    
# Day - 6 (4) (b)

create table Suppliers (
	Supplier_ID int primary key,
    Supplier_Name varchar(40) not null,
	Location Varchar (40) not null
    );
    
# Day - 6 (4) (c)

create table Stock (
	ID int primary key,
    Product_ID int references product(Product_ID),
    Balance_stock int
    );

# Day - 7 (1)

select 
		employeenumber,
		concat(e.firstname,' ',e.lastname) as SalesPerson,
		count(distinct c.customerName) as UniqueCustomers
from 
	employees as e join customers as c on
    e.employeenumber = c.salesRepEmployeeNumber
group by 
	employeenumber
order by 
	uniquecustomers desc;

# Day - 7 (2)

SELECT 
    c.CustomerNumber,
    c.CustomerName,
    p.ProductCode,
    p.Productname,
    SUM(od.QuantityOrdered) as Ordered_Quantities,
    SUM(p.QuantityInStock) as Total_Inventory,
    SUM(p.QuantityInStock - od.QuantityOrdered) as Left_Quantities
FROM 
    Customers as c
JOIN 
    Orders as o ON c.CustomerNumber = o.CustomerNumber
JOIN 
    OrderDetails as od ON o.OrderNumber = od.OrderNumber
JOIN 
    Products p ON od.ProductCode = p.ProductCode
GROUP BY 
    c.CustomerNumber, p.ProductCode,   c.CustomerName, p.Productname
ORDER BY 
    c.CustomerNumber;

# Day - 7 (3)

create table 
	laptop (Company_Name varchar(100) not null);
            
insert into laptop value ('Del'),('HP');

create table 
	Colour (Colour_Name varchar(100) not null);
    
 insert into Colour value ('White'),('Silver'),('Black');
 
 select * from laptop cross join Colour order by company_name;
 
# Day - 7 (4)

create table project (
		EmployeeID int,
        Full_Name varchar(100),
        Gender varchar(10) check (Gender in ('Male','Female')),
        Manager int);
        
INSERT INTO Project VALUES(1, 'Pranaya', 'Male', 3);
INSERT INTO Project VALUES(2, 'Priyanka', 'Female', 1);
INSERT INTO Project VALUES(3, 'Preety', 'Female', NULL);
INSERT INTO Project VALUES(4, 'Anurag', 'Male', 1);
INSERT INTO Project VALUES(5, 'Sambit', 'Male', 1);
INSERT INTO Project VALUES(6, 'Rajesh', 'Male', 3);
INSERT INTO Project VALUES(7, 'Hina', 'Female', 3);

select 
	m.full_name as Manager_Name,
    e.full_name as Emp_Name
from
	project as m
join
	project as e on m.EmployeeID= e.Manager
order by manager_name;

# Day - 8

create table facility (
	Facility_ID int,
    Name varchar(100),
    State varchar(100),
    Country varchar(100));
    
alter table facility 
		modify Facility_ID int not null primary key auto_increment;
alter table facility add city varchar(100); 

alter table facility
	add city varchar(100) not null after name ;
desc facility;

# Day - 9

create table University (
		ID int not null,
        Name varchar(100) not null);

INSERT INTO University
VALUES (1, "       Pune          University     "), 
               (2, "  Mumbai          University     "),
              (3, "     Delhi   University     "),
              (4, "Madras University"),
              (5, "Nagpur University");

select  Id, replace(replace(trim(both ' ' from name), '     ', ' '),'  ' ,' ') as Name from university;

#Day - 10

create view products_status as
select
    YEAR(o.orderDate) AS Year,
    CONCAT(COUNT(od.productCode), ' (', ROUND(COUNT(od.productCode) / (SELECT COUNT(*) FROM orderdetails) * 100), '%)') AS Value
FROM
    orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY Year;

select * from products_status;

# Day - 11 (1)

DELIMITER //
CREATE PROCEDURE GetCustomerLevel(IN customerNumber INT, OUT CustomerLevel VARCHAR(20))
BEGIN
    DECLARE creditLimit DECIMAL(10, 2);
    
    -- Get the credit limit for the specified customer number
    SELECT creditLimit INTO CreditLimit FROM Customers WHERE customerNumber = CustomerNumber;
    
    -- Determine the customer level based on credit limit
    CASE
        WHEN creditLimit > 100000 THEN
            SET CustomerLevel = 'Platinum';
        WHEN creditLimit BETWEEN 25000 AND 100000 THEN
            SET CustomerLevel = 'Gold';
        WHEN creditLimit < 25000 THEN
            SET CustomerLevel = 'Silver';
        ELSE
            SET CustomerLevel = 'Unknown';
    END CASE;
END //
DELIMITER ;

# Day - 11 (2)

DELIMITER //

CREATE PROCEDURE Get_country_payments(IN inputYear INT, IN inputCountry VARCHAR(255))
BEGIN
    SELECT 
        YEAR(p.paymentDate) AS paymentYear,
        c.country AS paymentCountry,
        CONCAT(FORMAT(SUM(p.amount) / 1000, 0), 'K') AS totalAmount
    FROM
        Payments as p
    JOIN Customers as c ON p.customerNumber = c.customerNumber
    WHERE
        YEAR(p.paymentDate) = inputYear AND c.country = inputCountry
    GROUP BY
        paymentYear, paymentCountry;
END //

DELIMITER ;

# Day - 12 (1)

SELECT
    YEAR(orderDate) AS Year,
    MONTHNAME(orderDate) AS Month,
    COUNT(*) AS TotalOrders,
    CONCAT(
        IFNULL(FORMAT(
            (COUNT(*) - LAG(COUNT(*)) OVER (ORDER BY YEAR(orderDate), MONTH(orderDate))) / LAG(COUNT(*)) OVER (ORDER BY YEAR(orderDate), MONTH(orderDate)) * 100,
            0
        ), 'NULL'),
        '%'
    ) AS '% YoY Change'
FROM
    Orders
GROUP BY
    YEAR(orderDate), MONTH(orderDate)
ORDER BY
    YEAR(orderDate), MONTH(orderDate);

# Day - 12 (2)

create table emp_udf (
    Emp_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    DOB DATE
);

INSERT INTO Emp_UDF(Name, DOB)
VALUES ("Piyush", "1990-03-30"), ("Aman", "1992-08-15"), ("Meena", "1998-07-28"), ("Ketan", "2000-11-21"), ("Sanjay", "1995-05-21");

DELIMITER //
create function calculate_age(dob DATE) RETURNS VARCHAR(50)
DETERMINISTIC
READS SQL DATA
begin
    DECLARE years INT;
    DECLARE months INT;
    DECLARE age VARCHAR(50);
    SET years = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    SET months = TIMESTAMPDIFF(MONTH, dob, CURDATE()) - (years * 12);
    SET age = CONCAT(years, ' years ', months, ' months');
    RETURN age;
end //
DELIMITER ;

SELECT Name, DOB, calculate_age(DOB) AS Age FROM emp_udf;

# Day - 13 (1)

select customerNumber, customerName
from Customers
where customerNumber NOT IN (
    select customerNumber
    from Orders
);

# Day - 13 (2)

select c.customerNumber, c.customerName, COUNT(o.orderNumber) AS orderCount
from Customers c
left join Orders o on c.customerNumber = o.customerNumber
GROUP BY c.customerNumber, c.customerName

UNION

select c.customerNumber, c.customerName, COUNT(o.orderNumber) AS orderCount
from Orders o
right join Customers c on o.customerNumber = c.customerNumber
GROUP BY c.customerNumber, c.customerName;

# Day - 13 (3)

select orderNumber, MAX(quantityOrdered) AS secondHighestQuantity
from Orderdetails as od
WHERE quantityOrdered < (select MAX(quantityOrdered) from Orderdetails where orderNumber = od.orderNumber)
GROUP BY orderNumber;

# Day - 13 (4)

SELECT MAX(productCount) AS `MAX(Total)`, MIN(productCount) AS `MIN(Total)`
FROM (
    SELECT orderNumber, COUNT(*) AS productCount
    FROM Orderdetails
    GROUP BY orderNumber
) as abc;

# Day - 13 (5)

select productLine, COUNT(*) as Total
from products
where buyPrice > (select AVG(buyPrice) from products)
GROUP BY productLine;

# Day - 14

create table Emp_EH(
EmpID int primary key,
EmpName char(25),
EmailAddress varchar(50)
);


DELIMITER //
CREATE PROCEDURE InsertIntoEmp_EH(
    IN input_EmpID INT,
    IN input_EmpName VARCHAR(100),
    IN input_EmailAddress VARCHAR(100)
)
BEGIN
    DECLARE error_occurred BOOLEAN DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION, SQLWARNING, NOT FOUND
    BEGIN
        SET error_occurred = TRUE;
    END;

    START TRANSACTION;

    -- Insert the values into Emp_EH
    INSERT INTO Emp_EH (EmpID, EmpName, EmailAddress)
    VALUES (input_EmpID, input_EmpName, input_EmailAddress);

    IF error_occurred THEN
        ROLLBACK;
        SELECT 'Error occurred' AS Message;
    ELSE
        COMMIT;
        SELECT 'Data inserted successfully' AS Message;
    END IF;
END //
DELIMITER ;

CALL InsertIntoEmp_EH(1, 'Shubh', 'shubh@example.com');

select * from emp_eh;

# Day - 15

create table Emp_BIT(
Name char(50),
Occupation VARCHAR(100),
Working_date DATE,
Working_hours INT
);

INSERT INTO Emp_BIT VALUES
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);  

DELIMITER //
CREATE TRIGGER Before_Insert_Emp_BIT
BEFORE INSERT ON Emp_BIT
FOR EACH ROW
BEGIN
    IF NEW.Working_hours < 0 THEN
        SET NEW.Working_hours = -NEW.Working_hours;
    END IF;
END //
DELIMITER ;

SHOW TRIGGERS ;