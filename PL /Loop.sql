--Basic loop
DECLARE
   i NUMBER := 1;
BEGIN
   LOOP
      DBMS_OUTPUT.PUT_LINE(i);
      i := i + 1;
      EXIT WHEN i > 5;
   END LOOP;
END;
/
  
--while loop
DECLARE i NUMBER := 1;
BEGIN
   WHILE i <= 5 LOOP
      DBMS_OUTPUT.PUT_LINE(i);
      i := i + 1;
   END LOOP;
END;
/

--for loop
BEGIN
   FOR i IN 1..5 LOOP
      DBMS_OUTPUT.PUT_LINE(i);
   END LOOP;
END;
/

--for loop with cursor 
FOR rec IN (SELECT first_name, salary FROM employees WHERE department_id = 90)
LOOP
   DBMS_OUTPUT.PUT_LINE(rec.first_name || ' - ' || rec.salary);
END LOOP;
