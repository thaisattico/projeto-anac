--Comparativo de companhias aéreas por rota (concorrência direta).
--Objetivo: em rotas onde mais de uma empresa opera (concorrência real),
--comparar a taxa de cancelamento de cada empresa naquela rota.

SELECT a.*
FROM (
    SELECT "Sigla ICAO Aeroporto Origem",
"Sigla ICAO Aeroporto Destino",
"Sigla ICAO Empresa Aérea",
ROUND(SUM(CASE WHEN "Situação Voo" = 'CANCELADO' THEN 1 ELSE 0
END) * 1.0 / COUNT(*) * 100, 2) AS cancelamentos_por_rota
FROM vra_2024
GROUP BY "Sigla ICAO Aeroporto Origem", 
"Sigla ICAO Aeroporto Destino", 
"Sigla ICAO Empresa Aérea"
HAVING COUNT(*) >= 30
) AS a
JOIN (
    SELECT "Sigla ICAO Aeroporto Origem",
"Sigla ICAO Aeroporto Destino",
COUNT(DISTINCT "Sigla ICAO Empresa Aérea") AS empresas_por_rota
FROM vra_2024
GROUP BY  "Sigla ICAO Aeroporto Origem",
"Sigla ICAO Aeroporto Destino"
HAVING COUNT(DISTINCT "Sigla ICAO Empresa Aérea") > 1
) AS b
ON a."Sigla ICAO Aeroporto Origem" = b."Sigla ICAO Aeroporto Origem"
AND a."Sigla ICAO Aeroporto Destino" = b."Sigla ICAO Aeroporto Destino"
ORDER BY a.cancelamentos_por_rota DESC
LIMIT 10