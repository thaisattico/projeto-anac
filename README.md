# Projeto ANAC

Projeto de portfólio em análise de dados, com dados públicos da Agência Nacional da Aviação Civil (ANAC), com objetivo de gerar insights sobre cancelamentos, atrasos e ocupação de voos.

## Stack
- SQLite
- Python

## Ferramentas
- SQLite Studio
- VSCode

## Banco de Dados 

### Fonte dos dados
- [Dados estatísticos do transporte aéreo (ANAC)](https://www.anac.gov.br/acesso-a-informacao/dados-abertos/areas-de-atuacao/voos-e-operacoes-aereas/dados-estatisticos-do-transporte-aereo/48-dados-estatisticos-do-transporte-aereo)
- [VRA — Voos Regulares Ativos, arquivos mensais de 2024 (SIROS/ANAC)](https://siros.anac.gov.br/siros/registros/diversos/vra/2024/)

### Tabelas e Colunas

#### Tabela 1: aeroportos

Guarda a informação dos aeroportos.

Colunas
- id_aeroporto
- nome
- sigla
- pais
- continente
- uf
- regiao

#### Tabela 2: empresas

Guarda as informações das empresas aéreas.

Colunas
  - id_empresa
  - nome
  - sigla
  - nacionalidade
 
#### Tabela 3: grupo_voo

Guarda a descrição do voo (regular, irregular, improdutivo)

Colunas
  - id_grupo
  - descricao
 
#### Tabela 4: meses

Guarda as informações durante os meses do ano.

Colunas
- id_mes
- numero_mes
- nome_mes

#### Tabela 5: natureza

Guarda informação de voo nacional ou internacional.

Colunas:
- id_natureza
- descrição

#### Tabela 6: voos

Guarda todas as informações sobre um voo.

Colunas:
- id_voo
- id_empresa
- id_mes
- id_aeroporto_origem
- id_aeroporto_destino
- id_grupo
- id_natureza
- passageiros_pagos
- passageiros_gratis
- carga_paga_kg
- carga_gratis_kg
- correio_kg
- distancia
- ask
- rpk
- atk
- rtk
- ano

#### Tabela 7: voos_2024

Tabela original.

Colunas:
- EMPRESA (SIGLA)
- EMPRESA (NOME)
- EMPRESA (NACIONALIDADE)
- ANO
- MÊS
- AEROPORTO DE ORIGEM (SIGLA)
- AEROPORTO DE ORIGEM (NOME)
- AEROPORTO DE ORIGEM (UF)
- AEROPORTO DE ORIGEM (REGIÃO)
- AEROPORTO DE ORIGEM (PAÍS)
- AEROPORTO DE ORIGEM (CONTINENTE)
- AEROPORTO DE DESTINO (SIGLA)
- AEROPORTO DE DESTINO (NOME)
- AEROPORTO DE DESTINO (UF)
- AEROPORTO DE DESTINO (REGIÃO)
- AEROPORTO DE DESTINO (PAÍS)
- AEROPORTO DE DESTINO (CONTINENTE)
- NATUREZA
- GRUPO DE VOO
- PASSAGEIROS PAGOS
- PASSAGEIROS GRÁTIS
- CARGA PAGA (KG)
- CARGA GR[ATIS (KG)
- CORREIO (KG)
- ASK
- RPK
- ATK
- RTK
- COMBUSTÍVEL (LITROS)
- DISTÂNCIA VOADA (KM)
- DECOLAGENS
- CARGA PAGA KM
- CARGA GRÁTIS KM
- CORREIO KM
- ASSENTOS
- PAYLOAD
- HORAS VOADAS
- BAGAGEM (KG)

#### Tabela 8: vra_2024

Guarda informações sobre os voos.

Colunas:
- Sigla ICAO Empresa Aérea
- Empresa Aérea
- Número Voo
- Código DI
- Código Tipo Linha
- Modelo Equipamento
- Números de Assentos
- Sigla ICAO Aeroporto Origem
- Descrição Aeroporto Origem
- Partida Prevista
- Partida Real
- Sigla ICAO Aeroporto Destino
- Descrição Aeroporto Destino
- Chegada Prevista
- Chegada Real
- Situação Voo
- Justificativa
- Referência
- Situação Partida
- Situação Chegada
- Codeshare
- arquivo_origem



  
  
