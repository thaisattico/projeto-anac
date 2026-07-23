-- Análise dos 10 aeroportos com mais voos como origem
-- Fonte: voos_2024

SELECT a.nome AS aeroporto_origem,
       COUNT(*) AS voos_origem
FROM voos v
JOIN aeroportos a ON v.id_aeroporto_origem = a.id_aeroporto
GROUP BY a.nome
ORDER BY voos_origem DESC
LIMIT 10