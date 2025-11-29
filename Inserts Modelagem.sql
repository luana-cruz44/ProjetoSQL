-- Inserts na tabela tb_pais
INSERT INTO tb_pais (nome_pais) VALUES 
('Brasil'),
('Argentina'),
('Estados Unidos'),
('Alemanha');

-- Inserts na tabela tb_estado
INSERT INTO tb_estado (cod_pais, uf) VALUES 
(1, 'SP'),  -- Brasil
(1, 'RJ'),  -- Brasil
(2, 'BA'),  -- Argentina
(3, 'CA');  -- Estados Unidos

-- Inserts na tabela tb_cidade
INSERT INTO tb_cidade (cod_estado, nome_cidade) VALUES 
(1, 'São Paulo'),    -- Estado SP
(1, 'Campinas'),     -- Estado SP
(2, 'Rio de Janeiro'), -- Estado RJ
(3, 'Buenos Aires'), -- Argentina
(4, 'Los Angeles');  -- Estados Unidos

-- Inserts na tabela tb_endereco
INSERT INTO tb_endereco (cod_cidade, tipo_logradouro, nome, complemento, numero, bairro, cep) VALUES 
(1, 'Rua', 'Paulista', 'Apto 101', 1000, 'Centro', '01001000'),
(2, 'Av', 'Dom Pedro', 'Casa', 500, 'Zona Sul', '02002000'),
(3, 'Rua', 'Copacabana', NULL, 300, 'Zona Norte', '03003000');

-- Inserts na tabela tb_fornecedor
INSERT INTO tb_fornecedor (cod_endereco, nome, cnpj_fornecedor, email, telefone) VALUES 
(1, 'Fornecedor A', '12345678000199', 'fornecedorA@example.com', '11987654321'),
(2, 'Fornecedor B', '98765432000166', 'fornecedorB@example.com', '21987654321');

-- Inserts na tabela tb_funcionario
INSERT INTO tb_funcionario (cod_endereco, nome, cpf_funcionario, data_nasc, sexo, email, telefone, cargo) VALUES 
(1, 'Carlos Silva', '12345678901', '1980-05-15', 'M', 'carlos.silva@example.com', '11999999999', 'Vendedor'),
(2, 'Ana Souza', '98765432100', '1990-07-22', 'F', 'ana.souza@example.com', '21999999999', 'Caixa');

-- Inserts na tabela tb_produto
INSERT INTO tb_produto (nome_produto, quantidade_produto) VALUES 
('Produto A', 50),
('Produto B', 100),
('Produto C', 200);

-- Inserts na tabela tb_compra
INSERT INTO tb_compra (cod_fornecedor, cod_funcionario, valor_compra, data_compra, previsao_entrega, data_entrega, data_pagamento) VALUES 
(1, 1, 500.00, '2024-10-01', '2024-10-05', '2024-10-05', '2024-10-06'),
(2, 2, 1500.00, '2024-09-20', '2024-09-25', '2024-09-25', '2024-09-30');

-- Inserts na tabela tb_produtocompra
INSERT INTO tb_produtocompra (cod_produto, cod_compra, valor_unitario, quantidade_compra) VALUES 
(1, 1, 10.00, 30),   -- Compra do Produto A
(2, 2, 15.00, 50);   -- Compra do Produto B

-- Inserts na tabela tb_venda
INSERT INTO tb_venda (cod_funcionario, data_venda, total_venda, tipo_pagamento, cod_terminal) VALUES 
(1, '2024-10-07', 100.00, 'Cartão de Crédito', 1),
(2, '2024-10-08', 200.00, 'Dinheiro', 2);

-- Inserts na tabela tb_produtovenda
INSERT INTO tb_produtovenda (cod_venda, cod_produto, preco_unitario, quantidade_produtovenda) VALUES 
(1, 1, 10.00, 5),  -- Venda do Produto A
(1, 2, 20.00, 3),  -- Venda do Produto B
(2, 1, 10.00, 10); -- Venda do Produto A novamente



