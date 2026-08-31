--Análise da taxa de ocupação (load factor) por empresa
--Load Factor = RPK / ASK

SELECT "EMPRESA (SIGLA)",
       ROUND(SUM(RPK) * 1.0 / SUM(ASK) * 100, 2) AS load_factor
FROM voos_2024
GROUP BY "EMPRESA (SIGLA)"
ORDER BY load_factor DESC
