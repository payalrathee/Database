drop procedure if exists empInsertionProcedure1;
drop procedure if exists empInsertionProcedure2;
drop function if exists addition;
truncate employee;
truncate emp_audit;

delimiter $$
-- without return value and local variables
create procedure empInsertionProcedure1(id int,name varchar(20))
begin
	   insert into employee values(id,name);
       insert into emp_audit values(concat(name,' is inserted'));
end$$

-- with return values and local variables
create procedure empInsertionProcedure2(in id int,in name varchar(20),out returnMsg varchar(10)) 
begin
	declare msg varchar(100);
    set msg= concat(name,' is inserted');
    insert into employee values(id,name);
	insert into emp_audit values(msg);
    set returnMsg='done';
end$$

create function addition(a int,b int) returns int
begin
	declare total int;
    set total=a+b;
    return total;
end$$

delimiter ;
-- call empInsertionProcedure2(1,'aman',@msg);
-- select @msg;
set @x= addition(1,2);
select @x;















