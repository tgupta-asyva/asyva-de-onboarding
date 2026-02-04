-- basics.sql

1. Filtering, Ordering, LIMIT

(i) Filtering --> Use WHERE to select specific rows.

    Select * from employees
    where department = 'IT';
👉 Shows only IT employees.

(ii) Ordering --> Use ORDER BY to sort data in ascending or descending. 

    Select * from employees
    Order BY Salary Desc;
👉 Highest salary first.

(iii) LIMIT --> Use LIMIT to restricts number of rows returned.

    Select * from employees
    Order BY Salary Desc
    LIMIT 5;
👉 Shows top 5 highest paid employees.

2. Aggregations (COUNT, SUM, AVG)

(i) COUNT --> number of rows

    Select Count(*) from employees;
👉 Total employees

(ii) SUM --> Total of a column

    Select SUM(Salary) from employees;
👉 Total salary payout

(iii) AVG --> Average value

     Select AVG(Salary) from employees;
👉 Average salary

3. NULL Handling (ISNULL & COALESCE)
	Both functions are used to handle NULL values by replacing them with a default value.

(i) ISNULL :- Replace NULL with a specified value.
	e.g: Select ISNULL (Salary, 0) as Salary from employees;
	If salary is null, it returns 0.

(ii) COALESCE :- Returns the first not Null value from a list.

	SELECT name, COALESCE(phone, email, 'Not Available') AS contact
	FROM customers;



