CREATE TABLE schema_audit (
   ddl_date       DATE,
   ddl_user       VARCHAR2(15),
   object_created VARCHAR2(15),
   object_name    VARCHAR2(15),
   ddl_operation  VARCHAR2(15)
);

CREATE OR REPLACE TRIGGER hr_audit_tr
AFTER DDL ON SCHEMA
BEGIN
   INSERT INTO schema_audit
   VALUES (
      SYSDATE,
      sys_context('USERENV','CURRENT_USER'),
      ora_dict_obj_type,
      ora_dict_obj_name,
      ora_sysevent
   );
END;
/

CREATE OR REPLACE TRIGGER db_audit_tr
AFTER DDL ON DATABASE
BEGIN
   INSERT INTO schema_audit
   VALUES (
      sysdate,
      sys_context('USERENV','CURRENT_USER'),
      ora_dict_obj_type,
      ora_dict_obj_name,
      ora_sysevent
   );
END;
/

CREATE TABLE hr_evnt_audit(
   event_type VARCHAR2(30),
   logon_date DATE,
   logon_time VARCHAR2(15),
   logof_date DATE,
   logof_time VARCHAR2(15)
);

CREATE OR REPLACE TRIGGER hr_lgon_audit
AFTER LOGON ON SCHEMA
BEGIN
   INSERT INTO hr_evnt_audit
   VALUES (
      ora_sysevent,
      SYSDATE,
      TO_CHAR(sysdate,'HH24:MI:SS'),
      NULL,
      NULL
   );
   COMMIT;
END;
/

CREATE OR REPLACE TRIGGER log_off_audit
BEFORE LOGOFF ON SCHEMA
BEGIN
   INSERT INTO hr_evnt_audit
   VALUES (
      ora_sysevent,
      NULL,
      NULL,
      SYSDATE,
      TO_CHAR(sysdate,'HH24:MI:SS')
   );
   COMMIT;
END;
/

CREATE TABLE db_evnt_audit(
   username VARCHAR2(30),
   event_type VARCHAR2(30),
   logon_date DATE,
   logon_time VARCHAR2(15),
   logof_date DATE,
   logof_time VARCHAR2(15)
);

CREATE OR REPLACE TRIGGER db_lgof_audit
BEFORE LOGOFF ON DATABASE
BEGIN
   INSERT INTO db_evnt_audit
   VALUES (
      user,
      ora_sysevent,
      NULL,
      NULL,
      SYSDATE,
      TO_CHAR(sysdate,'HH24:MI:SS')
   );
END;
/

CREATE TABLE startup_audit (
   event_type VARCHAR2(15),
   event_date DATE,
   event_time VARCHAR2(15)
);

CREATE OR REPLACE TRIGGER startup_audit
AFTER STARTUP ON DATABASE
BEGIN
   INSERT INTO startup_audit
   VALUES (
      ora_sysevent,
      SYSDATE,
      TO_CHAR(sysdate,'HH24:MM:SS')
   );
END;
/

CREATE OR REPLACE TRIGGER tr_shutdown_audit
BEFORE SHUTDOWN ON DATABASE
BEGIN
   INSERT INTO startup_audit
   VALUES (
      ora_sysevent,
      SYSDATE,
      TO_CHAR(sysdate,'HH24:MM:SS')
   );
END;
/

CREATE TABLE trainer (
   full_name VARCHAR2(20)
);

CREATE TABLE subject (
   subject_name VARCHAR2(15)
);
INSERT INTO trainer VALUES ('Sohail Ahmed');
INSERT INTO subject VALUES ('Database Systems');
CREATE VIEW db_lab_09_view AS
SELECT full_name, subject_name
FROM trainer, subject;
CREATE OR REPLACE TRIGGER tr_io_insert
INSTEAD OF INSERT ON db_lab_09_view
FOR EACH ROW
BEGIN
   INSERT INTO trainer(full_name) VALUES (:new.full_name);
   INSERT INTO subject(subject_name) VALUES (:new.subject_name);
END;
/

CREATE OR REPLACE TRIGGER io_update
INSTEAD OF UPDATE ON db_lab_09_view
FOR EACH ROW
BEGIN
   UPDATE trainer
   SET full_name = :new.full_name
   WHERE full_name = :old.full_name;

   UPDATE subject
   SET subject_name = :new.subject_name
   WHERE subject_name = :old.subject_name;
END;
/
CREATE OR REPLACE TRIGGER io_delete
INSTEAD OF DELETE ON db_lab_09_view
FOR EACH ROW
BEGIN
   DELETE FROM trainer WHERE full_name = :old.full_name;
   DELETE FROM subject WHERE subject_name = :old.subject_name;
END;
/
