CREATE TABLE Department (
    Dep_ID INT PRIMARY KEY,
    Dep_Name VARCHAR(100) NOT NULL
);

CREATE TABLE Student (
    Std_ID INT PRIMARY KEY,
    Std_Name VARCHAR(100) NOT NULL,
    Dep_ID INT,
    GPA DECIMAL(3,2),
    Fee_Paid DECIMAL(12,2),
    FOREIGN KEY (Dep_ID) REFERENCES Department(Dep_ID)
);

create table faculty(
id int primary key,
name varchar(20)
);
alter table student add (f_id int ,CONSTRAINT fk_emp_dept foreign key(f_id) references faculty(id));

select s.Std_ID,s.Std_Name,s.gpa ,f.name as fac_name from student s inner join faculty f on s.f_id = f.id;--dono k common fetch 
select s.Std_ID,s.Std_Name,s.gpa ,f.name as fac_name from student s left join faculty f on s.f_id = f.id;--left ka pura table (right common wala srf or uncommon m null)
select s.Std_ID,s.Std_Name,s.gpa ,f.name as fac_name from student s right join faculty f on s.f_id = f.id;-- right ka pura table (left common..........................)
alter table faculty add mentot_id int;
--self join (connecting faculty table with faculty table itself)
update FACULTY set mentot_id=1 where id in (2,3);
select f.id,f.name ,m.name as mentor_name from faculty f inner join faculty m on f.MENTOT_ID=m.ID;
