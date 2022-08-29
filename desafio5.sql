SELECT
	m.track AS cancao,
  COUNT(*) AS reproducoes
FROM `history` AS h
JOIN `musics` AS m ON h.id_music = m.id
GROUP BY id_music
ORDER BY reproducoes DESC, cancao
LIMIT 2;