SET TRANSACTION NAME 'sal_update';

UPDATE employees 
SET salary = 7000 
WHERE last_name = 'Banda';

SAVEPOINT after_banda_sal;

UPDATE employees 
SET salary = 12000 
WHERE last_name = 'Greene';

SAVEPOINT after_greene_sal;

ROLLBACK TO SAVEPOINT after_banda_sal;

UPDATE employees 
SET salary = 11000 
WHERE last_name = 'Greene';

ROLLBACK;  -- undo everything
