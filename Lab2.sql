Lab 2 Exercises
--1. Consider the following UNIVERSITY database schema. Create tables DEPARTMENT, INSTRUCTOR, COURSE, SECTION, and TEACHES with the following structure.


create table department
	(dept_name		varchar(20),
	 building		varchar(15),
	 budget		    numeric(12,2) check (budget > 0),
	-- primary key (dept_name)
	);

create table course
	(course_id		varchar(8),
	 title			varchar(50),
	 dept_name		varchar(20),
	 credits		numeric(2,0) check (credits > 0),
	 --primary key (course_id),
	 --foreign key (dept_name) references department
		--on delete set null
	);

create table instructor
	(ID			varchar(5),
	 name			varchar(20) not null,
	 dept_name		varchar(20),
	 salary			numeric(8,2) check (salary > 29000),
	-- primary key (ID),
	 --foreign key (dept_name) references department
	--	on delete set null
	);

create table section
	(course_id		varchar(8),
         sec_id			varchar(8),
	 semester		varchar(6)
		check (semester in ('Fall', 'Winter', 'Spring', 'Summer')),
	 year			numeric(4,0) check (year > 1701 and year < 2100),
	 building		varchar(15),
	 room_number		varchar(7),
	 time_slot_id		varchar(4),
	 --primary key (course_id, sec_id, semester, year),
	-- foreign key (course_id) references course
	--	on delete cascade,
	--	on delete set null
	);

create table teaches
	(ID			varchar(5),
	 course_id		varchar(8),
	 sec_id			varchar(8),
	 semester		varchar(6),
	 year			numeric(4,0),
	-- primary key (ID, course_id, sec_id, semester, year),
	 --foreign key (course_id,sec_id, semester, year) references section
--		on delete cascade,
	 --foreign key (ID) references instructor
	--	on delete cascade
	);




--  2. In DEPARTMENT table make dept_name as primary key.

  ALTER TABLE DEPARTMENT MODIFY (dept_name VARCHAR(20) NOT NULL PRIMARY KEY);



  --3. In INSTRUCTOR table make ID as primary key.

  ALTER TABLE INSTRUCTOR MODIFY (ID INT NOT NULL PRIMARY KEY);


  --4. In COURSE table make course_id as primary key.

  ALTER TABLE COURSE MODIFY (course_id VARCHAR(8) NOT NULL PRIMARY KEY);


  --5. In SECTION table make course_id, sec_id, semester, year as primary key.

  ALTER TABLE SECTION ADD PRIMARY KEY(course_id, sec_id, semester, year);


  --6. In TEACHES table make ID, course_id, sec_id, semester, year as primary key.

  ALTER TABLE TEACHES ADD PRIMARY KEY(ID, course_id, sec_id, semester, year);


--  7. Do not allow primary key to have null values in all the tables.

  ALTER TABLE SECTION MODIFY (course_id NOT NULL, sec_id NOT NULL, semester NOT NULL,
  year NOT NULL);
  ALTER TABLE TEACHES MODIFY (ID NOT NULL,course_id NOT NULL, sec_id NOT NULL, semester
  NOT NULL, year NOT NULL);


  --8. Do not allow name in INSTRUCTOR table to have null values.

  ALTER TABLE INSTRUCTOR MODIFY (name NOT NULL);


  --9. Make dept_name of COURSE as foreign key which refers to dept_name of Department.

  ALTER TABLE COURSE ADD FOREIGN KEY (dept_name) REFERENCES
  DEPARTMENT(dept_name);


--  10. Make dept_name of INSTRUCTOR as foreign key which refers to dept_name of Department.

  ALTER TABLE INSTRUCTOR ADD FOREIGN KEY (dept_name) REFERENCES
  DEPARTMENT(dept_name);


  --11. Make course_id of SECTION as foreign key which refers to course_id of COURSE.

  ALTER TABLE SECTION ADD FOREIGN KEY (course_id ) REFERENCES COURSE(course_id);


  --12. Make ID of TEACHES as foreign key which refers to ID of INSTRUCTOR.

  ALTER TABLE TEACHES ADD FOREIGN KEY (ID) REFERENCES INSTRUCTOR(ID);


  --13. Make course_id, sec_id, semester, year of TEACHES as foreign key which refers to course_id, sec_id, semester, year of SECTION.

  ALTER TABLE TEACHES ADD FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES
  SECTION(course_id, sec_id, semester, year);


  --14. Insert few tuples into INSTRUCTOR and DEPARTMENT which satisfies the above constraints.

  INSERT INTO DEPARTMENT VALUES('Maths','Watson',55500);
  INSERT INTO DEPARTMENT VALUES('Mech','Taylor',65400);
  INSERT INTO INSTRUCTOR VALUES(33778,'Frodo','Maths',9640);
  INSERT INTO INSTRUCTOR VALUES(93298,'Aragon','Mech',12100);



  --15.Try to insert few tuples into INSTRUCTOR and DEPARTMENT which violates some of the above constraints.

INSERT INTO INSTRUCTOR VALUES(58576,'Frodo','Dance',33400);
  ERROR at line 1:
  ORA-00001: unique constraint (CSIS10.SYS_C00133753) violated

  INSERT INTO DEPARTMENT VALUES('Mech','Blah',9000);
  ERROR at line 1:
  ORA-00001: unique constraint (CSIS10.SYS_C00133747) violated











CREATE TABLE DEPARTMENT(dept_name VARCHAR(20), building VARCHAR(15), budget INT);
INSERT INTO DEPARTMENT VALUES('Biology','Watson',90000);
INSERT INTO DEPARTMENT VALUES('Comp.Sc.','Taylor',100000);
INSERT INTO DEPARTMENT VALUES('Elec.Eng.','Taylor',85000);
INSERT INTO DEPARTMENT VALUES('Finance','Painter',120000);
INSERT INTO DEPARTMENT VALUES('History','Painter',50000);
INSERT INTO DEPARTMENT VALUES('Music','Packard',80000);
INSERT INTO DEPARTMENT VALUES('Physics','Watson',70000);
******************************************************************
CREATE TABLE COURSE(course_id VARCHAR(8), title VARCHAR(30), dept_name VARCHAR(10), credits INT );
INSERT INTO COURSE VALUES('BIO-101','Intro. to Biology','Biology',4);
INSERT INTO COURSE VALUES('BIO-301','Genetics','Biology',4);
INSERT INTO COURSE VALUES('BIO-399','Computational Biology','Biology',3);
INSERT INTO COURSE VALUES('CS-101','Intro. to Computer Science','Comp.Sci.',4);
INSERT INTO COURSE VALUES('CS-190','Game Design','Comp.Sci.',4);
INSERT INTO COURSE VALUES('CS-315','Robotics','Comp.Sci.',3);
INSERT INTO COURSE VALUES('CS-319','Image Processing','Comp.Sci.',3);
INSERT INTO COURSE VALUES('CS-347','Database Sytem Concepts','Comp.Sci.',3);
INSERT INTO COURSE VALUES('EE-181','Intro. to Digital Systems','Elect. Eng.',3);
INSERT INTO COURSE VALUES('FIN-201','Investment Banking','Finance',3);
INSERT INTO COURSE VALUES('HIS-351','World History','History',3);
INSERT INTO COURSE VALUES('MU-199','Music Video Production','Music',3);
INSERT INTO COURSE VALUES('PHY-101','Physical Principles','Physics',4);
********************************************************************
CREATE TABLE INSTRUCTOR( ID INT, name VARCHAR(10), dept_name VARCHAR(15), salary INT);

INSERT INTO INSTRUCTOR VALUES(10101,'Srinivasan','Comp.Sci.',65000);
INSERT INTO INSTRUCTOR VALUES(12121,'Wu','Finance',90000);
INSERT INTO INSTRUCTOR VALUES(15151,'Mozart','Music',40000);
INSERT INTO INSTRUCTOR VALUES(22222,'Einstein','Physics',95000);
INSERT INTO INSTRUCTOR VALUES(32343,'El Said','History',60000);
INSERT INTO INSTRUCTOR VALUES(33456,'Gold','Physics',87000);
INSERT INTO INSTRUCTOR VALUES(45565,'Katz','Comp.Sci.',75000);
INSERT INTO INSTRUCTOR VALUES(58583,'Califieri','History',62000);
INSERT INTO INSTRUCTOR VALUES(76543,'Singh','Finance',80000);
INSERT INTO INSTRUCTOR VALUES(76766,'Crick','Biology',72000);
INSERT INTO INSTRUCTOR VALUES(83821,'Brandt','Comp.Sci.',92000);
INSERT INTO INSTRUCTOR VALUES(98345,'Kim','Elec.Eng.',80000);
********************************************************************
CREATE TABLE SECTION(course_id VARCHAR(15), sec_id INT, semester VARCHAR(15), year INT, building VARCHAR(15), room_number INT, time_slot_id VARCHAR(2));
INSERT INTO SECTION VALUES ('BIO-101', 1,'Summer', 2009, 'Painter', 514, 'B);
INSERT INTO SECTION VALUES ('BIO-301', 1,'Summer',2010, 'Painter', 514, 'A);
INSERT INTO SECTION VALUES ('CS-101', 1,'Fall',2009, 'Packard', 101, 'H);
INSERT INTO SECTION VALUES ('CS-101', 1,'Spring',2010, 'Packard', 101, 'F);
INSERT INTO SECTION VALUES ('CS-190', 1,'Spring',2009, 'Taylor, 3128, 'E);
INSERT INTO SECTION VALUES ('CS-190', 2,'Spring',2009, 'Taylor, 3128, 'A);
INSERT INTO SECTION VALUES ('CS-315', 1,'Spring',2010, 'Watson, 120, 'D);
INSERT INTO SECTION VALUES ('CS-319', 1,'Spring',2010, 'Watson, 100, 'B);
INSERT INTO SECTION VALUES ('CS-319', 2,'Spring',2010, 'Taylor, 3128, 'C);
INSERT INTO SECTION VALUES ('CS-347', 1,'Fall',2009, 'Taylor, 3128, 'A);
INSERT INTO SECTION VALUES ('EE-181', 1,'Spring',2009, 'Taylor, 3128, 'C);
INSERT INTO SECTION VALUES ('FIN-201', 1,'Spring',2010, 'Packard, 101, 'B);
INSERT INTO SECTION VALUES ('HIS-351', 1,'Spring',2010, 'Painter, 514, 'C);
INSERT INTO SECTION VALUES ('MU-199, 1,'Spring',2010, 'Packard, 101, 'D);
INSERT INTO SECTION VALUES ('PHY-101', 1,'Fall',2009, 'Watson, 100, 'A);**************************************************************************
CREATE TABLE TEACHES(Id INT, course_id VARCHAR(15), sec_id INT,semester VARCHAR(15), year INT);
INSERT INTO TEACHES VALUES (10101, 'CS-101', 1,'Fall',2009);
INSERT INTO TEACHES VALUES (10101, 'CS-315', 1,'Spring',2010);
INSERT INTO TEACHES VALUES (10101, 'CS-347', 1,'Fall',2009);
INSERT INTO TEACHES VALUES (12121, 'FIN-201', 1,'Spring',2010);
INSERT INTO TEACHES VALUES (15151, 'MU-199, 1,'Spring',2010);
INSERT INTO TEACHES VALUES (22222, 'PHY-101', 1,'Fall',2009);
INSERT INTO TEACHES VALUES (32343, 'HIS-351', 1,'Spring',2010);
INSERT INTO TEACHES VALUES (45565, 'CS-101', 1,'Spring',2010);
INSERT INTO TEACHES VALUES (45565, 'CS-319', 1,'Spring',2010);
INSERT INTO TEACHES VALUES (76766, 'BIO-101', 1,'Summer',2009);
INSERT INTO TEACHES VALUES (76766, 'BIO-301', 1,'Summer',2010);
INSERT INTO TEACHES VALUES (83821, 'CS-191', 1,'Spring',2009);
INSERT INTO TEACHES VALUES (83821, 'CS-190', 2,'Spring',2009);
INSERT INTO TEACHES VALUES (83821, 'CS-319', 2,'Spring',2010);
INSERT INTO TEACHES VALUES (98345, 'EE-181', 1,'Spring',2009);
**************************************************************************
2. ALTER TABLE DEPARTMENT MODIFY (dept_name VARCHAR(20) NOT NULL PRIMARY KEY);
3.ALTER TABLE INSTRUCTOR MODIFY (ID INT NOT NULL PRIMARY KEY);
4.ALTER TABLE COURSE MODIFY (course_id VARCHAR(8) NOT NULL PRIMARY KEY);
5.ALTER TABLE SECTION ADD PRIMARY KEY(course_id, sec_id, semester, year);
6.ALTER TABLE TEACHES ADD PRIMARY KEY(ID, course_id, sec_id, semester, year);
7. ALTER TABLE SECTION MODIFY (course_id NOT NULL, sec_id NOT NULL, semester NOT NULL, year NOT NULL);
ALTER TABLE TEACHES MODIFY (ID NOT NULL,course_id NOT NULL, sec_id NOT NULL, semester NOT NULL, year NOT NULL);
8.ALTER TABLE INSTRUCTOR MODIFY (name NOT NULL);
9.ALTER TABLE COURSE ADD FOREIGN KEY (dept_name) REFERENCES DEPARTMENT(dept_name);
10.ALTER TABLE INSTRUCTOR ADD FOREIGN KEY (dept_name) REFERENCES DEPARTMENT(dept_name);
11.ALTER TABLE SECTION ADD FOREIGN KEY (course_id ) REFERENCES COURSE(course_id);
12.ALTER TABLE TEACHES ADD FOREIGN KEY (ID) REFERENCES INSTRUCTOR(ID);
13.ALTER TABLE TEACHES ADD FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES SECTION(course_id, sec_id, semester, year);
14.INSERT INTO DEPARTMENT VALUES('Psychology','Watson',50000);
INSERT INTO DEPARTMENT VALUES('Aeronautics','Crick',50000);
INSERT INTO INSTRUCTOR VALUES(88776,'Shreesha','Psychology',80000);
INSERT INTO INSTRUCTOR VALUES(58576,'Sherlock','Aeronautics',80000);
15. INSERT INTO INSTRUCTOR VALUES(58576,'Sherlock','Dance',20000);
ERROR at line 1:
ORA-00001: unique constraint (CSE22.SYS_C00133753) violated

INSERT INTO DEPARTMENT VALUES('Aeronautics','Crick',50000);
ERROR at line 1:
ORA-00001: unique constraint (CSE22.SYS_C00133747) violated






