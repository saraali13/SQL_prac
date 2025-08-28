-- concatenation
select first_name || salary as first_name_and_salary from EMPLOYEES;
SELECT all salary from EMPLOYEES; -- similar to select salary from employees
-- desc and asc are usually used for sorting 
select salary from EMPLOYEES order by (salary) DESC; -- arranged in descending order
select salary from EMPLOYEES order by (salary) ASC; -- arranged in ascending order
select first_name, HIRE_DATE from EMPLOYEES order by (FIRST_NAME) ASC; -- arranged in ascending order (a to z)
