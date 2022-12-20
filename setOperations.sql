-- UNION--
-- select order_id,'active'
-- from orders
-- where order_date>='2019-01-01'
-- union
-- select order_id,'archived'
-- from orders
-- where order_date<'2019=01-01';

-- select order_id,
-- 	case 
--    when order_date>='2019-01-01' then 'active'
--     when order_date<'2019-01-01' then 'archived'
--     end
-- from orders;

-- select customer_id,first_name,points,'Bronze' type
-- from customers
-- where points<2000
-- union
-- select customer_id,first_name,points,'Silver'
-- from customers
-- where points>=2000 and points<3000
-- union
-- select customer_id,first_name,points,'Gold'
-- from customers
-- where points>=3000
-- order by first_name;

-- select customer_id,first_name,points,
-- case 
-- 	when points<2000 then 'Bronze'
--     when points>=2000 and points<3000 then 'Silver'
--     when points>=3000 then 'Gold'
-- end grade,city
-- from customers
-- order by first_name;





