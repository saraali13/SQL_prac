UPDATE worker SET salary = 6000 WHERE worker_id = 1;
COMMIT; --saves chages permanently

UPDATE worker SET salary = 6000 WHERE worker_id = 1;
ROLLBACK; --returns to old val (not permanent)

SAVEPOINT sp1;
UPDATE worker SET salary = 8000 WHERE worker_id = 1;
ROLLBACK TO sp1;
--Only undo changes after the savepoint, Earlier actions remain safe
SET TRANSACTION NAME 'salary_update';
SET AUTOCOMMIT ON;
SET AUTOCOMMIT OFF;
