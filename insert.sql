-- insert into orders(customer_id,order_date,status) values(1,'2019-01-02',1);
-- insert into order_items values(last_insert_id(),1,1,2.90);
-- create table shippers_archive as select * from shippers;
-- create table shippers_arch1 as select name from shippers;
-- create table shippers_arch2(shipper_name varchar(30));
-- insert into shippers_arch2 select name from shippers;

-- create table invc
-- as
-- select i.invoice_id,i.number,c.name,i.invoice_total,i.payment_total,i.invoice_date,i.due_date,i.payment_date
-- from invoices i join clients c
-- on i.client_id=c.client_id
-- where i.payment_date is not null;

update orders
set comments='gold customer'
where customer_id in
				(select customer_id 
				from customers
				where points>=3000);

