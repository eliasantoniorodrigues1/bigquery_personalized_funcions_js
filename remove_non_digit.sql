CREATE OR REPLACE FUNCTION `project_id.dataset.f_remove_digitos`(texto STRING)
RETURNS STRING
OPTIONS (description="Função para remover do texto caracteres que não são digitos como \". , - /\" e etc. Exemplo: 000.111.222-22 irá remover todos os pontos e hífens") AS (
REGEXP_REPLACE(texto, '\\D', '')
);
