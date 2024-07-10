# top 10 rock name band artist name
select a.name as am,g.name as nm,Count(*) as total
from artist a
join album2 ab
on a.artist_id=ab.artist_id
join track t
on ab.album_id=t.album_id
join genre g
on t.genre_id=g.genre_id
where g.name LIKE 'ROCK'
group by am,nm
order by total desc
limit 10
