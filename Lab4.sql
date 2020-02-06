--1. Find the sum of the salaries of all employees, maximum salary, the minimum salary, and the average salary.



select sum(salary), min(salary),max(salary),avg(salary) from employee3;

--2. Find the sum of the salaries of all employees of the 'Research' department as well as the maximum salary,
--the minimum salary, and the average salary in this department.

select sum(salary),min(salary),max(salary),avg(salary) from employee3 e, department3 d 
where e.dno=d.dnumber and d.dname='Research';

3. Retrieve the total number of employees in the company.

select count(*) from employee3;

4. Retrieve the number of employees in the 'Research' department.


select count(*) from employee3 e, department3 d
where e.dno=d.dnumber and d.dname='Research';


5. Count the number of distinct salary values in the database.

select count(distinct(salary)) from employee3;


6. For each department whose average employee salary is more than $30,000, retrieve the department name and the number of employees working for that department.

select avg(salary), dname,count(*) from employee3 e, department3 d
where e.dno=d.dnumber
group by(d.dname)
having avg(salary)>30000;

7. For each department, retrieve the department number, the number of employees in the department, and their average salary.


select d.dname, count(*), avg(e.salary) from employee3 e, department3 d
where e.dno=d.dnumber
group by(d.dname);


8. For each project, retrieve the project number, the project name, and the number of employees who work on that project.


select pnumber,pname, count(*) from project3 p, works_on3 w
where p.pnumber=w.pno
group by(pnumber,pname);

9. For each project, retrieve the project number, the project name, and the number of employees from department 5 who work on the project.

select pnumber,pname, count(*) from project3 p, works_on3 w, employee3 e
where p.pnumber=w.pno and e.ssn=w.essn and p.dnum=5
group by(pnumber,pname);
