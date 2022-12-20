-- case in select
-- select product_id,name,
-- 	case
-- 		when quantity_in_stock>50 then 'sufficient'
--         else 'insufficient'
-- 	end as status
-- from products;

-- case in order by
-- select * from customers
-- order by
-- 	case
-- 		when points=0 then first_name
-- 		else points 
-- 	end desc;

-- case in aggregate functions
select sum(
			case 
				when quantity_in_stock>50 then 1
                else 0
			end) as noOfSufficientProducts,
		 sum(
			case 
				when quantity_in_stock>50 then 0
                else 1
			end) as noOfInsufficientProducts
from products;