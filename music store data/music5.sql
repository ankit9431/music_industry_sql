# best customer as total spend of total

select c.first_name, sum(i.total) as maxi
from customer as c
JOIN invoice as i
On c.customer_id=i.customer_id
group by c.first_name
order by maxi desc
limit 1;


select * from invoice