SELECT TIMESTAMP(date_created) AS "time", user_count AS "Usuarios registrados"
FROM
(
  SELECT DATE_FORMAT(date_with_zero_time, '%Y-%m-%d') AS date_created,
        COUNT(createdAt) AS user_count
  FROM (
	SELECT DATE_FORMAT(DATE_ADD(NOW(), INTERVAL 2 DAY) - INTERVAL (n.n + 1) DAY, '%Y-%m-%d 00:00:00') AS date_with_zero_time
	FROM (
	  SELECT a.N + b.N * 10 + 1 AS n
	  FROM (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) a
	  CROSS JOIN (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) b
	  ORDER BY n DESC
	) n
	WHERE n.n < 30
	AND DATE_FORMAT(NOW() - INTERVAL (n.n + 1) DAY, '%Y-%m-%d') <= DATE_FORMAT(NOW(), '%Y-%m-%d')
  ) d
  LEFT JOIN tfg.user ON DATE(createdAt) = d.date_with_zero_time
  GROUP BY date_created
) u