#what are the top 3 values of total invoice

select billing_country,total
from invoice
order by total desc
limit 3