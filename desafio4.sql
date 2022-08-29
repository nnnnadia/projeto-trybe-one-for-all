SELECT
	u.name AS usuario,
  IF(YEAR(MAX(h.date)) > 2020, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM `users` AS u
JOIN `history` AS h ON u.id = h.id_user
GROUP BY usuario
ORDER BY usuario;