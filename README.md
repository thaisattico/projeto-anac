# Projeto ANAC

🚧 Em andamento

Projeto de portfólio em análise de dados, com dados públicos da Agência Nacional da Aviação Civil (ANAC), com objetivo de gerar insights sobre cancelamentos, atrasos e ocupação de voos.

--- 

## Stack

- SQLite
- Python
- Git/Github

---

## Ferramentas

- SQLite Studio
- VSCode
- Github Desktop

---

## Estrutura do repositório

```
Queries/
├── criacao_schema.sql               #criação das tabelas dimensão e da tabela fato
├── povoamento_dimensoes.sql         #população das tabelas dimensão a partir de voos_2024
├── povoamento_fato_voos.sql         #população da tabela fato voos
├── nivel_1_fundamentos.sql          #total de voos por empresa
├── nivel_1_cancelamento.sql         #cancelamentos por empresa (absoluto e taxa %)
├── cancelamento_por_mes.sql         #mês com mais cancelamentos em 2024
├── cancelamento_por_aeroporto.sql   #top 10 aeroportos com mais cancelamentos
├── aeroportos_origem.sql            #top 10 aeroportos de origem com mais voos
├── rotas_atrasos.sql                #top 10 rotas com mais atrasos
├── pontualidade_por_empresa.sql     #top 10 empresas mais pontuais (partida e chegada)
├── taxa_ocupacao.sql                #taxa de ocupação (load factor) por empresa
├── comparativo_companhias_rota.sql  #comparativo de cancelamento entre empresas concorrentes na mesma rota
└── manutencao/
    ├── correcao_duplicatas.sql      #remoção de duplicatas nas tabelas dimensão
    └── correcao_meses.sql           #limpeza de linhas nulas na tabela meses
```
--- 

## Banco de Dados

### Fonte dos dados

- [Dados estatísticos do transporte aéreo (ANAC)](https://www.anac.gov.br/acesso-a-informacao/dados-abertos/areas-de-atuacao/voos-e-operacoes-aereas/dados-estatisticos-do-transporte-aereo/48-dados-estatisticos-do-transporte-aereo)
- [VRA — Voos Regulares Ativos, arquivos mensais de 2024 (SIROS/ANAC)](https://siros.anac.gov.br/siros/registros/diversos/vra/2024/)

--- 

## Tabelas e Colunas

### Tabela 1: aeroportos
Guarda a informação dos aeroportos.

Colunas
- id_aeroporto
- nome
- sigla
- pais
- continente
- uf
- regiao

### Tabela 2: empresas
Guarda as informações das empresas aéreas.

Colunas
- id_empresa
- nome
- sigla
- nacionalidade

### Tabela 3: grupo_voo
Guarda a descrição do voo (regular, irregular, improdutivo)

Colunas
- id_grupo
- descricao

### Tabela 4: meses
Guarda as informações durante os meses do ano.

Colunas
- id_mes
- numero_mes
- nome_mes

### Tabela 5: natureza
Guarda informação de voo nacional ou internacional.

Colunas:
- id_natureza
- descricao

### Tabela 6: voos
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

### Tabela 7: voos_2024
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
- CARGA GRÁTIS (KG)
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

### Tabela 8: vra_2024
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

---

## Análises realizadas

Total de voos por empresa (nivel_1_fundamentos.sql) 
- Contagem geral de voos por empresa aérea.

Cancelamentos por empresa (nivel_1_cancelamento.sql) 
- Quantidade absoluta de cancelamentos por empresa aérea, e taxa de cancelamento (%) considerando o total de voos de cada empresa.

Mês com mais cancelamentos (cancelamento_por_mes.sql) 
- Identifica qual mês de 2024 teve o maior número de voos cancelados.

Top 10 aeroportos com mais cancelamentos (cancelamento_por_aeroporto.sql) 
- Considera o aeroporto tanto como origem quanto como destino de voos cancelados.

Top 10 aeroportos de origem (aeroportos_origem.sql) 
- Os 10 aeroportos com maior volume de voos partindo deles.

Top 10 rotas com mais atrasos (rotas_atrasos.sql) 
- Rotas (origem-destino) com maior número de voos atrasados na partida.

Top 10 empresas mais pontuais (pontualidade_por_empresa.sql) 
- Taxa de pontualidade considerando partida e chegada simultaneamente, com filtro de volume mínimo de voos para evitar distorção estatística.

Taxa de ocupação por empresa (taxa_ocupacao.sql) 
- Load factor (RPK/ASK) de cada empresa aérea.

Comparativo de companhias por rota (comparativo_companhias_rota.sql) 
- Compara a taxa de cancelamento entre empresas que operam a mesma rota (concorrência direta), filtrando rotas com volume relevante de voos.
