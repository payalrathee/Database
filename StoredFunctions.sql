use demo;
drop function if exists isEven;

delimiter $$

create function isEven(n int) returns int
begin
	if n%2=0 then 
		return 1;
	else
		return 0;
	end if;
end$$

delimiter ;

select isEven(11);