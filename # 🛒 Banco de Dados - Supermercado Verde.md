# 🛒 Banco de Dados - Supermercado Verde Mar

Este projeto define a estrutura de um banco de dados relacional em **PostgreSQL** para gerenciar as operações de um supermercado fictício chamado **Verdes Mar**.  
O objetivo é organizar informações de produtos, fornecedores, funcionários, compras e vendas, garantindo integridade referencial e suporte para relatórios gerenciais.

---

## 📌 Objetivos do Projeto
- Criar um modelo de dados normalizado para operações de supermercado.  
- Garantir integridade referencial entre entidades (produtos, vendas, compras, fornecedores, funcionários).  
- Permitir consultas analíticas para relatórios de vendas, estoque e fornecedores.  
- Servir como base para aplicações de gestão de supermercados.

---

## ⚙️ Requisitos
- **PostgreSQL 15+** (ou versão compatível).  
- Cliente de conexão como **psql**, **pgAdmin** ou qualquer IDE de banco de dados.  

---

## 🚀 Instalação e Execução

1. Crie o banco de dados:
   
   CREATE DATABASE sup_vmar;

📂 Estrutura das Tabelas
🛍️ Produtos
tb_produto

cod_produto → Identificador único (SERIAL, PK).

nome_produto → Nome do produto.

quantidade_produto → Quantidade em estoque.

🧾 Vendas
tb_venda

cod_venda → Identificador da venda (SERIAL, PK).

cod_funcionario → Funcionário responsável.

data_venda → Data e hora da venda.

total_venda → Valor total.

tipo_pagamento → Forma de pagamento.

cod_terminal → Caixa/terminal utilizado.

tb_produtovenda

Relaciona produtos às vendas.

Campos: cod_venda, cod_produto, preco_unitario, quantidade_produtovenda.

📦 Compras
tb_compra

cod_compra → Identificador da compra (SERIAL, PK).

cod_fornecedor → Fornecedor responsável.

cod_funcionario → Funcionário que registrou.

valor_compra → Valor total da compra.

data_compra, previsao_entrega, data_entrega, data_pagamento.

tb_produtocompra

Relaciona produtos às compras.

Campos: cod_produto, cod_compra, valor_unitario, quantidade_compra.

🏢 Fornecedores
tb_fornecedor

cod_fornecedor → Identificador único.

cod_endereco → Endereço do fornecedor.

nome, cnpj_fornecedor, email, telefone.

👨‍💼 Funcionários
tb_funcionario

cod_funcionario → Identificador único.

cod_endereco → Endereço do funcionário.

nome, cpf_funcionario, data_nasc, sexo, email, telefone, cargo.

📍 Endereços
tb_endereco

cod_endereco → Identificador único.

cod_cidade → Cidade vinculada.

tipo_logradouro, nome, complemento, numero, bairro, cep.

tb_cidade

cod_cidade → Identificador único.

cod_estado → Estado vinculado.

nome_cidade.

tb_estado

cod_estado → Identificador único.

cod_pais → País vinculado.

uf.

tb_pais

cod_pais → Identificador único.

nome_pais.

🔗 Relacionamentos (Foreign Keys)
ProdutoCompra → Produto / Compra

Compra → Fornecedor / Funcionário

Fornecedor → Endereço

Funcionário → Endereço

ProdutoVenda → Produto / Venda

Venda → Funcionário

Endereço → Cidade

Cidade → Estado

Estado → País

País → Estado → Cidade → Endereço → Fornecedor/Funcionário
Produto → Compra → ProdutoCompra
Produto → Venda → ProdutoVenda

-- Países
INSERT INTO tb_pais (nome_pais) VALUES 
('Brasil'),
('Argentina'),
('Estados Unidos'),
('Alemanha');

-- Estados
INSERT INTO tb_estado (cod_pais, uf) VALUES 
(1, 'SP'),
(1, 'RJ'),
(2, 'BA'),
(3, 'CA');

-- Cidades
INSERT INTO tb_cidade (cod_estado, nome_cidade) VALUES 
(1, 'São Paulo'),
(1, 'Campinas'),
(2, 'Rio de Janeiro'),
(3, 'Buenos Aires'),
(4, 'Los Angeles');

-- Endereços
INSERT INTO tb_endereco (cod_cidade, tipo_logradouro, nome, complemento, numero, bairro, cep) VALUES 
(1, 'Rua', 'Paulista', 'Apto 101', 1000, 'Centro', '01001000'),
(2, 'Av', 'Dom Pedro', 'Casa', 500, 'Zona Sul', '02002000'),
(3, 'Rua', 'Copacabana', NULL, 300, 'Zona Norte', '03003000');

-- Fornecedores
INSERT INTO tb_fornecedor (cod_endereco, nome, cnpj_fornecedor, email, telefone) VALUES 
(1, 'Fornecedor A', '12345678000199', 'fornecedorA@example.com', '11987654321'),
(2, 'Fornecedor B', '98765432000166', 'fornecedorB@example.com', '21987654321');

-- Funcionários
INSERT INTO tb_funcionario (cod_endereco, nome, cpf_funcionario, data_nasc, sexo, email, telefone, cargo) VALUES 
(1, 'Carlos Silva', '12345678901', '1980-05-15', 'M', 'carlos.silva@example.com', '11999999999', 'Vendedor'),
(2, 'Ana Souza', '98765432100', '1990-07-22', 'F', 'ana.souza@example.com', '21999999999', 'Caixa');

-- Produtos
INSERT INTO tb_produto (nome_produto, quantidade_produto) VALUES 
('Produto A', 50),
('Produto B', 100),
('Produto C', 200);

-- Compras
INSERT INTO tb_compra (cod_fornecedor, cod_funcionario, valor_compra, data_compra, previsao_entrega, data_entrega, data_pagamento) VALUES 
(1, 1, 500.00, '2024-10-01', '2024-10-05', '2024-10-05', '2024-10-06'),
(2, 2, 1500.00, '2024-09-20', '2024-09-25', '2024-09-25', '2024-09-30');

-- ProdutoCompra
INSERT INTO tb_produtocompra (cod_produto, cod_compra, valor_unitario, quantidade_compra) VALUES 
(1, 1, 10.00, 30),
(2, 2, 15.00, 50);

-- Vendas
INSERT INTO tb_venda (cod_funcionario, data_venda, total_venda, tipo_pagamento, cod_terminal) VALUES 
(1, '2024-10-07', 100.00, 'Cartão de Crédito', 1),
(2, '2024-10-08', 200.00, 'Dinheiro', 2);

-- ProdutoVenda
INSERT INTO tb_produtovenda (cod_venda, cod_produto, preco_unitario, quantidade_produtovenda) VALUES 
(1, 1, 10.00, 5),
(1, 2, 20.00, 3),
(2, 1, 10.00, 10);

SELECT nome_produto, quantidade_produto
FROM tb_produto;


SELECT v.cod_venda, f.nome AS funcionario, p.nome_produto, pv.quantidade_produtovenda, pv.preco_unitario
FROM tb_venda v
JOIN tb_funcionario f ON v


📝 Destaques
Estrutura normalizada para evitar redundância.

Uso de SERIAL para chaves primárias auto incrementadas.

Integridade referencial garantida por várias foreign keys.

Scripts de inserts iniciais já prontos para popular o banco.

Exemplos de consultas SQL para relatórios de estoque, vendas e compras