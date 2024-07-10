#we want to find out most populat music genre for each country
with cte as
(
select g.name,c.country,count(il.quantity) as purchase,
row_number() OVER( partition by c.country order by count(il.quantity)DESC) as Rowno
from invoice_line as il
join invoice as i
on il.invoice_id=i.invoice_id
join customer as c
on i.customer_id=c.customer_id
join track as t
on il.track_id=t.track_id
join genre as g
on t.genre_id=g.genre_id
group by g.name,c.country
order by c.country asc,purchase desc

)
select * from cte 
where Rowno<=1