# Glossário de Fórmulas e Conceitos

Documentação das métricas de aviação e conceitos de SQL usados nas análises deste projeto.

## Métricas de Aviação

### Taxa de ocupação (Load Factor)

**Fórmula:**
```sql
SUM(RPK) * 1.0 / SUM(ASK) * 100
```

**O que significa:** RPK(Revenue Passenger Kilometers): mede a capacidade que realmente foi ocupada/vendida
"passageiros pagantes x distância voada"

ASK(Available Seat Kilometers): mede a capacidade total oferecida
"assentos disponíveis x distância voada"

**Usada em:** `taxa_ocupacao.sql`

---

### Taxa de cancelamento

**Fórmula:**
```sql
SUM(CASE WHEN "Situação Voo" = 'CANCELADO' THEN 1 ELSE 0 END) * 1.0 / COUNT(*) * 100
```

**O que significa:** Fórmula para identificar voos que foram cancelados, retornado 1 se sim e 0 se não, utilizando 
a cláusula SUM para somar esses resultados e a divisão total para descobrir a porcentagam. 
Quando os dois números envolvidos na divisão são inteiros, deve 
multiplicar por 1.0 antes da divisão para forçar o resultado a ser decimal e evitando que o SQLite arredonde para 0

**Usada em:** `nivel_1_cancelamento.sql`

---

### Taxa de pontualidade

**Fórmula:**
```sql
SUM(CASE WHEN "Situação Partida" = 'Pontual' AND "Situação Chegada" = 'Pontual' THEN 1 ELSE 0 END) * 1.0 / COUNT(*) * 100
```

**O que significa:** Utilizado os resultados tanto de "Situação Partida" quanto 
de "Situação Chegada" para verificar a pontualidade dos voos das empresas em seu trajeto completo.

**Usada em:** `pontualidade_por_empresa.sql`

---

## Conceitos de SQL

---

### SUBSTR

**O que faz:** Serve para "recortar" uma palavra, por exemplo, no nosso caso 
foi utilizada em uma data em formato brasileiro, formato diferente do utilizado.

SUBSTR(texto, posição inicial, quantidade de caracter)
- texto: de onde quer recortar
- posição inicial: em que caractér começa (da esquerda para a direita)
- quant. caractér: começando do 1

**Exemplo:**
```sql
SUBSTR(texto, posição_inicial, quantidade_de_caracteres)
```
