--UPDATE

-- Atualizar quantidade de um produto
UPDATE tb_produto
SET quantidade_produto = 120
WHERE nome_produto = 'Produto A';


-- Alterar email de um fornecedo
UPDATE tb_fornecedor
SET email = 'faturamento@distrinorte.com.br'
WHERE nome = 'Fornecedor A';

-- Atualizar cargo de um funcionário
UPDATE tb_funcionario
SET cargo = 'Gerente'
WHERE nome = 'Ana Souza';


-- DELETE

--  Excluir uma venda específica
DELETE FROM tb_venda
WHERE cod_venda = 2;


--Exlcuir um produto do estoque
DELETE FROM tb_produto
WHERE nome_produto = 'Produto C';


-- Excluir um fonecedor
DELETE FROM tb_fornecedor
WHERE cnpj_fornecedor = '98765432000166';

