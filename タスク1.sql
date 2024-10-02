select 
	a.*, 
	title,
	release_date, -- 公開日
	c.name, -- 国名
	f.name, -- ジャンル
	h.name, -- 企業名
	mark_count
from movies as a
LEFT JOIN country_movies as b ON a.id = b.movie_id
LEFT JOIN countries as c ON b.country_id = c.id
LEFT JOIN movie_countings as d ON a.id = d.movie_id
left join movie_genres as e ON a.id = e.movie_id
left join genres as f ON e.genre_id = f.id
left join movie_companies as g on a.id = g.movie_id and g.company_role_id = 2 -- 配給
left join companies as h on g.company_id = h.id
order by mark_count desc
LIMIT 100
;
