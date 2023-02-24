CREATE OR REPLACE FUNCTION `project_id.dataset.f_obtem_sobrenome`(nome STRING, capitalizado BOOL)
RETURNS STRING
OPTIONS (description="Função recebe dois parâmetros: Nome do tipo String e Capitalizado do tipo boleano (True ou False) e retorna o sobrenome do nome passado.") AS (
CASE WHEN capitalizado = TRUE THEN
    INITCAP(REGEXP_EXTRACT(REPLACE(TRIM(nome), ' .', ''), '\\s[a-z-A-Zà-ü-À-Ü]+$'))
  ELSE
    UPPER(REGEXP_EXTRACT(REPLACE(TRIM(nome), ' .', ''), '\\s[a-z-A-Zà-ü-À-Ü]+$'))
  END
);
