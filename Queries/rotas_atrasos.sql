SELECT "Sigla ICAO Aeroporto Origem",
"Sigla ICAO Aeroporto Destino",
SUM(CASE WHEN "Situação Partida" LIKE 'Atraso%' 
Then 1
Else 0
End) AS rotas_atrasadas
FROM vra_2024
GROUP BY "Sigla ICAO Aeroporto Origem", "Sigla ICAO Aeroporto Destino"
ORDER BY rotas_atrasadas DESC
LIMIT 10