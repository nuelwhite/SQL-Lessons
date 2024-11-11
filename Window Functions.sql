/*			WINDOW FUNCTIONS
Window Functions are easier I guess. But it takes continous learning and practice (just as any other skill) to get full grasp of it. I found it challenging for a while before I understood the concept. This script provides lessons on how to use window functions.

What are Window Functions?
A window function in MySQL performs a calculation across a set of rows (the window) related to the current row. Unlike Aggregate functions, window functions do not reduce the number of rows returned. 

The basic syntax for window function is:
window_function() OVER(
	PARTITION BY column_name
    ORDER BY column_name
)
	* window_function(): The function you want to apply (eg, ROW_NUMBER, RANK, AVG)
    * PARTITION BY: Divides the result into partitions, just like GROUP BY
    * ORDER BY: Orders rows within each partition
*/

/*
	01. RANKING FUNCTIONS
RANK functions return a ranking value for each row in a partition. Depending in the function that is used, some rows might recieve the same value as other rows. The RANK functions are:
A. ROW_NUMBER() => Assigns a unique sequential integer to rows within a partition
B. RANK() => Assigns ranks, but has gaps if there are ties.
C. DENSE_RANK() => Similar to RANK(), but proceeds to the next rank without gaps.
*/

-- A. ROW_NUMBER()
SELECT 
	employee_id, 
    occupation, 
    salary, 
    ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY salary DESC) AS ranked	-- employees are partitioned seperately, employees are ranked by salary in descending order.
FROM employee_salary;

-- B. RANK() vs DENSE_RANK()
SELECT 
	employee_id,
    occupation,
    salary,
    RANK() OVER(PARTITION BY occupation ORDER BY salary DESC) as `rank`,
    DENSE_RANK() OVER(PARTITION BY occupation ORDER BY salary DESC) as `dense_rank`
FROM employee_salary;


/*
	02. Aggregate Functions 
You can use aggregate functions like SUM(), AVG(), MIN(), and MAX() as qindow functions. A typical example is when you are calculating a running total
*/

-- A. SUM()
SELECT 
	employee_id,
    gender,
    age,
    SUM(age) OVER(ORDER BY employee_id) AS running_total
FROM employee_demographics;

-- B. AVG()
SELECT 
	employee_id,
    gender,
    age,
    ROUND(AVG(age) OVER(ORDER BY gender)) AS average
FROM employee_demographics;


/*
	03. LAG() and LEAD()
These are positional functions. A positional function is a type of window function that are very useful in creating reports, because they can refer to data from previous rows abouve or below the current row.
A. LAG() => Returns the value from the previous row
B. LEAD() => Returns the value from subsequent row
*/

SELECT 
	employee_id,
    first_name,
    LAG(salary, 1) OVER(ORDER BY salary) AS previous_salary, -- gets the salary from the previous row
    LEAD(salary, 1) OVER(ORDER BY salary) AS next_salary	-- gets the salary from the next row
FROM employee_salary;


/*
	NTILE()
This functions enables us to divide rows into a specified number of buckets. NTILE(4) divides it into 4 parts
*/

SELECT 
	employee_id,
    salary,
    NTILE(4) OVER(ORDER BY salary) AS salary_quartile
FROM employee_salary;
