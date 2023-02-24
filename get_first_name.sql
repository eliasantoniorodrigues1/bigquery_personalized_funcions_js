CREATE OR REPLACE FUNCTION `project_id.dataset.f_obtem_primeiro_nome`(nome STRING, capitalizado BOOL)
RETURNS STRING
OPTIONS (description="Função recebe dois parâmetros: Nome do tipo String e Capitalizado do tipo boleano (True ou False) e retorna o primeiro nome.") AS (
CASE WHEN capitalizado = TRUE THEN
    INITCAP(REGEXP_EXTRACT(REPLACE(TRIM(nome), ' .', ''), '^[a-z-A-Zà-ü-À-Ü]+\\s'))
  ELSE
    UPPER(REGEXP_EXTRACT(REPLACE(TRIM(nome), ' .', ''), '^[a-z-A-Zà-ü-À-Ü]+\\s'))
  END
);
