-- Povoamento das tabelas dimensão a partir de voos_2024

-- aeroportos: origem + destino combinados
INSERT INTO aeroportos (nome, sigla, pais, continente, uf, regiao)
SELECT DISTINCT
    "AEROPORTO DE ORIGEM (NOME)", "AEROPORTO DE ORIGEM (SIGLA)",
    "AEROPORTO DE ORIGEM (PAÍS)", "AEROPORTO DE ORIGEM (CONTINENTE)",
    "AEROPORTO DE ORIGEM (UF)", "AEROPORTO DE ORIGEM (REGIÃO)"
FROM voos_2024
UNION -- remove duplicatas exatas
SELECT DISTINCT
    "AEROPORTO DE DESTINO (NOME)", "AEROPORTO DE DESTINO (SIGLA)",
    "AEROPORTO DE DESTINO (PAÍS)", "AEROPORTO DE DESTINO (CONTINENTE)",
    "AEROPORTO DE DESTINO (UF)", "AEROPORTO DE DESTINO (REGIÃO)"
FROM voos_2024;

-- empresas
INSERT INTO empresas (nome, sigla, nacionalidade)
SELECT DISTINCT [EMPRESA (NOME)], [EMPRESA (SIGLA)], [EMPRESA (NACIONALIDADE)]
FROM voos_2024;

-- meses
INSERT INTO meses (numero_mes, nome_mes)
SELECT DISTINCT [MÊS],
    CASE
        WHEN [MÊS] = 1 THEN 'Janeiro'
        WHEN [MÊS] = 2 THEN 'Fevereiro'
        WHEN [MÊS] = 3 THEN 'Março'
        WHEN [MÊS] = 4 THEN 'Abril'
        WHEN [MÊS] = 5 THEN 'Maio'
        WHEN [MÊS] = 6 THEN 'Junho'
        WHEN [MÊS] = 7 THEN 'Julho'
        WHEN [MÊS] = 8 THEN 'Agosto'
        WHEN [MÊS] = 9 THEN 'Setembro'
        WHEN [MÊS] = 10 THEN 'Outubro'
        WHEN [MÊS] = 11 THEN 'Novembro'
        WHEN [MÊS] = 12 THEN 'Dezembro'
    END
FROM voos_2024;

-- grupo_voo
INSERT INTO grupo_voo (descricao)
SELECT DISTINCT [GRUPO DE VOO]
FROM voos_2024;

-- natureza
INSERT INTO natureza (descricao)
SELECT DISTINCT NATUREZA
FROM voos_2024;