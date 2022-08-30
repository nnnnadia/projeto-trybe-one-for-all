SELECT
	MIN(price) AS faturamento_minimo,
  MAX(price) AS faturamento_maximo,
  ROUND(AVG(price), 2) AS faturamento_medio,
  SUM(price) AS faturamento_total
FROM `plans` AS p
JOIN `users` AS u ON p.id = u.id_plan;