# which country has the most invoices

select billing_country, Count(*)
from invoice
group by billing_country
order by billing_country desc



