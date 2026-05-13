-- Used MySQL for initial data cleaning and joining tables together on a single column name.
select distinct
right(t.transaction_id,5) as transaction_id,
trim(t.product_id) as product_id,sale_date,
p.product_name,p.brand,t.store_id,s.region,
abs(quantity) as quantity,
replace(discount,"N/A",0) as discount,
round((abs(quantity)*unit_price)*(1-coalesce(discount,0)),2) as total,
upper(payment_method) as payment_method,sales_rep,is_active
from transactions t
left join products p 
on p.product_id=t.product_id
left join stores s 
on s.store_id=t.store_id
order by transaction_id;


