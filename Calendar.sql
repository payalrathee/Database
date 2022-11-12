drop procedure if exists insertCalendar;
drop procedure if exists loadCalendar;

delimiter $$

create procedure insertCalendar(dt date)
begin
	insert into calendar values(
		null,
		dt,
        extract(day from dt),
        extract(month from dt),
        extract(year from dt)
        );
end$$

create procedure loadCalendar(dt date,n int)
begin
	truncate table Calendar;
	while n>=1 do
		call insertCalendar(dt);
        set n=n-1;
        set dt=date_add(dt,interval 1 day);
	end while;
end$$

delimiter ;
call loadCalendar('2000-10-01',31);
select * from calendar;







