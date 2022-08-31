SELECT m.track AS nome, COUNT(*) AS reproducoes FROM `musics` AS m
JOIN `history` AS h ON m.id = h.id_music
JOIN `users` AS u ON h.id_user = u.id
WHERE u.id_plan = 1 OR u.id_plan = 3
GROUP BY m.track
ORDER BY track;