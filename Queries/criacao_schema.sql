-- Criação das tabelas dimensão e da tabela fato

-- Tabela dimensão: aeroportos
CREATE TABLE aeroportos (
    id_aeroporto INTEGER PRIMARY KEY,
    nome TEXT,
    sigla TEXT,
    pais TEXT,
    continente TEXT,
    uf TEXT,
    regiao TEXT
);

-- Tabela dimensão: empresas
CREATE TABLE empresas (
    id_empresa INTEGER PRIMARY KEY,
    nome TEXT,
    sigla TEXT,
    nacionalidade TEXT
);

-- Tabela dimensão: meses
CREATE TABLE meses (
    id_mes INTEGER PRIMARY KEY,
    numero_mes INTEGER,
    nome_mes TEXT
);

-- Tabela dimensão: grupo_voo
CREATE TABLE grupo_voo (
    id_grupo INTEGER PRIMARY KEY,
    descricao TEXT
);

-- Tabela dimensão: natureza
CREATE TABLE natureza (
    id_natureza INTEGER PRIMARY KEY,
    descricao TEXT
);

-- Tabela fato: voos
CREATE TABLE voos (
    id_voo INTEGER PRIMARY KEY,
    id_empresa INTEGER,
    id_mes INTEGER,
    id_aeroporto_origem INTEGER,
    id_aeroporto_destino INTEGER,
    id_grupo INTEGER,
    id_natureza INTEGER,
    passageiros_pagos INTEGER,
    passageiros_gratis INTEGER,
    carga_paga_kg REAL,
    carga_gratis_kg REAL,
    correio_kg REAL,
    distancia REAL,
    ask REAL,
    rpk REAL,
    atk REAL,
    rtk REAL,
    ano INTEGER,
    FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa),
    FOREIGN KEY (id_mes) REFERENCES meses(id_mes),
    FOREIGN KEY (id_aeroporto_origem) REFERENCES aeroportos(id_aeroporto),
    FOREIGN KEY (id_aeroporto_destino) REFERENCES aeroportos(id_aeroporto),
    FOREIGN KEY (id_grupo) REFERENCES grupo_voo(id_grupo),
    FOREIGN KEY (id_natureza) REFERENCES natureza(id_natureza)
);
