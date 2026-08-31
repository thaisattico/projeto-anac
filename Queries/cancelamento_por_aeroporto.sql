--Top 10 aeroportos com mais cancelamentos
--Conta o aeroporto tanto quando é origem quanto quando é destino do voo

SELECT aeroporto,
       SUM(CASE WHEN "Situação Voo" = 'CANCELADO' THEN 1 ELSE 0 END) AS cancelamento_por_aeroporto
FROM ( --a subquery permite agrupar por aeroporto de forma unificada
    SELECT "Descrição Aeroporto Origem" AS aeroporto, "Situação Voo"
    FROM vra_2024
    UNION ALL --empilha as duas colunas
    SELECT "Descrição Aeroporto Destino" AS aeroporto, "Situação Voo"
    FROM vra_2024
) AS todos_aeroportos
GROUP BY aeroporto
ORDER BY cancelamento_por_aeroporto DESC
LIMIT 10
