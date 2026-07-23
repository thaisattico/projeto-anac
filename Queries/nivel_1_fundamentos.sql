-- Consultas analíticas básicas sobre a tabela fato 'voos'

-- Total de voos por empresa
SELECT e.nome, COUNT(v.id_voo) AS total_voos
FROM voos v
JOIN empresas e ON v.id_empresa = e.id_empresa
GROUP BY e.nome
ORDER BY total_voos DESC;
