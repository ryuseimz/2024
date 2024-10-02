SELECT
	movie_id,
	b.title,
	b.release_date,
	count(DISTINCT a.id) AS mark_count
FROM marks a
LEFT JOIN movies AS b ON a.movie_id = b.id
WHERE (a.created_at + interval '9h')::date BETWEEN '2024-08-01' AND '2024-08-31'
GROUP BY 1, 2, 3
ORDER BY 4 DESC
LIMIT 100;
