drop function if exists isEven;
drop function if exists print;

delimiter $$

create function isEven(x int) returns boolean
deterministic
begin
	if x%2=0 then
		return true;
	else 
		return false;
    end if;
end$$

create function print(n int) returns varchar(20)
deterministic
begin
	declare result varchar(20) default '';

	loop1:loop
		set result=concat(result,' ',n);
        set n=n-1;
        if n<0 then
			leave loop1;
		end if;
	end loop;
    return result;
end$$

delimiter ;

select isEven(3);
select print(5);


