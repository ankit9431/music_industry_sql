# best city in terms of sum of total invoice

select billing_city ,sum(total) as maxi
from invoice
group by billing_city
order by maxi desc
