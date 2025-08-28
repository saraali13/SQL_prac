-- built in functions aggregate functions
select count(*) from EMPLOYEES; -- count(*) == count all 
select count(*)as total_employees from EMPLOYEES; -- as changes the col name in the output table
select count(*)as total_employees, MANAGER_ID from EMPLOYEES group by MANAGER_ID;
select distinct manager_id from EMPLOYEES; -- doing comparision if different or not
select manager_id from EMPLOYEES GROUP by manager_id; -- grouping the same managers ID
select sum(salary) as Total_Salary from EMPLOYEES;
select sum(salary) as Total_Salary from EMPLOYEES where manager_id = 101;
select manager_id, sum(salary) as Total_Salary from EMPLOYEES where manager_id <= 101 group by MANAGER_ID;
select min(salary) as minimum_salary from EMPLOYEES;
select max(salary) as minimum_salary from EMPLOYEES;
select avg(salary) as Avg_salary from EMPLOYEES;
