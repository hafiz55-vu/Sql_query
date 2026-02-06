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

DROP TABLE WORKER;

--1. Write an SQL query to print first three characters of  FIRST_NAME from Worker table. 
SELECT LEFT(FIRST_NAME,3) AS WORKER_NAME FROM WORKER;

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
SELECT * FROM WORKER WHERE FIRST_NAME IN ('Rana','Sajib');

--8. Write an SQL query to print details of workers excluding first names, “Rana” and “Sajib” 
--from Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME NOT IN ('Rana','Sajib');

--9. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%a%';

--10. Write an SQL query to print details of the Workers whose FIRST_NAME starts with ‘k’.

SELECT * FROM WORKER WHERE FIRST_NAME LIKE 'k%';

--11. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘r’ 
--and contains seven alphabets.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%r';
--12. Write an SQL query to find the position of the alphabet (‘n’) in the FIRST_NAME 
--column ‘Sanjoy’ from Worker table.
SELECT CHARINDEX('n',FIRST_NAME) AS POSITION_OF_N
FROM WORKER
WHERE FIRST_NAME = 'Sanjoy';

--13.  Find the average salary of employees for each department.
SELECT DEPARTMENT, AVG(SALARY) AS AVG_SALARY
FROM WORKER
GROUP BY DEPARTMENT;

--14. List all the employees who have maximum or minimum salary in each department
SELECT * FROM WORKER W
WHERE SALARY = (      
        SELECT MAX(SALARY)
        FROM WORKER 
        WHERE DEPARTMENT = W.DEPARTMENT
        )
     OR SALARY = (
        SELECT MIN(SALARY)
        FROM WORKER 
        WHERE DEPARTMENT = W.DEPARTMENT
        );

--15. Write an SQL query to find the position of the alphabet (‘r’) in the FIRST_NAME
--column ‘Rana’ from Worker table

SELECT CHARINDEX('r',FIRST_NAME) AS POSITION_OF_R FROM WORKER WHERE FIRST_NAME ='Rana';

--16. Write an SQL query to print the FIRST_NAME from Worker table after removing white
--spaces from the right side.
SELECT RTRIM(FIRST_NAME) AS FIRST_NAME FROM WORKER;

--17. Write an SQL query that fetches the unique values of FIRST_NAME from Worker table
--and prints its length.

SELECT DISTINCT FIRST_NAME,LEN(FIRST_NAME) AS NAME_LENGTH FROM WORKER;

--18. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’
--with ‘A’.
SELECT REPLACE(FIRST_NAME,'a','A') FROM WORKER;
