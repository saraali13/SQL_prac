--conditional statements
declare
    e_id employees.employee_id%type := 100;
    e_sal employees.salary%type;
    e_did employees.department_id%type;

begin
    select salary, department_id into e_sal, e_did from employees where employee_id = e_id;
    case e_did  --switch cases
    when 90 then
    update employees set salary = e_sal+100 where employee_id = e_id;
    dbms_output.put_line('Salary updated: '||e_sal);
    when 50 then
    update employees set salary = e_sal+50 where employee_id = e_id;
    dbms_output.put_line('Salary updated: '||e_sal);
    when 40 then
    update employees set salary = e_sal+10 where employee_id = e_id;
    dbms_output.put_line('Salary updated: '||e_sal);
    else
    dbms_output.put_line('No such record');
    end case;
end;

CASE --searched base
   WHEN sal < 5000 THEN raise_amt := 200;
   WHEN sal BETWEEN 5000 AND 10000 THEN raise_amt := 500;
   ELSE raise_amt := 1000;
END CASE;

--if then statements
declare
    e_id employees.employee_id%type := 100;
    e_sal employees.salary%type;
    e_did employees.department_id%type;

begin
select salary, department_id into e_sal, e_did from employees where employee_id = e_id;
   
IF e_sal > 10000 THEN
   e_sal := e_sal+2000;
ELSE
   e_sal := e_sal+1000;
END IF;

end;

declare
    e_id employees.employee_id%type := 100;
    e_sal employees.salary%type;
    e_did employees.department_id%type;

begin
select salary, department_id into e_sal, e_did from employees where employee_id = e_id;
   
IF e_sal > 10000 THEN
   e_sal := e_sal+3000;
ELSIF e_sal > 15000 THEN
   e_sal :=e_sal+2000;
ELSE
   e_sal := e_sal+1000;
END IF;

end;
