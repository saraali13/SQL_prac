-- built in functions numeric functions
select abs(-90) from dual; -- always return absolute function (always positive)
select ceil(90.3) from dual; -- return the greater value for numbers in decimal
select ceil(-90.3) from dual;
select floor(90.3) from dual;-- return the smaller value for numbers in decimal
select floor(-90.3) from dual;
select trunc(90.23456,2) from dual; -- show the mentioned num after dec point
select round(90.5478) from dual; -- return roundoffed value .%5>=
select greatest(90,100,190) from dual; -- return the greatest value
select least(90,100,190) from dual; -- return the smallest value
