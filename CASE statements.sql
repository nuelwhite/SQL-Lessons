/*
	In MySQL, CASE statements are used for conditional logic. Just like in python, Java or any other programming language, CASE statements are similar to IF-THEN-ELSE statements. It helps you create an output based in a condition or criteria. 

Basic Sybtax:
CASE
	WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE default_result
END

* WHEN specifies the condition to check 
* THEN specifies the result if the condition is true
* ELSE specifies the default result if no conditions are true. It is optional
* END marks the end of the CASE statement.
*/

-- EXAMPLE 1
-- Suppose we have a students table with columns: student_id, name, and score. You want to categorize the scores as Pass, Merit, and Distinction

SELECT 
	student_id,
    name,
    score,
    CASE 
		WHEN score>= 75 THEN 'Distinction'
        WHEN score >= 50 THEN 'Merit'
        WHEN SCORE >= 35 THEN 'Pass'
        END AS grade
FROM students;


-- EXAMPLE 2
-- You can use CASE statements with Aggregate Functions

SELECT 
	position,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN town_name = 'Rural' THEN 1 ELSE 0 END) AS rural_workers
FROM 
	employee
GROUP BY 
	position;  -- This query counts the total number of employees, and number of employees in rural towns per position.
    
    
-- EXAMPLE 3
-- Using CASE in ORDER BY 
SELECT first_name, occupation, salary
FROM employee_salary
ORDER BY 
	CASE 
		WHEN salary = 10000 THEN 1
        ELSE 0
	END DESC; -- doesn't really make sense right? LOL. But it is worth it. Might be useful some time.
    
 
 -- EXAMPLE  4
 -- You can use CASE IN HAVING  clause to filter results based on conditional logic. 
 
SELECT occupation, SUM(salary) as total_salary
FROM employee_salary
GROUP BY occupation
HAVING 
	CASE 
		WHEN SUM(salary) > 100000 THEN 1
        ELSE 0
	END = 0;
    
    
-- EXAMPLE 5
-- You can nest CASE statements just like nested IF statements 
SELECT 
	employee_id,
    salary,
    CASE
		WHEN salary >= 10000 THEN
			CASE 
				WHEN salary > 20000 THEN 'High Income'
                ELSE 'Moderate Income'
			END
		ELSE 'Low Income'
	END AS income_category
FROM
    employee_salary;
    
/*
	KEY POINTS TO REMEMBER 
* The CASE statement must always end wih END
* If no conditions match, the ELSE clause is used. If ELSE is omitted and no conditions match, the result is NULL. 
* You can use CASE statements in SELECT, ORDER BY, GROUP BY, na dHAVING clauses.
*/