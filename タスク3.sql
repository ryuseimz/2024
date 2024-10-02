-- 該当作品をクリップしたユーザーリストを抽出
WITH user_list AS (
	SELECT DISTINCT
		user_id
	FROM
		anime_season_clip_histories a
	LEFT JOIN anime_seasons b ON a.anime_season_id = b.id
	LEFT JOIN users c ON a.user_id = c.id
	WHERE
		b.id in(508, 1731, 3033, 3, 1518)
		AND a.deleted_at IS NULL
		AND c.is_active = 1
)

SELECT
	user_id, count(DISTINCT id)
FROM
	anime_season_clip_histories
WHERE
	deleted_at IS NULL
	AND user_id in( SELECT * FROM user_list)
GROUP BY
	user_id
ORDER BY
	2 DESC
LIMIT 100;
