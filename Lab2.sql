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
	 primary key (course_id),
	 foreign key (dept_name) references department
		on delete set null
	);

create table instructor
	(ID			varchar(5),
	 name			varchar(20) not null,
	 dept_name		varchar(20),
	 salary			numeric(8,2) check (salary > 29000),
	 primary key (ID),
	 foreign key (dept_name) references department
		on delete set null
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
	 primary key (course_id, sec_id, semester, year),
	 foreign key (course_id) references course
		on delete cascade,
		on delete set null
	);

create table teaches
	(ID			varchar(5),
	 course_id		varchar(8),
	 sec_id			varchar(8),
	 semester		varchar(6),
	 year			numeric(4,0),
	 primary key (ID, course_id, sec_id, semester, year),

	 ###

	 foreign key (course_id,sec_id, semester, year) references section
		on delete cascade,
	 foreign key (ID) references instructor
		on delete cascade
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
  ORA-00001: unique constraint (CSE22.SYS_C00133753) violated

  INSERT INTO DEPARTMENT VALUES('Mech','Blah',9000);
  ERROR at line 1:
  ORA-00001: unique constraint (CSE22.SYS_C00133747) violated
