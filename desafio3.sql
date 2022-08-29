SELECT
	u.name AS usuario,
  COUNT(*) AS qt_de_musicas_ouvidas,
  ROUND(SUM(m.duration)/60, 2) AS total_minutos
FROM users AS u
JOIN `history` AS h ON u.id = h.id_user
JOIN `musics` AS m ON h.id_music = m.id
GROUP BY u.id
ORDER BY usuario;