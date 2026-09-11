--Análise das 10 rotas com mais atrasos
--Considera qualquer tipo de atraso na partida (LIKE 'Atraso%' pega
--todas as faixas: "Atraso 30-60", "Atraso 60-120", "Atraso > 240", etc.)

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
