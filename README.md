# MySQL

Day wise Assignment Questions

**Note: -**

1\. The tables that are mentioned in the questions for the references are available in the classic model database.

2\. In the questions, if they specifically mention to create the tables, then you need to create the tables as per given specifications.

## Day 1
No questions

## Day 2
No questions                                                

## Day 3
Show customer number, customer name, state and credit limit from customers table for below conditions. Sort the results by highest to lowest values of creditLimit.  State should not contain null values credit limit should be between 50000 and 100000   **Expected output:**  ![](media/1ac6eda76bf5c759c8c0080a3d777a41.png)          Show the unique productline values containing the word cars at the end from products table. **Expected output:**  ![](media/fb56b61cc5ded36bdc2cedecae48fb3a.png)

## Day 4
Show the orderNumber, status and comments from orders table for shipped status only. If some comments are having null values then show them as “-“.   **Expected output:**   ![](media/eac817a22d5e4176789046c4660878b7.png)  Select employee number, first name, job title and job title abbreviation from employees table based on following conditions. If job title is one among the below conditions, then job title abbreviation column should show below forms. President then “P” Sales Manager / Sale Manager then “SM” Sales Rep then “SR” Containing VP word then “VP” ![](media/ba8c862f43ec870708a2f1f20b61cb70.png) **Expected output:**        |

## Day 5:
For every year, find the minimum amount value from payments table.  **Expected output:**  ![](media/96018223e4c395c30d804c92b4ad29d1.png)      For every year and every quarter, find the unique customers and total orders from orders table. Make sure to show the quarter as Q1,Q2 etc.  **Expected output:**   ![](media/10db75fdbb9d4895d57c275f201c03ad.png)                 Show the formatted amount in thousands unit (e.g. 500K, 465K etc.) for every month (e.g. Jan, Feb etc.) with filter on total amount as 500000 to 1000000. Sort the output by total amount in descending mode. [ Refer. Payments Table]   **Expected output:**  ![](media/ee2361f56c2cb5e4e5567e3ebffc88bd.png)

## Day 6:
1.  Create a journey table with following fields and constraints.
-   Bus_ID (No null values)
-   Bus_Name (No null values)
-   Source_Station (No null values)
-   Destination (No null values)
-   Email (must not contain any duplicates)
1.  Create vendor table with following fields and constraints.
-   Vendor_ID (Should not contain any duplicates and should not be null)
-   Name (No null values)
-   Email (must not contain any duplicates)
-   Country (If no data is available then it should be shown as “N/A”)
1.  Create movies table with following fields and constraints.
-   Movie_ID (Should not contain any duplicates and should not be null)
-   Name (No null values)
-   Release_Year (If no data is available then it should be shown as “-”)
-   Cast (No null values)
-   Gender (Either Male/Female)
-   No_of_shows (Must be a positive number)
1.  Create the following tables. Use auto increment wherever applicable

a. Product

-   product_id - primary key
-   product_name - cannot be null and only unique values are allowed
-   description
-   supplier_id - foreign key of supplier table

    b. Suppliers

    -   supplier_id - primary key
    -   supplier_name
    -   location

        c. Stock

    -   id - primary key
    -   product_id - foreign key of product table
    -   balance_stock

## Day 7

1.  Show employee number, Sales Person (combination of first and last names of employees), unique customers for each employee number and sort the data by highest to lowest unique customers.

    Tables: Employees, Customers

    **Expected output:**

    ![](media/81e94d2fe7c52a2e25ca64f083d7577c.png)

2.  Show total quantities, total quantities in stock, left over quantities for each product and each customer. Sort the data by customer number.

    Tables: Customers, Orders, Orderdetails, Products

    **Expected output:**

    ![](media/ab27c1c65489f7f10bc922c379dfd85d.png)

3.  Create below tables and fields. (You can add the data as per your wish)
-   Laptop: (Laptop_Name)
-   Colours: (Colour_Name)

Perform cross join between the two tables and find number of rows.

**Expected output:**

![](media/06f0577bae43fe7334ddfc7ddae9b9f1.png)

1.  Create table project with below fields.
-   EmployeeID
-   FullName
-   Gender
-   ManagerID

    Add below data into it.

    INSERT INTO Project VALUES(1, 'Pranaya', 'Male', 3);

    INSERT INTO Project VALUES(2, 'Priyanka', 'Female', 1);

    INSERT INTO Project VALUES(3, 'Preety', 'Female', NULL);

    INSERT INTO Project VALUES(4, 'Anurag', 'Male', 1);

    INSERT INTO Project VALUES(5, 'Sambit', 'Male', 1);

    INSERT INTO Project VALUES(6, 'Rajesh', 'Male', 3);

    INSERT INTO Project VALUES(7, 'Hina', 'Female', 3);

    Find out the names of employees and their related managers.

    **Expected output:**

    ![](media/a681e538164486fb0ed918ea133c336c.png)

## Day 8

Create table facility. Add the below fields into it.

-   Facility_ID
-   Name
-   State
-   Country

i) Alter the table by adding the primary key and auto increment to Facility_ID column.

ii) Add a new column city after name with data type as varchar which should not accept any null values.

**Expected output:**

![](media/3e7af87babe210cc693c031f11b0a9cc.png)

## Day 9

Create table university with below fields.

-   ID
-   Name

Add the below data into it as it is.

INSERT INTO University

VALUES (1, " Pune University "),

(2, " Mumbai University "),

(3, " Delhi University "),

(4, "Madras University"),

(5, "Nagpur University");

Remove the spaces from everywhere and update the column like Pune University etc.

**Expected output:**

![](media/34a800cbf765f1812ef228e2a3eef45e.png)

## Day 10

Create the view products status. Show year wise total products sold. Also find the percentage of total value for each year. The output should look as shown in below figure.

**Expected output:**

![](media/e5f993db0500f174ca1c77f02218b417.png)

## Day 11

1.  Create a stored procedure GetCustomerLevel which takes input as customer number and gives the output as either Platinum, Gold or Silver as per below criteria.

    Table: Customers

-   Platinum: creditLimit \> 100000
-   Gold: creditLimit is between 25000 to 100000
-   Silver: creditLimit \< 25000
1.  Create a stored procedure Get_country_payments which takes in year and country as inputs and gives year wise, country wise total amount as an output. Format the total amount to nearest thousand unit (K)

    Tables: Customers, Payments

    **Expected output:**

    ![](media/8d5bfc397781e13ed57dff3a5025b054.png)

## Day 12

1.  Calculate year wise, month name wise count of orders and year over year (YoY) percentage change. Format the YoY values in no decimals and show in % sign.

    Table: Orders

    **Expected output:**

![](media/d5ccba2db3cc829548af83c47efde2f3.png)

1.  Create the table emp_udf with below fields.
-   Emp_ID
-   Name
-   DOB

    Add the data as shown in below query.

    INSERT INTO Emp_UDF(Name, DOB)

    VALUES ("Piyush", "1990-03-30"), ("Aman", "1992-08-15"), ("Meena", "1998-07-28"), ("Ketan", "2000-11-21"), ("Sanjay", "1995-05-21");

    Create a user defined function calculate_age which returns the age in years and months (e.g. 30 years 5 months) by accepting DOB column as a parameter.

    **Expected output:**

    ![](media/72908a6a58ae08241a478a1d1822d787.png)

## Day 13

1.  Display the customer numbers and customer names from customers table who have not placed any orders using subquery

    Table: Customers, Orders

    **Expected output:**

    ![](media/85d99a853a1304f82c08477b1715ae2d.png)

1.  Write a full outer join between customers and orders using union and get the customer number, customer name, count of orders for every customer.

    Table: Customers, Orders

    **Expected output:**

![](media/d795f61e4c0349a480aaaadaad5c3d5f.png)

1.  Show the second highest quantity ordered value for each order number.

    Table: Orderdetails

    **Expected output:**

    ![](media/fd4ebcaab87642f04a943872506d4878.png)

1.  For each order number count the number of products and then find the min and max of the values among count of orders.

    Table: Orderdetails

    **Expected output:**

    ![](media/2dd2e5463916e152a26343b3efb0d3bd.png)

1.  Find out how many product lines are there for which the buy price value is greater than the average of buy price value. Show the output as product line and its count.

    **Expected output:**

![](media/dddccda3bb88532290caed4f86f0a75d.png)

## Day 14

Create the table Emp_EH. Below are its fields.

-   EmpID (Primary Key)
-   EmpName
-   EmailAddress

Create a procedure to accept the values for the columns in Emp_EH. Handle the error using exception handling concept. Show the message as “Error occurred” in case of anything wrong.

## Day 15

Create the table Emp_BIT. Add below fields in it.

-   Name
-   Occupation
-   Working_date
-   Working_hours

Insert the data as shown in below query.

INSERT INTO Emp_BIT VALUES

('Robin', 'Scientist', '2020-10-04', 12),

('Warner', 'Engineer', '2020-10-04', 10),

('Peter', 'Actor', '2020-10-04', 13),

('Marco', 'Doctor', '2020-10-04', 14),

('Brayden', 'Teacher', '2020-10-04', 12),

('Antonio', 'Business', '2020-10-04', 11);

Create before insert trigger to make sure any new value of Working_hours, if it is negative, then it should be inserted as positive.






<table>
<tr>
<td>
     <img src="https://avatars.githubusercontent.com/u/152955475?s=400&u=a4c92fe2b757b82173b9469b771153177034a7ab&v=4" width="180"/>
     
     nikhilkori03@gmail.com

<p align="center">
<a href = "https://github.com/Nikhilkori03"><img src = "http://www.iconninja.com/files/241/825/211/round-collaboration-social-github-code-circle-network-icon.svg" width="36" height = "36"/></a>
<a href = "https://www.linkedin.com/in/nikhil-kori-31664a2a3//"><img src = "http://www.iconninja.com/files/863/607/751/network-linkedin-social-connection-circular-circle-media-icon.svg" width="36" height="36"/></a>
</p>
</td>
</tr> 
  </table>

<div style="display:fill;
            border-radius: false;
            border-style: solid;
            border-color:#000000;
            border-style: false;
            border-width: 2px;
            color:#CF673A;
            font-size:15px;
            font-family: Georgia;
            background-color:#E8DCCC;
            text-align:center;
            letter-spacing:0.1px;
            padding: 0.1em;">

## Thank You
