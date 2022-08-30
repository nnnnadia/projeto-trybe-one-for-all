SELECT
	ar.name AS artista,
  al.title AS album
FROM `artists` AS ar
JOIN `albums` AS al ON ar.id = al.id_artist
WHERE ar.id = 3
ORDER BY al.title;