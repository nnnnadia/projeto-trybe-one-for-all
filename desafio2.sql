SELECT
	COUNT(DISTINCT m.id) AS cancoes,
  COUNT(DISTINCT ar.id) AS artistas,
  COUNT(DISTINCT al.id) AS albuns
FROM musics AS m
JOIN albums AS al ON m.id_album = al.id
JOIN artists AS ar ON al.id_artist = ar.id;