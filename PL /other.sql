--Views
CREATE OR REPLACE VIEW emp_simple AS
SELECT employee_id, first_name, salary
FROM employees
WHERE department_id = 80;

CREATE OR REPLACE VIEW emp_dept_view AS
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

CREATE MATERIALIZED VIEW mv_emp AS --physically stores data
SELECT employee_id, first_name, salary
FROM employees
WHERE department_id = 90;

--procedures
CREATE OR REPLACE PROCEDURE add_location
(
   street   VARCHAR2,
   city     VARCHAR2,
   country  VARCHAR2
) --parameters
IS
   new_id NUMBER;
BEGIN
   SELECT MAX(location_id) INTO new_id FROM locations;
   new_id := new_id + 1;

   INSERT INTO locations VALUES(new_id, street, city, country);

   DBMS_OUTPUT.PUT_LINE('Inserted ID: ' || new_id);
END;
/
EXEC add_location('DHA','Karachi','PK');

--Functions
CREATE OR REPLACE FUNCTION dept_salary (d_id NUMBER)
RETURN NUMBER
IS
   total NUMBER;
BEGIN
   SELECT SUM(salary) INTO total 
   FROM employees
   WHERE department_id = d_id;

   RETURN total;
END;
/
SELECT dept_salary(80) FROM dual;

--explicit cursor
DECLARE
   CURSOR c IS 
      SELECT employee_id, first_name, salary FROM employees;
   rec c%ROWTYPE;
BEGIN
   OPEN c;
   LOOP
      FETCH c INTO rec;
      EXIT WHEN c%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(rec.first_name || ' - ' || rec.salary);
   END LOOP;
   CLOSE c;
END;
