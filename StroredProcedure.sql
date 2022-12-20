-- drop procedures if exist
drop procedure if exists selectStudent_Employee_Names;
drop procedure if exists empInsertion;
drop procedure if exists displayDate;
drop procedure if exists updateSalary;
drop procedure if exists countEmpWithJob;
drop procedure if exists isommProvided;
drop procedure if exists incCounter;

delimiter $$
-- without parameters,local variables
create procedure displayDate()
begin
	select now();
end$$

create procedure selectStudent_Employee_Names()
begin
	(select name from employee)
    union
    (select name from student);
end$$


-- without local variables,with parameters
create procedure empInsertion(in empid int,in name varchar(10))
begin
	insert into employee values(empid,name);
end$$

-- with local variables

-- in parameters
create procedure updateSalary(in id int,in inc decimal(10,5))
begin
	declare total,salary decimal(10,5);
    select sal into salary from emp where empno=id;
    set total=salary*(1+inc);
    update emp set sal=total where empno=id;
end$$

-- in and out parameters
create procedure countEmpWithJob(in empJob varchar(20),out countEmp int)
begin
	select count(empno) into countEmp from emp where job=empJob;
end$$

create procedure isommProvided(in empId int,out isProvided varchar(5))
begin
	declare comm decimal(4,2);
	select comm into comm from emp where empno=empId;
	if comm is null then
		set isProvided='No';
	else
		set isProvided='Yes';
	end if;
end$$

-- inout parameters
create procedure incCounter(inout counter int)
begin 
	set counter=counter+1;
end$$


delimiter ;


-- call displayDate();
-- call empInsertion(10100,'zara');
-- call selectStudent_Employee_Names();
-- call updateSalary(8369,0.2);
-- call countEmpWithJob('salesman',@countEmp);
-- call isommProvided(8369,@comm);
-- set @counter=0;
-- call incCounter(@counter);

-- select @countEmp,@comm,@counter;


































