--first create the user
create user sara identified by sara;

-- on user file
create table students ( 
id int primary key,
std_name varchar(15),--name size > 3, only 1st 3 chars will be inserted
email varchar(20),
age int,
check(age>= 18) -- check if age if >= 18 table level constraint

);
select * from students;
alter table students add salary int; -- adds a col to the table
alter table students add (city varchar(15) default 'Karachi', dep_id int); -- adding 2 or more cols

alter table students add constraint unique_email unique(email); -- created a constraint named unique mail 
alter table students modify (std_name varchar(20) not null, email varchar(20) not null); --modified the table size constraints etc of the prev attributes
-- modify columns to be NOT NULL and change size of std_name to 20 chars

alter table students add (constraint
check_age check(age between 18 and 30),
constraint unique_email unique(email)); --primary key -> 1 col only unique and not null, while the unique constraint can be applied to more than one col and can be null too ( same for not null constraint)

create table departments(
id int primary key,
dep_name varchar(15) not null
);
select * from departments;
insert into departments(id,dep_name) values (2,'AI'); -- inserting row data DML operation 
insert into departments(id,dep_name) values (3,'ds'); -- inserting row data keep editing this one for inserting other vals too

select * from students;
alter table students drop column dep_id;
alter table students add (dep_id int , foreign key(dep_id) references departments(id));
insert into students(id, std_name, email,age, salary,dep_id) values(1,'Ali Haider','alihaider@gmail.com',21,230000,2);-- dep id 10 error (not found in primary key)
alter table students rename column email to std_email;
insert into students(id, std_name, std_email,age, salary,dep_id) values(3,'Ali akber','ali@gmail.com',18,120000,1); -- age == 17 constraint that age != < 18

select * from students;
delete from students where id in(1,2,3); -- prev id serial no, can not be repeated for primary key
truncate table stuedents; ---- prev id serial no, can be repeated for primary key ( refreshes the primary key)
insert into students(id, std_name, std_email,age, salary,dep_id) values(5,'Ali hussain','ali@gmail.com',18,120000,1); 
insert into students(id, std_name, std_email,age, salary,dep_id) values(3,'Ali akber','aliii@gmail.com',18,120000,1); --even 

--for updating the row values
UPDATE employee
SET dep_id = 3
WHERE emp_id = 5;
