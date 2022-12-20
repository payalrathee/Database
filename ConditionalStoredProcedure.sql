use sql_store;
drop procedure if exists selectCustomerType;
drop procedure if exists status;
drop procedure if exists checkQuantityStatus;

-- if else 
delimiter $$
create procedure selectCustomerType(in id int,out type varchar(20))
begin
	declare p int;
    select points into p from customers where customer_id=id;
    if p>3000 then
		set type='gold';
	elseif p>2000 then
		set type='silver';
	else
    set type='bronze';
    end if;
end$$

-- case statemnts
create procedure status(in name varchar(20),out s varchar(30))
begin
	select os.name into s 
    from 
    orders o 
    join 
    customers c 
		on o.customer_id=c.customer_id
	join order_statuses os
		on o.status=os.order_status_id
	where c.first_name=name
    limit 1;
    
    case s
		when 'Processed' then 
			set s='not delivered';
        when 'Shipped' then 
			set s='not delivered';
		when 'Delivered' then
			set s='delivered';
		else
			set s='no status';
	end case;
end$$
		
create procedure checkQuantityStatus(in id int,out status varchar(30))
begin
	declare qty int;
    select quantity_in_stock into qty from products where product_id=id;
    case
		when qty>50 then
			set status='sufficient';
		else
			set status='insufficient';
	end case;
end$$


delimiter ;

-- call selectCustomerType(5,@type);
-- select @type;

-- call status('Elka',@status);
-- select @status;
call checkQuantityStatus(1,@status);
select @status;




