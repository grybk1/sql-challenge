--1. List the following details of each employee:
--employee number, last name, first name, gender, and salary.

select E.emp_no,last_name, first_name, gender, S.salary
from public.employees E
Join public.salaries S
	on E.emp_no=S.emp_no


	
--2. List employees who were hired in 1986	
select * from public.employees E
where  date_part('year', hire_date) = '1986'



--3. List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.


select D.dept_no,D.dept_name,E.emp_no,last_name, first_name, hire_date,S.to_date
from dept_managers DM
join public.employees E 
	on DM.emp_no=E.emp_no
join public.departments	D
	on DM.dept_no=D.dept_no
join 	
(select emp_no, max(to_date) as to_date from public.salaries
group by emp_no ) S
	on DM.emp_no=S.emp_no
	



	
--4. List the department of each employee with the following information:
--employee number, last name, first name, and department name.	

select E.emp_no, E.last_name,E.first_name,D.dept_name
from public.employees E
Join public.departments_employees DE
	on E.emp_no=DE.emp_no
Join public.departments D
	on DE.dept_no=D.dept_no



	
--5. List all employees whose first name is "Hercules" and last names begin with "B."

select * from Employees
where first_name = 'Hercules'
and last_name like 'B%'




--6. List all employees in the Sales department, including their
--employee number, last name, first name, and department name.

select E.emp_no,E.last_name,E.first_name, D.dept_name
from public.departments D
join public.departments_employees DM
	on D.dept_no=DM.dept_no
join public.employees E
	on E.emp_no=DM.emp_no
where D.dept_name='Sales'




--7. List all employees in the Sales and Development departments, including their
--employee number, last name, first name, and department name.

select E.emp_no,E.last_name,E.first_name, D.dept_name
from public.departments D
join public.departments_employees DM
	on D.dept_no=DM.dept_no
join public.employees E
	on E.emp_no=DM.emp_no
where D.dept_name in ('Sales','Development')




--8. In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
select last_name,count(*) 
from employees
group by last_name 
order by 2



