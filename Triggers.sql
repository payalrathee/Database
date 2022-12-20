use demo;
-- drop tables if exists
drop table if exists teacher;
drop table if exists teacher_audit;
drop trigger if exists teacherInsert;
drop trigger if exists teacherUpdateBefore;
drop trigger if exists teacherUpdateAfter;

-- create fresh tables
create table teacher(id int primary key auto_increment,name varchar(50),sal int,bonus int,status varchar(10));
create table teacher_audit(message varchar(100));

-- triggers
-- NEW-->points to new record that is being inserted or the updated record.
-- OLD-->points to the record that is being deleted or the record that is being updated.

-- for inserting
delimiter $$
create trigger teacherInsertBefore
after 
insert on teacher
for each row
begin
	insert into teacher_audit values(CONCAT('inserting ',New.name));
end$$
delimiter ;


delimiter $$
create trigger teacherInsertAfter
after 
insert on teacher
for each row
begin
	insert into teacher_audit values(CONCAT('inserted ',New.name));
end$$
delimiter ;

-- updating
delimiter $$
create trigger teacherUpdateBefore
before 
update on teacher
for each row
begin
insert into teacher_audit values(CONCAT('updating ',old.name,' to ',new.name));
end$$
delimiter ;

delimiter $$
create trigger teacherUpdateAfter
after 
update on teacher
for each row
begin
insert into teacher_audit values(CONCAT('updated ',old.name,' to ',New.name));
end$$
delimiter ;

-- deleting
delimiter $$
create trigger teacherDeleteBefore
after 
delete on teacher
for each row
begin
insert into teacher_audit values(CONCAT('deleting ',old.name));
end$$
delimiter ;

delimiter $$
create trigger teacherDeleteAfter
after 
delete on teacher
for each row
begin
insert into teacher_audit values(CONCAT('deleted',old.name));
end$$
delimiter ;


delimiter $$
create trigger BonusUpdate
before
update on teacher
for each row
begin
	if new.sal>=20000 then
		set new.bonus=1000;
	elseif new.sal>10000 then
		set new.bonus=500;
end if;
end$$
delimiter ;

delimiter $$
create trigger StatusUpdate
before
update on teacher
for each row
begin
	if new.sal-old.sal>0 then
		set new.status='promotion';
	else
		set new.status='demotion';
end if;
end$$
delimiter ;




insert into teacher values(1,'aman',18000,500,null);
insert into teacher values(null,'asha',11000,500,null);
insert into teacher values(null,'nisha',24000,1000,null);
delete from teacher where id=3;
update teacher set name='kanika' where id=1;
update teacher set sal=22000 where id=1;
update teacher set sal=9000 where id=2;











