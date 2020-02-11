1.Create view course_sections as select course.title, section.building, section.room_number from course, section where course.course_id=section.course_id AND course.dept_name='Physics' AND section.semester='Fall' AND section.year=2009;
2.select title FROM COURSE_SECTIONS;
3.Create view dept_tot_sal as select department.Dname, sum(employee1.salary) AS tot_salary from employee1, department where employee1.Dno=department.Dnumber group by department.Dname;
4.Create view instructor_info as select instructor.ID, instructor.name, section.building from instructor,section,teaches where instructor.ID=teaches.ID and teaches.course_id=section.course_id;
5.create view history_instructors as select instructor.ID, instructor.name,instructor.dept_name,instructor.salary, teaches.Course_id,teaches.sec_id, teaches.semester, teaches.year, section.building, section.room_number, section.time_slot_id from instructor, teaches, section where instructor.ID=teaches.ID AND teaches.course_id=section.course_id and instructor.dept_name='History';
 6.CREATE VIEW DPT1 AS SELECT DNAME,FNAME AS MGR_FNAME,LNAME AS MGR_LNAME,SALARY FROM DEPT,EMPLOYEE WHERE Mgr_ssn=Ssn;
7.CREATE VIEW EMP2 AS SELECT E1.FNAME,E1.LNAME,E2.FNAME AS S_FNAME,E2.LNAME AS S_LNAME,E1.SALARY FROM EMPLOYEE E1, EMPLOYEE E2, DEPT D WHERE E1.Super_ssn=E2.Ssn AND E1.DNO = D.DNUMBER AND D.DNAME='Research';
8.CREATE VIEW PROJ3 AS SELECT PNUMBER,DNAME,COUNT(*),SUM(Hours) from PROJECT,WORKS_ON,DEPT WHERE PNUMBER = PNO and DNUM = DNUMBER GROUP BY PNUMBER,PNAME,DNAME;
9.CREATE VIEW PROJ4 AS SELECT PNUMBER,DNAME,COUNT(*),SUM(Hours) from PROJECT,WORKS_ON,DEPT WHERE PNUMBER = PNO and DNUM = DNUMBER GROUP BY PNUMBER,PNAME,DNAME having count(*)>1; 



https://drive.google.com/file/d/1Synd5UmAXYZeMVo0MdvSzA5F4zNUPt8P/view?usp=drivesdk
