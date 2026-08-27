SELECT
    SUBSTR("Partida Prevista", 4, 2) AS mes,
    SUM(CASE WHEN "Situação Voo" = 'CANCELADO' THEN 1 ELSE 0 END) AS total_cancelados
FROM vra_2024
WHERE "Partida Prevista" IS NOT NULL AND "Partida Prevista" != ''
GROUP BY mes
ORDER BY total_cancelados DESC;