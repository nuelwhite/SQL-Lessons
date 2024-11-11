/* This MySQL Script is a based on time functions. This provides a comprehensive summary of how to use the various date and time functions. I was analyzing a dataset using MySQL and got stuck. Learning about the various functions I decided to make this for future reference and also help people who want to understand the fucntions
Date and Time functions are used to manipulate and querying date and time data.
*/

/*	01. Getting the Current Date and Time function. 
This functions are used to get the current date and times of the data. There are 3 popular functions:
A. NOW() => Returns the current date and time.
B. CURDATE() => Returns the current date
C. CURTIME() => Returns the current time
*/

-- A. NOW()
SELECT NOW();	-- returns current date and time

-- B. CURDATE()
SELECT CURDATE();	-- returned current date

-- C. CURTIME()
SELECT CURTIME();	-- returned current time


/*	02. Extracting Parts of Date.
This function is used to extract specific parts of a date data. You can select the year, month, day, etc. The functions include:
A. YEAR() => Returns the year
B. MONTH() => Returns the month
C. DAY() => Returns the day
D. HOUR() => Returns the hour
*/

-- A. YEAR
SELECT YEAR(NOW()); 	-- returned current year

-- B. MONTH 
SELECT MONTH(NOW());	-- returned current month

-- C. DAY()
SELECT DAY(NOW());		-- returned current day

-- D. HOUR()
SELECT HOUR(NOW());		-- returned current year


/*	03. Formatting Dates
The Date format function is used to format dates according to specific formats. 
The date format is written as DATE_FORMAT(). This function takes two arguments

There are some things to note when formatting date and time.
H -> returns the hour in a 24 hour format, eg: 14:00:00
h -> returns the hour in a 12 hour format, eg: 02:00:00
y -> returns only the last two digits of the year, eg: 24
Y -> returns the full year, eg: 2024
M -> returns the full month name
m -> returns the month number
*/

-- A. Format 1 - '%Y-%M-%D'
SELECT DATE_FORMAT(NOW(), '%Y-%M-%D');

-- B. Format 2 - '%Y/%M/%d'
SELECT DATE_FORMAT(NOW(), '%y/%m/%d');

-- C. Format 3 - '%Y:%M:%d'
SELECT DATE_FORMAT(NOW(), '%h:%I:%S');


/*	04. Date Arithmetic
Date arithmetic functions enables us to perform arithmetic operations on date and time. It allows to add or subtract a time interval or days. 
A. DATE_ADD() => Adds a time interval to a date
B. DATE_SUB() => Subtracts a time interval from a date
C. DATEDIFF() => Returns the difference between two dates. 
*/

-- A. DATE_ADD()
SELECT DATE_ADD(CURDATE(), INTERVAL 7 DAY);		-- adds 7 days

-- B. DATE_SUB()
SELECT DATE_SUB(CURDATE(), INTERVAL 1 MONTH); 	-- subtracts one month

-- C. DATEDIFF()
SELECT DATEDIFF('2024-12-25', CURDATE()); 	-- days until christmas


/*	05. Calculating Time Difference
This time functions calculates the difference between two timestamps in a specified unit, eg: hours, seconds, minutes. 
We use the TIMESTAMPDIFF() function. 
*/

SELECT TIMESTAMPDIFF(HOUR, '2024-11-11 12:00:00', NOW()); 	-- 2 hours passed since 12 noon

/*	06. Converting Strings to Date/Time
This function is used to convert a string to a date or time format. 
The function we use for this is STR_TO_DATE().
*/

SELECT STR_TO_DATE('08-11-2024', '%d-%m-%y');

/*	07. Getting the day of the week
This function is used to return the day of the week. There are two functions to get the day of the week.
A. DAYOFWEEK() - Returns the index of the day (1 = Sunday, 7 = Saturday)
B. WEEKDAY() - Returns the index of the day (0 = Monday, 6 = Sunday)
*/

-- DAYOFWEEK()
SELECT DAYOFWEEK(NOW()); -- 2 = Monday

-- WEEKDAY()
SELECT WEEKDAY(NOW()); -- 0 = Monday

/* 	08. Checking if a Date is in a Specific Range
This function is used to check if a date is within a specific function. It uses the BETWEEN function to check. 
*/

SELECT * 
FROM Orders 
WHERE order_date 
BETWEEN '2024-11-11' AND '2024-12-01';


/*	09. Extracting Week, Monthm or Quarter
This set of functions enable us retrieve the week, month, or quarter of the date/time data we are working on.
A. WEEK => Extracts the week
B. Month => Extracts the month
C. QUARTER => Extracts the quarter
*/

-- A. WEEK()
SELECT WEEK(NOW());		-- We are currently in week 45

-- B. MONTH()	
SELECT MONTH(NOW());	-- 11TH Month returned

-- C. QUARTER()
SELECT QUARTER(NOW())	-- 4TH Quarter returned 


/*
	
*/