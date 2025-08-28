-- date and time functions
select add_months ('16-sep-2004',2) from dual; -- adds the number of months in the given month
select MONTHS_BETWEEN('10-dec-2010','10-jan-2009') from dual; -- return the number of months in between 2 months (bigger one, smaller one) else will return -ve val
select next_day('4-nov-2005','wednesday') from dual; -- when is wed comming after the given date
select last_day('1-oct-2005') from dual; -- returns the last day of the month
select new_time('6-aug-2023','ISL','EST') from dual; -- not working due to time zone issue
select new_time('6-aug-2023','PST','EST') from dual; -- not working due to time zone issue

-- conversion functions
select to_char(sysdate,'DD-MM-YY') from dual; 
select to_char(sysdate,'Day') from dual;
SELECT * FROM EMPLOYEES WHERE to_char(hire_date,'Day')= 'Wednesday';
SELECT * FROM EMPLOYEES WHERE to_char(hire_date,'Day')= 'Friday   ';
