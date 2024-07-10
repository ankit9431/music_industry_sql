# first name ,email for genre of rock

select DISTINCT c.first_name,c.last_name,c.email
from customer as c
JOIN invoice as i
on c.customer_id=i.customer_id
JOIN invoice_line as il
on i.invoice_id=il.invoice_id
JOIN track as t
on il.track_id=t.track_id
JOIN genre as g
on t.genre_id=g.genre_id
where g.name LIKE 'ROCK'
order by c.email;



