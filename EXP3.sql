CREATE TABLE WORKER (
    WORKER_ID INT,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(50),
    SALARY INT
);

INSERT INTO WORKER VALUES
(1,'Rana','Hamid','2014-04-11 09:00:00','Admin',100000),
(2,'Sanjoy','Saha','2014-02-20 09:00:00','HR',80000),
(3,'Mahmudul','Hasan','2014-06-11 09:00:00','Admin',300000),
(4,'Asad','Zaman','2014-02-20 09:00:00','HR',500000),
(5,'Sajib','Mia','2014-02-20 09:00:00','Admin',500000),
(6,'Alamgir','Kabir','2014-06-11 09:00:00','Admin',200000),
(7,'Foridul','Islam','2014-06-11 09:00:00','Account',75000),
(8,'Keshob','Ray','2014-01-20 09:00:00','Account',90000);

SELECT * FROM WORKER;

SELECT COUNT(SALARY) FROM WORKER;

SELECT COUNT(*) FROM WORKER;

SELECT MAX(SALARY) FROM WORKER;

SELECT 
COUNT(*) AS Total_Worker,
SUM(SALARY) AS Total_Salary,
AVG(SALARY) AS Average_Salary,
MAX(SALARY) AS Highest_Salary,
MIN(SALARY) AS Lowest_Salary
FROM WORKER;

SELECT DEPARTMENT,SUM(SALARY) AS TOTAL_SALARY
FROM WORKER 
GROUP BY DEPARTMENT;

SELECT DEPARTMENT , SUM(SALARY) AS TOTAL_SALARY
FROM WORKER
GROUP BY DEPARTMENT
HAVING  SUM(SALARY) > 350000;

--1. Write an SQL query to print first three characters of  FIRST_NAME from Worker table. 
SELECT LEFT(FIRST_NAME,3) FROM WORKER;

SELECT SUBSTRING(FIRST_NAME,1,3) FROM WORKER;

--2. Write an SQL query to print details of the Workers who have joined from Feb 2014 to March 2014.
SELECT * FROM WORKER WHERE JOINING_DATE BETWEEN'2014-02-01'AND'2014-03-01';

--3. Write an SQL query to print details of the Workers who have served for at least 6 months.
SELECT * FROM WORKER
WHERE DATEDIFF(MONTH,JOINING_DATE,GETDATE()) >= 6;
--4. Write an SQL query to update all worker salary whose title is manager. 
UPDATE WORKER SET SALARY = SALARY + 5000
WHERE 
--5. Write an SQL query to update all worker bonus 10% whose joining_date before ‘2014
--04-11 09:00:00’ otherwise bonus update 5% and also check department name is ‘Admin’.
UPDATE WORKER
SET BONUS = CASE 
                WHEN JOINING_DATE < '2014-04-11 09:00:00' THEN SALARY * 0.10
                ELSE SALARY * 0.05
            END
WHERE DEPARTMENT = 'Admin';

--6. Write an SQL query to delete all workers who have not taken any bonus. 

--7. Write an SQL query to print details for Workers with the first name “Rana” and “Sajib” 
--from Worker table. 

--8. Write an SQL query to print details of workers excluding first names, “Rana” and “Sajib” 
--from Worker table. 

--9. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’. 

--10. Write an SQL query to print details of the Workers whose FIRST_NAME starts with ‘k’.

--11. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘r’ 
--and contains seven alphabets. 

--12. Write an SQL query to find the position of the alphabet (‘n’) in the FIRST_NAME 
--column ‘Sanjoy’ from Worker table. 
