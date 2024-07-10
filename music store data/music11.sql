#write a query that return top customer for each country 
with cte as(
select c.first_name,c.country,Sum(il.unit_price*il.quantity) as total_spend,
row_number() Over( partition by c.country order by Sum(il.unit_price*il.quantity) desc) as Rowno
from invoice_line as il
join invoice as i 
on il.invoice_id=i.invoice_id
join customer as c
on i.customer_id=c.customer_id
group by c.first_name,c.country
order by c.country asc
)
select * from cte where Rowno<=1