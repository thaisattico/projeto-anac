-- Limpeza de linhas nulas na tabela meses

-- Verificação de duplicatas por id_mes (checagem de sanidade)
SELECT id_mes, COUNT(*) FROM meses GROUP BY id_mes HAVING COUNT(*) > 1;

-- Remove linhas onde o nome do mês não foi preenchido (NULL)
DELETE FROM meses
WHERE nome_mes IS NULL;

-- Conferência final da quantidade de linhas
SELECT COUNT(*) AS total_linhas FROM meses;
