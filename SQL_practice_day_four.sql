1. 
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION.
Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%a' OR
CITY LIKE '%e' OR
CITY LIKE '%i' OR
CITY LIKE '%o' OR
CITY LIKE '%u';

2. 
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u)
as both their first and last characters. 
Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) IN ('A', 'E', 'I', 'O', 'U')
AND RIGHT(CITY,1) IN ('a', 'e', 'i', 'o', 'u')

3.
Query the list of CITY names from STATION that do not start with vowels. 
Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY,1) NOT IN ('A', 'E', 'I', 'O', 'U');

4.
Query the Name of any student in STUDENTS who scored higher than  Marks.
Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), 
secondary sort them by ascending ID.

SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY SUBSTR(NAME,-3,3), ID ASC;

5.
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

SELECT NAME
FROM EMPLOYEE
ORDER BY NAME;

6.
Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. 
Sort your result by ascending employee_id.

SELECT NAME
FROM EMPLOYEE
WHERE SALARY > 2000
AND MONTHS < 10
ORDER BY EMPLOYEE_ID;

7.
Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.
Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.

SELECT C.COMPANY_CODE, C.FOUNDER, COUNT(DISTINCT LM.LEAD_MANAGER_CODE), COUNT(DISTINCT SM.SENIOR_MANAGER_CODE),
COUNT(DISTINCT M.MANAGER_CODE), COUNT(DISTINCT E.EMPLOYEE_CODE)
FROM COMPANY AS C
JOIN LEAD_MANAGER AS LM 
ON C.COMPANY_CODE = LM.COMPANY_CODE
JOIN SENIOR_MANAGER AS SM
ON LM.LEAD_MANAGER_CODE = SM.LEAD_MANAGER_CODE
JOIN MANAGER AS M
ON SM.SENIOR_MANAGER_CODE = M.SENIOR_MANAGER_CODE
JOIN EMPLOYEE AS E
ON M.MANAGER_CODE = E.MANAGER_CODE
GROUP BY C.COMPANY_CODE, C.FOUNDER
ORDER BY C.COMPANY_CODE;

8.
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than . Round your answer to  decimal places.

SELECT ROUND(LONG_W, 4)
FROM STATION 
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC LIMIT 1;

9.
Consider  and  to be two points on a 2D plane.

 happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.

SELECT ROUND(ABS(MIN(LAT_N)-MAX(LAT_N))+ ABS(MIN(LONG_W)-MAX(LONG_W)),4)
FROM STATION;

10. Consider  and  to be two points on a 2D plane where  are the respective minimum and maximum values of Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.

SELECT ROUND(SQRT(POWER(MAX(LAT_N)-MIN(LAT_N),2)+ POWER(MAX(LONG_W)-MIN(LONG_W),2)),4)
FROM STATION;