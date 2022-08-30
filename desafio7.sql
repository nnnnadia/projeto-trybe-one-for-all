SELECT
	ar.name AS artista,
	al.title AS album,
  COUNT(*) AS seguidores
FROM `albums` AS al
JOIN `artists` AS ar ON al.id_artist = ar.id
JOIN `following` AS f ON ar.id = f.id_artist
GROUP BY al.title, ar.name
ORDER BY seguidores DESC, artista, album;