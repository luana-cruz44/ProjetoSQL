


-- Criação da tabela produto
CREATE TABLE tb_produto (
    cod_produto SERIAL PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    quantidade_produto INT NOT NULL
);

-- Criação da tabela tb_produtovenda
CREATE TABLE tb_produtovenda (
    cod_produtovenda SERIAL PRIMARY KEY,
    cod_venda INT NOT NULL,
    cod_produto INT NOT NULL,
    preco_unitario DECIMAL(9,2) NOT NULL,
    quantidade_produtovenda INT NOT NULL
);

-- Criação da tabela tb_venda
CREATE TABLE tb_venda (
    cod_venda SERIAL PRIMARY KEY,
    cod_funcionario INT NOT NULL,
    data_venda TIMESTAMP NOT NULL,
    total_venda DECIMAL(9,2) NOT NULL,
    tipo_pagamento VARCHAR(30) NOT NULL,
    cod_terminal SMALLINT NOT NULL
);

-- Criação da tabela tb_produtocompra
CREATE TABLE tb_produtocompra (
    cod_produtocompra SERIAL PRIMARY KEY,
    cod_produto INT NOT NULL,
    cod_compra INT NOT NULL,
    valor_unitario DECIMAL(9,2) NOT NULL,
    quantidade_compra INT NOT NULL
);

-- Criação da tabela tb_compra
CREATE TABLE tb_compra (
    cod_compra SERIAL PRIMARY KEY,
    cod_fornecedor INT NOT NULL,
    cod_funcionario INT NOT NULL,
    valor_compra DECIMAL(9,2) NOT NULL,
    data_compra DATE NOT NULL,
    previsao_entrega DATE NOT NULL,
    data_entrega DATE,
    data_pagamento DATE NOT NULL
);

-- Criação da tabela tb_fornecedor
CREATE TABLE tb_fornecedor (
    cod_fornecedor SERIAL PRIMARY KEY,
    cod_endereco INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cnpj_fornecedor CHAR(14) UNIQUE NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefone VARCHAR(16) NOT NULL
);

-- Criação da tabela tb_funcionario
CREATE TABLE tb_funcionario (
    cod_funcionario SERIAL PRIMARY KEY,
    cod_endereco INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpf_funcionario CHAR(11) UNIQUE NOT NULL,
    data_nasc DATE NOT NULL,
    sexo CHAR(1) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefone VARCHAR(16) NOT NULL,
    cargo VARCHAR(20) NOT NULL
);

-- Criação da tabela tb_endereco
CREATE TABLE tb_endereco (
    cod_endereco SERIAL PRIMARY KEY,
    cod_cidade INT NOT NULL,
    tipo_logradouro VARCHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    complemento VARCHAR(20),
    numero INT,
    bairro VARCHAR(30),
    cep CHAR(8) NOT NULL
);

-- Criação da tabela tb_cidade
CREATE TABLE tb_cidade (
    cod_cidade SERIAL PRIMARY KEY,
    cod_estado INT NOT NULL,
    nome_cidade VARCHAR(40) NOT NULL
);

-- Criação da tabela tb_estado
CREATE TABLE tb_estado (
    cod_estado SERIAL PRIMARY KEY,
    cod_pais SMALLINT NOT NULL,
    uf CHAR(2) NOT NULL
);

-- Criação da tabela tb_pais
CREATE TABLE tb_pais (
    cod_pais SERIAL PRIMARY KEY,
    nome_pais VARCHAR(40) NOT NULL
);

-- Foreign Keys
ALTER TABLE tb_produtocompra
    ADD CONSTRAINT fk_tb_produtocompra_cod_produto FOREIGN KEY (cod_produto) REFERENCES tb_produto(cod_produto);

ALTER TABLE tb_produtocompra
    ADD CONSTRAINT fk_tb_compra_cod_compra FOREIGN KEY (cod_compra) REFERENCES tb_compra(cod_compra);

ALTER TABLE tb_compra
    ADD CONSTRAINT fk_tb_fornecedor_cod_fornecedor FOREIGN KEY (cod_fornecedor) REFERENCES tb_fornecedor(cod_fornecedor);

ALTER TABLE tb_compra
    ADD CONSTRAINT fk_tb_funcionario_cod_funcionario FOREIGN KEY (cod_funcionario) REFERENCES tb_funcionario(cod_funcionario);

ALTER TABLE tb_fornecedor
    ADD CONSTRAINT fk_tb_fornecedor_endereco FOREIGN KEY (cod_endereco) REFERENCES tb_endereco(cod_endereco);

ALTER TABLE tb_funcionario
    ADD CONSTRAINT fk_tb_funcionario_endereco FOREIGN KEY (cod_endereco) REFERENCES tb_endereco(cod_endereco);

ALTER TABLE tb_produtovenda
    ADD CONSTRAINT fk_tb_venda_cod_venda FOREIGN KEY (cod_venda) REFERENCES tb_venda(cod_venda);

ALTER TABLE tb_produtovenda
    ADD CONSTRAINT fk_tb_produto_cod_produto FOREIGN KEY (cod_produto) REFERENCES tb_produto(cod_produto);

ALTER TABLE tb_venda
    ADD CONSTRAINT fk_tb_venda_funcionario FOREIGN KEY (cod_funcionario) REFERENCES tb_funcionario(cod_funcionario);

ALTER TABLE tb_endereco
    ADD CONSTRAINT fk_tb_cidade_cod_cidade FOREIGN KEY (cod_cidade) REFERENCES tb_cidade(cod_cidade);

ALTER TABLE tb_cidade
    ADD CONSTRAINT fk_tb_estado_cod_estado FOREIGN KEY (cod_estado) REFERENCES tb_estado(cod_estado);

ALTER TABLE tb_estado
    ADD CONSTRAINT fk_tb_pais_cod_pais FOREIGN KEY (cod_pais) REFERENCES tb_pais(cod_pais);
