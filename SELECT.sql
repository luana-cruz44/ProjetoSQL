
--SELECT

--Produtos com estoque maior que 50 ordenados por quantidade
SELECT cod_produto, nome_produto, quantidade_produto
FROM tb_produto
WHERE quantidade_produto > 50
ORDER BY quantidade_produto DESC
LIMIT 5;


--Vendas realizadas por funcionários informando o nome do funcionário
SELECT v.cod_venda, f.nome AS funcionario, v.total_venda, v.data_venda
FROM tb_venda v
JOIN tb_funcionario f ON v.cod_funcionario = f.cod_funcionario
WHERE v.total_venda > 100
ORDER BY v.data_venda ASC;


-- Compras feiras por fornecedores limitando os tres primeiros registos
SELECT c.cod_compra, f.nome AS fornecedor, c.valor_compra, c.data_compra
FROM tb_compra c
JOIN tb_fornecedor f ON c.cod_fornecedor = f.cod_fornecedor
WHERE c.valor_compra >= 500
ORDER BY c.valor_compra DESC
LIMIT 3;


-- Produtos vendidos em determinada venda

SELECT v.cod_venda, p.nome_produto, pv.quantidade_produtovenda, pv.preco_unitario
FROM tb_venda v
JOIN tb_produtovenda pv ON v.cod_venda = pv.cod_venda
JOIN tb_produto p ON pv.cod_produto = p.cod_produto
WHERE v.cod_venda = 1
ORDER BY pv.quantidade_produtovenda DESC;


-- Funcionários que realizaram vendas em Outubro de 2024
SELECT DISTINCT f.nome, f.cargo, v.data_venda
FROM tb_funcionario f
JOIN tb_venda v ON f.cod_funcionario = v.cod_funcionario
WHERE v.data_venda BETWEEN '2024-10-01' AND '2024-10-31'
ORDER BY v.data_venda ASC;










