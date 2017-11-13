INSERT INTO
  Modelos (nome, isCarro)
VALUES
  ('Corsa', TRUE),
  ('Titan 150', FALSE),
  ('Chevette', TRUE);

SELECT *
FROM Modelos;

INSERT INTO
  Veiculos (modelo, placa, chassi, renavam, cor, combustivel)
VALUES
  (1, 'DPG-5031', '9BWZZZ377VT004251', '09377842056', 'Prata', 'Gasolina'),
  (1, 'HGT-9058', '9MHGZT377VT004251', '09377842556', 'Brisa da Noite', 'Gas'),
  (2, 'HJO-1585', '9BWZZZ377VT008251', '09577842056', 'Preto', 'Flex'),
  (3, 'BUC-6327', '9BHDJZ377VT004251', '09305152156', 'Verde', 'Alcool');

SELECT *
FROM Veiculos;

INSERT INTO
  Clientes (nome, rg, cpf, rua, numero, cidade, uf, bairro, complemento, cep, tel, cel)
VALUES
  ('Daniel da Silva Bispo', '351547198', '30471410888', 'Hermínio Alves de Godoi', '35', 'Serra Negra', 'SP',
                            'Pq Residencial das Posses', '', '13930000', '1938924718', '19997014416'),
  ('Kamile Pimenta', '579158196', '47067458889', 'Jose Pinton', '430', 'Serra Negra', 'SP', 'Posses', '', '13930000',
                     '1938422398', '19999054753');

SELECT *
FROM Clientes;

INSERT INTO
  FormasPagamento (nome)
VALUES
  ('Boleto'), ('Cartão'), ('Rolo');

SELECT *
FROM FormasPagamento;

INSERT INTO
  Transacoes (vendedor, comprador, valor, formaPagto, qtdeParcelas, valorParcela, sinal)
VALUES
  (1, 2, 20840.99, 2, 100, 208.5, 500),
  (2, 1, 10840.99, 1, 1, 10840.99, 0);

SELECT
  Transacoes.id           AS ID,
  Compradores.nome        AS Comprador,
  Vendedores.nome         AS Vendedor,
  Transacoes.valor        AS Valor,
  Transacoes.qtdeParcelas AS Parcelas,
  Transacoes.valorParcela AS 'Valor da Parcela',
  FormasPagamento.nome    AS 'Forma de Pagamento'
FROM Transacoes
  INNER JOIN Clientes Compradores ON Transacoes.comprador = Compradores.id
  INNER JOIN Clientes Vendedores ON Transacoes.vendedor = Vendedores.id
  INNER JOIN FormasPagamento ON Transacoes.formaPagto = FormasPagamento.id;

INSERT INTO
  VeiculosDasTransacoes (veiculo, transacao)
VALUES (1, 1), (1, 2);

INSERT INTO
  VeiculosDasTransacoes (veiculo, transacao)
VALUES (2, 2);

DELETE FROM VeiculosDasTransacoes
WHERE veiculo = 2 AND transacao = 2;

-- Exercício: Retornar o nome do Comprador e do Vendedor mais o Valor Total e a Froma de Pagamento
-- da Transação, com os dados do veículo: Modelo e Placa.

SELECT
  Transacoes.id        AS 'ID da Transação',
  Vendedor.nome        AS 'Vendedor',
  Comprador.nome       AS 'Comprador',
  Modelos.nome         AS 'Modelo',
  Veiculos.placa       AS 'Placa',
  Transacoes.valor     AS 'Valor Total',
  FormasPagamento.nome AS 'Forma de Pagamento'
FROM Transacoes
  INNER JOIN Clientes Vendedor ON Transacoes.vendedor = Vendedor.id
  INNER JOIN Clientes Comprador ON Transacoes.comprador = Comprador.id
  INNER JOIN FormasPagamento ON Transacoes.formaPagto = FormasPagamento.id
  INNER JOIN VeiculosDasTransacoes ON Transacoes.id = VeiculosDasTransacoes.transacao
  INNER JOIN Veiculos ON VeiculosDasTransacoes.veiculo = Veiculos.id
  INNER JOIN Modelos ON Veiculos.modelo = Modelos.id;

SELECT
  Clientes.nome                  AS 'Nome',
  COUNT(VeiculoComprado.veiculo) AS 'Veículos Comprados'
FROM
  Clientes
  -- Relacionando as tabelas para venda
  LEFT JOIN Transacoes Comprador ON Clientes.id = Comprador.comprador
  INNER JOIN VeiculosDasTransacoes VeiculoComprado ON Comprador.id = VeiculoComprado.transacao
GROUP BY Clientes.id;

SELECT
  Clientes.nome                  AS 'Nome',
  COUNT(VeiculoVendido.veiculo)  AS 'Veículos Vendidos'
FROM
  Clientes
  -- Relacionando as tabelas para compra
  LEFT JOIN Transacoes Vendedor ON Clientes.id = Vendedor.vendedor
  INNER JOIN VeiculosDasTransacoes VeiculoVendido ON Vendedor.id = VeiculoVendido.transacao
GROUP BY Clientes.id;



-- TODO: Localizar erro
SELECT
  Clientes.nome                  AS 'Nome',
  count(VeiculoComprado.veiculo) AS 'Veículos Comprados',
  count(VeiculoVendido.veiculo)  AS 'Veículos Vendidos'
FROM
  Clientes
  -- Relacionando as tabelas para venda
  LEFT JOIN Transacoes Comprador ON Clientes.id = Comprador.comprador
  INNER JOIN VeiculosDasTransacoes VeiculoComprado ON Comprador.id = VeiculoComprado.transacao

  -- Relacionando as tabelas para compra
  LEFT JOIN Transacoes Vendedor ON Clientes.id = Vendedor.vendedor
  INNER JOIN VeiculosDasTransacoes VeiculoVendido ON Vendedor.id = VeiculoVendido.transacao
 GROUP BY Clientes.id;