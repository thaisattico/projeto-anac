--Análise para verificar quantidade de voos domésticos e internacionais

SELECT n.descricao, COUNT(v.id_voo) AS qtd_cada
FROM natureza n
JOIN voos v ON n.id_natureza = v.id_natureza
GROUP BY n.descricao