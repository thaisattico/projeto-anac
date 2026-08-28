SELECT "Sigla ICAO Empresa Aérea", COUNT(*) AS voos_gerais,
ROUND(SUM(CASE WHEN "Situação Partida" = 'Pontual' AND "Situação Chegada"= 'Pontual'
Then 1
Else 0
END) * 1.0 / COUNT(*) * 100, 2) AS taxa_pontualidade
FROM vra_2024
GROUP BY "Sigla ICAO Empresa Aérea"
HAVING COUNT(*) >= 500
ORDER BY taxa_pontualidade DESC
LIMIT 10