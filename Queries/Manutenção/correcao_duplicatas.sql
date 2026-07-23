-- Verificação e remoção de duplicatas nas tabelas dimensão

-- aeroportos
-- Verifica siglas duplicadas (mesmo aeroporto com registros diferentes)
SELECT sigla, COUNT(*)
FROM aeroportos
GROUP BY sigla
HAVING COUNT(*) > 1;

-- Remove duplicatas, mantendo o registro de menor id por sigla
DELETE FROM aeroportos
WHERE id_aeroporto NOT IN (
    SELECT MIN(id_aeroporto)
    FROM aeroportos
    GROUP BY sigla
);

-- empresas 
-- Verifica nomes de empresa duplicados
SELECT nome, COUNT(*) FROM empresas GROUP BY nome HAVING COUNT(*) > 1;

-- grupo_voo
-- Verifica descrições duplicadas
SELECT descricao, COUNT(*) FROM grupo_voo GROUP BY descricao HAVING COUNT(*) > 1;

-- Remove duplicatas, mantendo o registro de menor id por descrição
DELETE FROM grupo_voo
WHERE id_grupo NOT IN (
    SELECT MIN(id_grupo)
    FROM grupo_voo
    GROUP BY descricao
);
