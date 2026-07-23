-- Povoamento da tabela fato 'voos' a partir de voos_2024,
-- traduzindo os textos para as chaves estrangeiras das dimensões

INSERT INTO voos (
    id_empresa, id_mes, id_aeroporto_origem, id_aeroporto_destino,
    id_grupo, id_natureza, passageiros_pagos, passageiros_gratis,
    carga_paga_kg, carga_gratis_kg, correio_kg, distancia,
    ask, rpk, atk, rtk, ano
)
SELECT
    e.id_empresa,
    m.id_mes,
    ao.id_aeroporto AS id_origem,
    ad.id_aeroporto AS id_destino,
    g.id_grupo,
    n.id_natureza,
    voos_2024.[PASSAGEIROS PAGOS],
    voos_2024.[PASSAGEIROS GRÁTIS],
    voos_2024.[CARGA PAGA (KG)],
    voos_2024.[CARGA GRÁTIS (KG)],
    voos_2024.[CORREIO (KG)],
    voos_2024.[DISTÂNCIA VOADA (KM)],
    voos_2024.ASK,
    voos_2024.RPK,
    voos_2024.ATK,
    voos_2024.RTK,
    voos_2024.ANO
FROM voos_2024
JOIN empresas AS e ON voos_2024.[EMPRESA (NOME)] = e.nome
JOIN meses AS m ON voos_2024.[MÊS] = m.id_mes
JOIN grupo_voo AS g ON voos_2024.[GRUPO DE VOO] = g.descricao
JOIN aeroportos AS ao ON voos_2024.[AEROPORTO DE ORIGEM (SIGLA)] = ao.sigla
JOIN aeroportos AS ad ON voos_2024.[AEROPORTO DE DESTINO (SIGLA)] = ad.sigla
JOIN natureza AS n ON voos_2024.NATUREZA = n.descricao;
