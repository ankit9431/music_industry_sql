select name,milliseconds 
from track
where milliseconds>(
select avg(milliseconds) as avg_track_length
from track)
order by milliseconds desc

