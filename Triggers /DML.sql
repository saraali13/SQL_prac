-- Main demo table
CREATE TABLE superheroes (
   sh_name VARCHAR2(30)
);

SET SERVEROUTPUT ON;
--before insert
CREATE OR REPLACE TRIGGER bi_superheroes
BEFORE INSERT ON superheroes
FOR EACH ROW
ENABLE
DECLARE
   v_user VARCHAR2(15);
BEGIN
   SELECT user INTO v_user FROM dual;
   DBMS_OUTPUT.PUT_LINE('You Just Inserted a Row Mr. ' || v_user);
END;
/

--before update
CREATE OR REPLACE TRIGGER bu_superheroes
BEFORE UPDATE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
   v_user VARCHAR2(15);
BEGIN
   SELECT user INTO v_user FROM dual;
   DBMS_OUTPUT.PUT_LINE('You Just Updated a Row Mr. ' || v_user);
END;
/

--before delete
CREATE OR REPLACE TRIGGER bd_superheroes
BEFORE DELETE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
   v_user VARCHAR2(15);
BEGIN
   SELECT user INTO v_user FROM dual;
   DBMS_OUTPUT.PUT_LINE('You Just Deleted a Row Mr. ' || v_user);
END;
/

CREATE OR REPLACE TRIGGER tr_superheroes
BEFORE INSERT OR DELETE OR UPDATE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
   v_user VARCHAR2(15);
BEGIN
   SELECT USER INTO v_user FROM dual;

   IF INSERTING THEN
      DBMS_OUTPUT.PUT_LINE('One line inserted by ' || v_user);

   ELSIF DELETING THEN
      DBMS_OUTPUT.PUT_LINE('One line deleted by ' || v_user);

   ELSIF UPDATING THEN
      DBMS_OUTPUT.PUT_LINE('One line updated by ' || v_user);

   END IF;
END;
/

CREATE TABLE sh_audit(
   new_name VARCHAR2(30),
   old_name VARCHAR2(30),
   user_name VARCHAR2(30),
   entry_date VARCHAR2(30),
   operation VARCHAR2(30)
);
CREATE OR REPLACE TRIGGER superheroes_audit
BEFORE INSERT OR DELETE OR UPDATE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
   v_user VARCHAR2(30);
   v_date VARCHAR2(30);
BEGIN
   SELECT user,
          TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS')
   INTO   v_user, v_date
   FROM dual;

   IF INSERTING THEN
      INSERT INTO sh_audit VALUES (:new.sh_name, NULL, v_user, v_date, 'Insert');

   ELSIF DELETING THEN
      INSERT INTO sh_audit VALUES (NULL, :old.sh_name, v_user, v_date, 'Delete');

   ELSIF UPDATING THEN
      INSERT INTO sh_audit VALUES (:new.sh_name, :old.sh_name, v_user, v_date, 'Update');

   END IF;
END;
/

CREATE TABLE superheroes_backup AS
SELECT * FROM superheroes WHERE 1 = 2;

CREATE OR REPLACE TRIGGER sh_backup
BEFORE INSERT OR DELETE OR UPDATE ON superheroes
FOR EACH ROW
ENABLE
BEGIN
   IF INSERTING THEN
      INSERT INTO superheroes_backup VALUES (:new.sh_name);

   ELSIF DELETING THEN
      DELETE FROM superheroes_backup
      WHERE sh_name = :old.sh_name;

   ELSIF UPDATING THEN
      UPDATE superheroes_backup
      SET sh_name = :new.sh_name
      WHERE sh_name = :old.sh_name;

   END IF;
END;
/

