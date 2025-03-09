-- Criando o banco de dados
CREATE DATABASE EXERCICIOSQL;
USE EXERCICIOSQL;

-- Criando a tabela CLIENTES
CREATE TABLE CLIENTES
(
    idCliente    INT PRIMARY KEY AUTO_INCREMENT,
    nome         VARCHAR(100) NOT NULL,
    email        VARCHAR(100) UNIQUE NOT NULL,
    dataCadastro DATETIME DEFAULT NOW()
);

-- Criando a tabela PRODUTOS
CREATE TABLE PRODUTOS
(
    idProduto         INT PRIMARY KEY AUTO_INCREMENT,
    nome              VARCHAR(100) NOT NULL,
    preco             DECIMAL(8, 2) NOT NULL,
    quantidadeEstoque INT DEFAULT 0
);

-- Criando a tabela PEDIDOS
CREATE TABLE PEDIDOS
(
    idPedido   INT PRIMARY KEY AUTO_INCREMENT,
    idCliente  INT NOT NULL,
    dataPedido DATETIME DEFAULT NOW(),
    CONSTRAINT fk_pedidos_cliente FOREIGN KEY (idCliente)
        REFERENCES CLIENTES (idCliente) ON DELETE CASCADE
);

-- Criando a tabela ITENS_PEDIDO
CREATE TABLE ITENS_PEDIDO
(
    idItem        INT PRIMARY KEY AUTO_INCREMENT,
    idPedido      INT NOT NULL,
    idProduto     INT NOT NULL,
    quantidade    INT NOT NULL,
    precoUnitario DECIMAL(8, 2) CHECK (precoUnitario > 0),

    -- Chaves estrangeiras garantindo integridade referencial
    CONSTRAINT fk_itens_pedido_pedido FOREIGN KEY (idPedido)
        REFERENCES PEDIDOS (idPedido) ON DELETE CASCADE,

    CONSTRAINT fk_itens_pedido_produto FOREIGN KEY (idProduto)
        REFERENCES PRODUTOS (idProduto) ON DELETE CASCADE
);
