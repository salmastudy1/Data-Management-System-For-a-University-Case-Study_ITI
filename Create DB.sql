create table unidepartments(
 depart_id int primary key,
 name varchar(50) );
 
 create table students (
 ID int primary key, 
 fname varchar(50),
 lname varchar(50),
 email varchar(100),
 address varchar(255),
 depart_id int, 
 foreign key (depart_id) references unidepartments (depart_id) );
 
 alter table students
add  constraint  unique_email UNIQUE (email);
 
 create table courses (
 ID varchar(10) primary key,
 name varchar(25),
 depart_id int, 
 foreign key (depart_id) references unidepartments (depart_id) );
 
 alter table  courses
add  constraint unique_course UNIQUE (name);
 
 create table take (
 grade varchar(10),
 semester varchar(10),
 year number(10),
 Student_ID int,
 foreign key (Student_ID) references students (ID),
 Course_ID varchar(10),
 foreign key (Course_ID) references courses (ID)
 );
 
 insert into unidepartments (depart_id, name)
 values 
 (1, 'Architecture');
 
  insert into unidepartments (depart_id, name)
 values 
 (2, 'Civil');
 
  insert into unidepartments (depart_id, name)
 values 
 (3, 'Computer');
 
  insert into unidepartments (depart_id, name)
 values 
 (4, 'Mechatronics');
 
  insert into unidepartments (depart_id, name)
 values 
 (5, 'Communication');
 
  insert into students (id, fname, lname, email, address, depart_id)
 values 
 (2001, 'Amira', 'Haytham','amira@gmail.com','23 abbas,Cairo', 2);
 
 insert into students (id, fname, lname, email, address, depart_id)
 values 
 (2002, 'Farida ', 'Amgad','Farida@gmail.com','26 elnahass ,Cairo',2);
 
 insert into students (id, fname, lname, email, address, depart_id)
 values 
 (2003, 'Salma', 'Osama','salma@gmail.com','20 sheraton,Cairo',3);
 
 insert into students (id, fname, lname, email, address, depart_id)
 values 
 (2004, 'Sama', 'Mohamed','sama@gmail.com','1 feisal,Giza',1);
 
 insert into students (id, fname, lname, email, address, depart_id)
 values 
 (2005, 'Shahd', 'Adel','shahd@gmail.com','23 abbas,Giza',1);
 
 insert into students (id, fname, lname, email, address, depart_id)
 values 
 (2006, 'Samir', 'Ibrahim','samir@gmail.com','23 tahrir,Cairo',4);
 
 insert into students (id, fname, lname, email, address, depart_id)
 values 
 (2007, 'Mohamed', 'Karim','mohamed@gmail.com','13 Abbasya,Cairo', 5);
 
 
 insert into courses (id, name, depart_id)
 values('CSE123', 'computer programming', 3);
 
  insert into courses (id, name, depart_id)
 values('CSE122', 'data structure', 3);
 
  insert into courses (id, name, depart_id)
 values('MEP123', 'production', 2);
 
  insert into courses (id, name, depart_id)
 values('Arch001', 'drawing1', 1);
 
  insert into courses (id, name, depart_id)
 values('Arch002', 'drawing2', 1);
 
 
 insert into take(grade, semester, year, student_id, course_id)
 values ('A', 'Spring', 2015, 2001, 'MEP123');
 
  insert into take(grade, semester, year, student_id, course_id)
 values ('B', 'Fall', 2016, 2002, 'MEP123');
 
  insert into take(grade, semester, year, student_id, course_id)
 values ('C', 'Summer', 2013, 2003, 'CSE122');
 
  insert into take(grade, semester, year, student_id, course_id)
 values ('D', 'Spring', 2020, 2004, 'Arch002');
 
  select grade, fname, lname 
 from students s, take t
 where t.student_id = s.id and s.id = 2001;
 
 alter table courses 
 add credit_hours number;
 
 alter table take 
 add credit_point number(8,2);
 
  update take set credit_point = 3
  where course_id = 'MEP123';
  
   update take set credit_point = 3
  where course_id = 'Arch002';
  
  alter table take
rename column credit_hours TO credit_point;

update courses set credit_hours = 3
  where id = 'Arch002';
  
  alter table take rename to  register;
  
   insert into register(grade, semester, year, student_id, course_id)
 values ('A', 'Spring', 2015, 2001, 'Arch001');
 
  insert into register(grade, semester, year, student_id, course_id)
 values ('B', 'Fall', 2016, 2002, 'Arch001');
 
   insert into register(grade, semester, year, student_id, course_id)
 values ('C', 'Summer', 2013, 2003, 'CSE122');
 
  insert into register (grade, semester, year, student_id, course_id)
 values ('D', 'Spring', 2020, 2004, 'Arch002');
 
  insert into students (id, fname, lname, email, address, depart_id)
 values 
 (2008, 'David', 'Peter','david@gmail.com','23 roxy,Cairo', 3);
 
  insert into students (id, fname, lname, email, address, depart_id)
 values 
 (2009, 'Doaa', 'Tamer','doaa@gmail.com','113 abbas,Cairo', 5);
 
   insert into students (id, fname, lname, email, address, depart_id)
 values 
 (2010, 'Safia', 'Hany','safia@gmail.com','23 tahrir,Cairo', 2);
 
  insert into students (id, fname, lname, email, address, depart_id)
 values 
 (2011, 'Adel', 'Rashad','adel@gmail.com','27 sheraton,Cairo', 3);
 
  insert into students (id, fname, lname, email, address, depart_id)
 values 
 (2012, 'Heba', 'Basem','heba@gmail.com','78 feisal,Giza', 1);
 
  
  insert into students (id, fname, lname, email, address, depart_id)
 values 
 (2013, 'Maria', 'Samir','maria@gmail.com','11 abbas,Cairo', 2);
 
  insert into students (id, fname, lname, email, address, depart_id)
 values 
 (2014, 'Mai', 'Mohab','mai@gmail.com','99 zahraa,Cairo', 3);
 
 insert into students (id, fname, lname, email, address, depart_id)
 values 
 (2015, 'Ehab', 'Khaled','ehab@gmail.com','23 abbas,Cairo', 1);
 
  insert into students (id, fname, lname, email, address, depart_id)
 values 
 (2016, 'Marwan', 'Taha','marwan@gmail.com','44 mokattam,Cairo', 2);
 
 --insert into register(grade, semester, year, student_id, course_id)
 --values ('A', 'Spring', 2018, 2003, 'CSE223');
  insert into courses (id, name, depart_id, credit_hours)
 values('CSE223', 'Agile', 3,2);
 
  insert into courses (id, name, depart_id, credit_hours)
 values('MCT348', 'Intro to mechatronics', 4,2);
 
  insert into courses (id, name, depart_id, credit_hours)
 values('MDP446', 'Quality Control', 2,3);
 
   insert into courses (id, name, depart_id, credit_hours)
 values('ARC144', 'Architecture 3', 1,3);
 
  insert into courses (id, name, depart_id, credit_hours)
 values('CES373', 'Construction Management', 2,2);
 
  update courses set credit_hours = 3 
 where id = 'cse123' or id ='CSE122' or id = 'MEP123' or id ='Arch001' or id ='Arch002';
 
  insert into register(grade, semester, year, student_id, course_id)
 values ('B', 'Spring', 2017, 2001, 'cse123');
 
  
 insert into register(grade, semester, year, student_id, course_id)
 values ('B', 'Spring', 2017, 2002, 'MEP123');
 
  insert into register(grade, semester, year, student_id, course_id)
 values ('C', 'Spring', 2017, 2001, 'MDP446');
 
 insert into register(grade, semester, year, student_id, course_id)
 values ('B', 'Spring', 2011, 2001, 'cse123');
 
 
  insert into register(grade, semester, year, student_id, course_id)
 values ('A', 'Spring', 2017, 2012, 'ARC144');
 
  insert into register(grade, semester, year, student_id, course_id)
 values ('A', 'Spring', 2017, 2009, 'cse123');
 
  insert into register(grade, semester, year, student_id, course_id)
 values ('A', 'Spring', 2017, 2006, 'MCT348');
 
  update register
set credit_point=NULL;

 insert into register(grade, semester, year, student_id, course_id)
 values ('C', 'Fall', 2016, 2002, 'MEP123');
 
   insert into register(grade, semester, year, student_id, course_id)
 values ('C-', 'Spring', 2017, 2001, 'Arch002');

--alter table register
--drop constraint  student_id,
--drop constraint  course_id;



alter table register
add constraint register_PK primary key (Student_ID, semester, Course_ID);

alter table unidepartments
rename table  departments;

 update courses set credit_hours = 3
  where id = 'CSE123';

alter table register
drop column credit_point;