drop procedure if exists cursorDemo; 
delimiter $$
create procedure cursorDemo(inout count int)
begin
    declare finished int default 0;
    declare id int;
    declare name varchar(20);
    declare c cursor for select * from student;
    declare continue handler for not found 
    begin
		set finished=1;
	end;
    open c;
    loop1:loop
		fetch c into id,name;
        if finished=1 then
			leave loop1;
        end if;
        set count =count+1;
	end loop;
end$$
delimiter ;

set @count=0;
call cursorDemo(@count);
select @count;