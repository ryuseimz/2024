SELECT
	movie_id,
	b.title,
	b.release_date,
	count(distinct a.id) as mark_count
from marks a
LEFT JOIN movies AS b ON a.movie_id = b.id 
where (a.created_at + interval '9h')::date between '2024-08-01' and '2024-08-31'
group by 1, 2, 3
order by 4 desc
limit 100;
