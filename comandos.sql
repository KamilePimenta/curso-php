-- Comentário de linha
/* Comentário de
   múltiplas linhas */

-- Criando um BD
CREATE DATABASE nome_do_banco_de_dados
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

-- Renomeando BD (Não é possível diretamente)

-- Apagando BD
DROP DATABASE nome_do_banco_de_dados;

-- Criando tabelas
CREATE TABLE nome_da_tabela (
  nome_campo  INT          NOT NULL AUTO_INCREMENT,
  nome_campo2 CHAR(3)      NULL,
  nome_campo3 VARCHAR(100) NULL,
  PRIMARY KEY (nome_campo)
);

-- Inserindo registros
INSERT INTO nome_da_tabela
  (nome_campo, nome_campo2, nome_campo3)
VALUES
  ('valor', 'valor2', 'valor3'),
  ('valor', 'valor2', 'valor3');

-- Atualizando Registros
UPDATE nome_da_tabela
SET nome_campo = 'valor', nome_campo2 = 'valor'
WHERE nome_campo3 > 10;

-- Deletando Registros
DELETE FROM nome_da_tabela WHERE nome_campo3 IS NULL;

-- Apagando e Inserindo Registros em um único comando
REPLACE INTO nome_da_tabela
  (nome_campo_chave_primaria, nome_campo2, nome_campo3)
VALUES
  ('valor', 'valor2', 'valor3'),
  ('valor', 'valor2', 'valor3');
-- Obs.: Para que o REPLACE funcione como o esperado, o campo de Chave Primária deve ser informado entre os campos

-- Mostrando Registros
SELECT nome_campo, nome_campo2, nome_campo3
FROM nome_da_tabela
WHERE condicional
GROUP BY campos
HAVING filtro
ORDER BY campos
LIMIT offset,qtde;

