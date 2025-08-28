--characters
select first_name from EMPLOYEES where FIRST_NAME like 'S__a%'; -- like is used for searching __ represents the no of char ,%= after a other char are present of not does'nt matter 
select first_name from EMPLOYEES where FIRST_NAME like '%s%'; -- all the names containing s
select first_name from EMPLOYEES where FIRST_NAME like '%S%'; -- all the names starting from s
SELECT * from Dual; -- single row and single col dummy table used for calculations
-- string functions
select lower('SARA') from dual; -- all char in lower case
select upper('sara') from dual; -- all char in uper case
select FIRST_NAME, lower(FIRST_NAME) from EMPLOYEES;
select FIRST_NAME, upper(FIRST_NAME) from EMPLOYEES;
select INITCAP('syeda sara ali') from dual; -- first letter cap for every word
select length('Sara Ali') from dual; -- returns the length of string
select first_name, length(first_name) from employees;
select ltrim('   sara') from dual;-- trim from left side
select ltrim('Sara Ali','Sara') from dual;
select rtrim('   sara   ') from dual; -- trim from right side
select rtrim('Sara Ali','Ali') from dual;
select substr('Syeda Sara Ali',7,4) from dual; -- returns the substring based on index and the num of chars
select lpad('Wow',7,'*') from dual; -- adds * at left to make the string of size 7
select rpad('Wow',7,'*') from dual; -- adds * at right to make the string of size 7

