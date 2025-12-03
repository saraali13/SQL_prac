SET TRANSACTION NAME 'customer_order_transaction';

INSERT INTO customer VALUES (101, 'Sara', 20000);
SAVEPOINT customer_added;

INSERT INTO orders VALUES (1, 101, 5000);
UPDATE customer SET balance = balance - 5000 WHERE cust_id = 101;
SAVEPOINT order_added;

-- check if balance negative
DECLARE
   bal NUMBER;
BEGIN
   SELECT balance INTO bal FROM customer WHERE cust_id = 101;
   IF bal < 0 THEN
      ROLLBACK TO customer_added; -- undo only the order
   ELSE
      COMMIT;
   END IF;
END;
/
