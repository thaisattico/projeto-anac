-- Análise de Cancelamento de Voos por Empresa Aérea
-- Fonte: tabela vra_2024 (dados consolidados da VRA/ANAC - 2024)

-- Exploração inicial da tabela vra_2024
-- Valores possíveis para a situação do voo (realizado, cancelado, etc.)
SELECT DISTINCT "Situação Voo" FROM vra_2024;

-- Conferência dos arquivos mensais que foram consolidados na tabela
SELECT DISTINCT arquivo_origem
FROM vra_2024
ORDER BY arquivo_origem;

-- Quantidade absoluta de cancelamentos por empresa

SELECT
    "Sigla ICAO Empresa Aérea",
    COUNT(*) AS total_cancelamento
FROM vra_2024
WHERE "Situação Voo" = 'CANCELADO'
GROUP BY "Sigla ICAO Empresa Aérea"
ORDER BY total_cancelamento DESC;


-- Taxa de cancelamento por empresa (%), considerando o total de voos de cada uma, 
-- evitando distorções de comparação entre empresas de portes diferentes 

SELECT
    "Sigla ICAO Empresa Aérea",
    COUNT(*) AS total_voos,
    SUM(CASE WHEN "Situação Voo" = 'CANCELADO' THEN 1 ELSE 0 END) AS total_cancelados,
    ROUND(
        SUM(CASE WHEN "Situação Voo" = 'CANCELADO' THEN 1 ELSE 0 END) * 1.0 / COUNT(*) * 100,2
    ) AS taxa_cancelamento
FROM vra_2024
GROUP BY "Sigla ICAO Empresa Aérea"
ORDER BY taxa_cancelamento DESC;
