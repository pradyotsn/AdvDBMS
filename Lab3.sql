http://www.eecs.qmul.ac.uk/~jane/courses/DB/SQL/SQL_Queries.pdf

SET SERVEROUTPUT ON SIZE 1000000;
set pagesize 50000;
set long 50000;
SET LINESIZE 5000;




University database:


DROP TABLE department CASCADE CONSTRAINTS;
DROP TABLE course CASCADE CONSTRAINTS;
DROP TABLE instructor CASCADE CONSTRAINTS;
DROP TABLE section CASCADE CONSTRAINTS;
DROP TABLE teaches CASCADE CONSTRAINTS;

DELETE FROM department;
DELETE FROM course;
DELETE FROM instructor;
DELETE from section;
DELETE FROM teaches;



create table department
	(dept_name varchar(20),
	 building varchar(15),
	 budget numeric(12,2) check (budget > 0),
	 primary key (dept_name)
	);

create table course
	(course_id varchar(8),
	title varchar(50),
	 dept_name varchar(20),
	 credits numeric(2,0) check (credits > 0),
	 primary key (course_id),
	 foreign key (dept_name) references department 
	 on delete set null
	);

create table instructor
	(ID varchar(5),
	 name varchar(20) not null,
	 dept_name varchar(20),
	 salary numeric(8,2) check (salary > 29000),
	primary key (ID), 
	foreign key (dept_name) references department 
	on delete set null
	);

create table section
(
course_id varchar(8),
 sec_id varchar(8),
 semester varchar(6) check (semester in ('Fall', 'Winter', 'Spring', 'Summer')),
 year numeric(4,0) check (year > 1701 and year < 2100),
 building varchar(15),
 room_number varchar(7),
 time_slot_id varchar(4),
 primary key (course_id, sec_id, semester, year), 
 foreign key (course_id) references course on delete cascade );

create table teaches
 (ID varchar(5),
 course_id varchar(8),
 sec_id varchar(8),
 semester varchar(6),
 year numeric(4,0),
 primary key (ID, course_id, sec_id, semester, year),
 foreign key (course_id,sec_id, semester, year) references section
 on delete cascade,
 foreign key (ID) references instructor
 on delete cascade
 );






INSERT INTO DEPARTMENT VALUES('Biology','Watson',90000);
INSERT INTO DEPARTMENT VALUES('Comp.Sci.','Taylor',100000);
INSERT INTO DEPARTMENT VALUES('Elec.Eng.','Taylor',85000);
INSERT INTO DEPARTMENT VALUES('Finance','Painter',120000);
INSERT INTO DEPARTMENT VALUES('History','Painter',50000);
INSERT INTO DEPARTMENT VALUES('Music','Packard',80000);
INSERT INTO DEPARTMENT VALUES('Physics','Watson',70000);


INSERT INTO COURSE VALUES('BIO-101','Intro. to Biology','Biology',4);
INSERT INTO COURSE VALUES('BIO-301','Genetics','Biology',4);
INSERT INTO COURSE VALUES('BIO-399','Computational Biology','Biology',3);
INSERT INTO COURSE VALUES('CS-101','Intro. to Computer Science','Comp.Sci.',4);
INSERT INTO COURSE VALUES('CS-190','Game Design','Comp.Sci.',4);
INSERT INTO COURSE VALUES('CS-315','Robotics','Comp.Sci.',3);
INSERT INTO COURSE VALUES('CS-319','Image Processing','Comp.Sci.',3);
INSERT INTO COURSE VALUES('CS-347','Database Sytem Concepts','Comp.Sci.',3);
INSERT INTO COURSE VALUES('EE-181','Intro. to Digital Systems','Elec.Eng.',3);
INSERT INTO COURSE VALUES('FIN-201','Investment Banking','Finance',3);
INSERT INTO COURSE VALUES('HIS-351','World History','History',3);
INSERT INTO COURSE VALUES('MU-199','Music Video Production','Music',3);
INSERT INTO COURSE VALUES('PHY-101','Physical Principles','Physics',4);



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


INSERT INTO SECTION VALUES ('BIO-101', 1,'Summer', 2009, 'Painter', 514, 'B');
INSERT INTO SECTION VALUES ('BIO-301', 1,'Summer',2010, 'Painter', 514, 'A');
INSERT INTO SECTION VALUES ('CS-101', 1,'Fall',2009, 'Packard', 101, 'H');
INSERT INTO SECTION VALUES ('CS-101', 1,'Spring',2010, 'Packard', 101, 'F');
INSERT INTO SECTION VALUES ('CS-190', 1,'Spring',2009, 'Taylor', 3128, 'E');
INSERT INTO SECTION VALUES ('CS-190', 2,'Spring',2009, 'Taylor', 3128, 'A');
INSERT INTO SECTION VALUES ('CS-315', 1,'Spring',2010, 'Watson', 120, 'D');
INSERT INTO SECTION VALUES ('CS-319', 1,'Spring',2010, 'Watson', 100, 'B');
INSERT INTO SECTION VALUES ('CS-319', 2,'Spring',2010, 'Taylor', 3128, 'C');
INSERT INTO SECTION VALUES ('CS-347', 1,'Fall',2009, 'Taylor', 3128, 'A');
INSERT INTO SECTION VALUES ('EE-181', 1,'Spring',2009, 'Taylor', 3128, 'C');
INSERT INTO SECTION VALUES ('FIN-201', 1,'Spring',2010, 'Packard', 101, 'B');
INSERT INTO SECTION VALUES ('HIS-351', 1,'Spring',2010, 'Painter', 514, 'C');
INSERT INTO SECTION VALUES ('MU-199', 1,'Spring',2010, 'Packard', 101, 'D');
INSERT INTO SECTION VALUES ('PHY-101', 1,'Fall',2009, 'Watson', 100, 'A');



INSERT INTO TEACHES VALUES (10101, 'CS-101', 1,'Fall',2009);
INSERT INTO TEACHES VALUES (10101, 'CS-315', 1,'Spring',2010);
INSERT INTO TEACHES VALUES (10101, 'CS-347', 1,'Fall',2009);
INSERT INTO TEACHES VALUES (12121, 'FIN-201', 1,'Spring',2010);
INSERT INTO TEACHES VALUES (15151, 'MU-199', 1,'Spring',2010);
INSERT INTO TEACHES VALUES (22222, 'PHY-101', 1,'Fall',2009);
INSERT INTO TEACHES VALUES (32343, 'HIS-351', 1,'Spring',2010);
INSERT INTO TEACHES VALUES (45565, 'CS-101', 1,'Spring',2010);
INSERT INTO TEACHES VALUES (45565, 'CS-319', 1,'Spring',2010);
INSERT INTO TEACHES VALUES (76766, 'BIO-101', 1,'Summer',2009);
INSERT INTO TEACHES VALUES (76766, 'BIO-301', 1,'Summer',2010);
INSERT INTO TEACHES VALUES (83821, 'CS-190', 1,'Spring',2009);
INSERT INTO TEACHES VALUES (83821, 'CS-190', 2,'Spring',2009);
INSERT INTO TEACHES VALUES (83821, 'CS-319', 2,'Spring',2010);
INSERT INTO TEACHES VALUES (98345, 'EE-181', 1,'Spring',2009);



**************************************************************************














Lab Exercises (Use company database schema for the following exercise problems)

1. Select all EMPLOYEE Ssns.

SELECT SSN
FROM EMPLOYEE;

SSN
---------
123456789
333445555
453453453
666884444
888665555
987654321
987987987
999887777


2. All combinations of EMPLOYEE Ssn and DEPARTMENT Dname in the database.

SELECT SSN, DNAME
FROM EMPLOYEE, DEPARTMENT;

SSN       DNAME
--------- ---------------
123456789 Administration
333445555 Administration
453453453 Administration
666884444 Administration
888665555 Administration
987654321 Administration
987987987 Administration
999887777 Administration
123456789 Headquarters
333445555 Headquarters
453453453 Headquarters
666884444 Headquarters
888665555 Headquarters
987654321 Headquarters
987987987 Headquarters
999887777 Headquarters
123456789 Research
333445555 Research
453453453 Research
666884444 Research
888665555 Research
987654321 Research
987987987 Research
999887777 Research

24 rows selected.

3. Retrieve all the attribute values of any EMPLOYEE who works in DEPARTMENT number 5.

SELECT *
FROM EMPLOYEE
WHERE DNO = 5;

FNAME           M LNAME           SSN       BDATE     ADDRESS                        S     SALARY SUPERSSN         DNO
--------------- - --------------- --------- --------- ------------------------------ - ---------- --------- ----------
Franklin        T Wong            333445555 08-DEC-55 Houston,TX                     M      40000 888665555          5
John            B Smith           123456789 09-JAN-65 Houston,TX                     M      30000 333445555          5
Ramesh          K Narayan         666884444 15-SEP-62 Humble,TX                      M      38000 333445555          5
Joyce           A English         453453453 31-JUL-72 Houston, TX                    F      25000 333445555          5




4. Retrieve all the attributes of an EMPLOYEE and the attributes of the DEPARTMENT in which he or she works for every employee of the ‘Research’ department.


SELECT *
FROM EMPLOYEE, DEPARTMENT
WHERE DNAME = 'Research' AND DNO = DNUMBER;


FNAME           M LNAME           SSN       BDATE     ADDRESS                        S     SALARY SUPERSSN         DNO DNAME              DNUMBER MGRSSN    MGRSTARTD
--------------- - --------------- --------- --------- ------------------------------ - ---------- --------- ---------- --------------- ---------- --------- ---------
Franklin        T Wong            333445555 08-DEC-55 Houston,TX                     M      40000 888665555          5 Research                 5 333445555 22-MAY-78
John            B Smith           123456789 09-JAN-65 Houston,TX                     M      30000 333445555          5 Research                 5 333445555 22-MAY-78
Ramesh          K Narayan         666884444 15-SEP-62 Humble,TX                      M      38000 333445555          5 Research                 5 333445555 22-MAY-78
Joyce           A English         453453453 31-JUL-72 Houston, TX                    F      25000 333445555          5 Research                 5 333445555 22-MAY-78




5. For every project located in ‘Stafford’, list the project number, the controlling department number, and the department manager’s last name, address, and birth date.

SELECT PNUMBER, DNUM, LNAME, ADDRESS, BDATE
FROM PROJECT, DEPARTMENT, EMPLOYEE
WHERE DNUM = DNUMBER AND MGRSSN = SSN AND PLOCATION = 'Stafford';


   PNUMBER       DNUM LNAME           ADDRESS                        BDATE
---------- ---------- --------------- ------------------------------ ---------
        10          4 Wallace         Bellaire,TX                    20-JUN-41
        30          4 Wallace         Bellaire,TX                    20-JUN-41
	
	

6. For each employee, retrieve the employee’s first and last name and the first and last name of his or her immediate supervisor.

SELECT E.FNAME, E.LNAME, S.FNAME, S.LNAME
FROM EMPLOYEE  E, EMPLOYEE  S
WHERE E.SUPERSSN = S.SSN;

FNAME           LNAME           FNAME           LNAME
--------------- --------------- --------------- ---------------
Jennifer        Wallace         James           Borg
Franklin        Wong            James           Borg
Joyce           English         Franklin        Wong
Ramesh          Narayan         Franklin        Wong
John            Smith           Franklin        Wong
Ahmad           Jabbar          Jennifer        Wallace
Alicia          Zelaya          Jennifer        Wallace


7. Retrieve the names of all employees in department 5 who work more than 10 hours per week on the ProductX project. 

SELECT LNAME, FNAME FROM EMPLOYEE, WORKS_ON, PROJECT
WHERE DNO=5 
AND SSN=ESSN 
AND PNO=PNUMBER 
AND PNAME='ProductX' 
AND HOURS>10

Another possible SQL query uses nesting as follows:

SELECT LNAME, FNAME 
FROM EMPLOYEE WHERE DNO=5 
AND SSN IN ( SELECT ESSN
FROM WORKS_ON
WHERE HOURS>10 
AND PNO IN ( SELECT PNUMBER
FROM PROJECT
WHERE PNAME='ProductX' ) )


LNAME           FNAME
--------------- ---------------
Smith           John
English         Joyce



8. List the names of all employees who have a dependent with the same first name as themselves. 

SELECT LNAME, FNAME
FROM EMPLOYEE, DEPENDENT
WHERE SSN=ESSN AND FNAME=DEPENDENT_NAME

Another possible SQL query uses nesting as follows:

SELECT LNAME, FNAME
FROM EMPLOYEE WHERE EXISTS ( SELECT *
FROM DEPENDENT
WHERE FNAME=DEPENDENT_NAME AND SSN=ESSN )

no rows selected


9. Find the names of all employees who are directly supervised by ‘Franklin Wong’.
SELECT E.LNAME, E.FNAME
FROM EMPLOYEE E, EMPLOYEE S
WHERE S.FNAME='Franklin' 
AND S.LNAME='Wong' AND E.SUPERSSN=S.SSN

Another possible SQL query uses nesting as follows:

SELECT LNAME, FNAMEFROM EMPLOYEE
WHERE SUPERSSN IN ( SELECT SSN
FROM EMPLOYEE
WHERE FNAME='Franklin' AND LNAME='Wong' )


LNAME           FNAME
--------------- ---------------
Smith           John
Narayan         Ramesh
English         Joyce


10. Find a list of all project numbers for projects that involve an employee whose last name is ‘Smith’, either as a worker or as a manager of the department that controls the project.

(SELECT PNAME FROM PROJECT, DEPARTMENT, EMPLOYEE
WHERE DNUM=DNUMBER AND MGRSSN=SSN AND LNAME='Smith')
UNION
(SELECT PNAME FROM PROJECT, WORKS_ON, EMPLOYEE
WHERE PNUMBER=PNO AND ESSN=SSN AND LNAME='Smith')

PNAME
---------------
ProductX
ProductY



(SELECT PNUMBER FROM PROJECT, DEPARTMENT, EMPLOYEE
WHERE DNUM=DNUMBER AND MGRSSN=SSN AND LNAME='Smith')
UNION
(SELECT PNUMBER FROM PROJECT, WORKS_ON, EMPLOYEE
WHERE PNUMBER=PNO AND ESSN=SSN AND LNAME='Smith')

PNUMBER
---------------
ProductX  ccccccccccccc
ProductY  cccccccccccccorrect this


 select distinct pnumber from project p, employee e, works_on w where p.dnum=e.dno and e.lname='Smith' and e.ssn=w.essn;

   PNUMBER
----------
         1
         2
         3




Use UNIVERSITY database schema for the following exercise.

11. Find the names of all instructors whose department name includes the substring ‘co’.

select name from instructor where dept_name like '%Co%';

NAME
--------------------
Srinivasan
Katz
Brandt



1. Find the titles of courses in the Comp. Sci. department that have 3 credits.

select title
from course
where dept_name = 'Comp.Sci.'
and credits = 3;


TITLE
--------------------------------------------------
Robotics
Image Processing
Database Sytem Concepts


2. Find the highest salary of any instructor.

select ID, name
from instructor
where salary = (select max(salary) from instructor)

ID    NAME
----- --------------------
22222 Einstein




3. Find the set of all courses taught either in Fall 2009 as well as in Spring 2010.
select distinct course_id
from section
where semester = ’Fall’ and year= 2009 and
course_id in (select course_id
from section
where semester = ’Spring’ and year= 2010);

COURSE_I
--------
CS-101

4. Find the set of all courses taught either in Fall 2009 but not in Spring 2010.

select distinct course_id
from section
where semester = 'Fall' and year= 2009 and
course_id not in (select course_id
from section
where semester = 'Spring' and year=
2010);

COURSE_I
--------
CS-347
PHY-101


