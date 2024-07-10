#Q.cutomer name and totla spend on artist

WITH best_selling AS (
  SELECT a.artist_id, a.name, SUM(il.unit_price * il.quantity) AS total_sales
  FROM invoice_line AS il
  JOIN track AS t ON il.track_id = t.track_id
  JOIN album2 AS Al ON t.album_id = Al.album_id
  JOIN artist AS a ON Al.artist_id = a.artist_id
  GROUP BY a.artist_id, a.name
  ORDER BY total_sales DESC
  LIMIT 1
)
SELECT c.first_name, c.last_name, bsa.name, SUM(il.unit_price * il.quantity) AS total_sales
FROM customer AS c
JOIN invoice AS i ON c.customer_id = i.customer_id
JOIN invoice_line AS il ON i.invoice_id = il.invoice_id
JOIN track AS t ON il.track_id = t.track_id
JOIN album2 AS Al ON t.album_id = Al.album_id
JOIN artist AS a ON Al.artist_id = a.artist_id
JOIN best_selling AS bsa ON a.artist_id = bsa.artist_id
GROUP BY c.first_name, c.last_name, bsa.name
ORDER BY total_sales DESC;