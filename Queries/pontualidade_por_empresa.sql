--Top 10 empresas mais pontuais, tanto em partida quanto em chegada
--Um voo só é considerado pontual se ambos (partida e chegada) forem pontuais (existem voos que saem antecipados,
--mas chegam atrasados, e vice-versa)
--HAVING COUNT(*) >= 500 filtra empresas com poucos voos no período, evitando distorção na taxa por amostras pequenas

SELECT "Sigla ICAO Empresa Aérea", COUNT(*) AS voos_gerais,
ROUND(SUM(CASE WHEN "Situação Partida" = 'Pontual' AND "Situação Chegada"= 'Pontual'
Then 1
Else 0
END) * 1.0 / COUNT(*) * 100, 2) AS taxa_pontualidade
FROM vra_2024
GROUP BY "Sigla ICAO Empresa Aérea"
HAVING COUNT(*) >= 500
ORDER BY taxa_pontualidade DESC
LIMIT 10
