--Top 10 empresas com maior número de voos e taxa de cancelamento

SELECT
    "Sigla ICAO Empresa Aérea",
    COUNT(*) AS total_voos,
    SUM(CASE WHEN "Situação Voo" = 'CANCELADO' THEN 1 ELSE 0 END) AS total_cancelados,
    ROUND(
        SUM(CASE WHEN "Situação Voo" = 'CANCELADO' THEN 1 ELSE 0 END) * 1.0 / COUNT(*) * 100,2
    ) AS taxa_cancelamento
FROM vra_2024
GROUP BY "Sigla ICAO Empresa Aérea"
ORDER BY total_voos DESC
LIMIT 10;

