SELECT
	track AS nome_musica,
	CASE
		WHEN id = 9 THEN REPLACE(track, 'Bard', 'QA')
		WHEN id = 7 THEN REPLACE(track, 'Amar', 'Code Review')
		WHEN id = 6 THEN REPLACE(track, 'Pais', 'Pull Requests')
		WHEN id = 1 THEN REPLACE(track, 'SOUL', 'CODE')
		WHEN id = 3 THEN REPLACE(track, 'SUPERSTAR', 'SUPERDEV')
	END AS novo_nome
FROM `musics`
WHERE id = 1 OR id = 3 OR id = 6 OR id = 7 OR id = 9
ORDER BY track DESC;