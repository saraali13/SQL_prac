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

SET AUTOCOMMIT ON;
INSERT INTO worker VALUES (3, 'FAST-NU', 5000); -- auto-committed
SET AUTOCOMMIT OFF;

--locking
UPDATE worker SET salary = 6000 WHERE worker_id = 1;
UPDATE worker SET salary = 7000 WHERE worker_id = 1; --will wait till commit or rollback

SET TRANSACTION NAME 'test_transaction';

INSERT INTO worker VALUES (2, 'Erum', 5500);
SAVEPOINT sp1;

UPDATE worker SET salary = 6000 WHERE worker_name = 'Erum';
SAVEPOINT sp2;

ROLLBACK TO SAVEPOINT sp1; -- salary returns to 5500

COMMIT;


