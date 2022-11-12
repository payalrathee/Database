drop procedure if exists counterForStudent;
drop procedure if exists inc;
delimiter $$
create procedure counterForStudent(out counter int)
begin
	declare id int;
    declare name varchar(20);
	declare finished int default 0;
    declare c cursor for select * from student;
    declare continue handler for not found
    begin
		set finished=1;
	end;
	set counter=0;
    open c;
    l:loop
		fetch c into id,name;
        if finished=1 then
			leave l;
		end if;
        set counter=counter+1;
	end loop;
    close c;
end$$

create procedure inc(inout x int)
begin
	set x=x+1;
end$$
delimiter ;