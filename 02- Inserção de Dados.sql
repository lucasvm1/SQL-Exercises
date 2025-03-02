-- Inserindo clientes
INSERT INTO exerciciosql.clientes (nome, email)
VALUES ('Maria Silva', 'maria@email.com'),
       ('João Souza', 'joao@email.com'),
       ('Ana Santos', 'ana@email.com'),
       ('Carlos Silva', 'carlos@email.com'),
       ('Fernanda Costa', 'fernanda@email.com');

-- Inserindo produtos
INSERT INTO exerciciosql.produtos (nome, preco, quantidadeEstoque)
VALUES ('Notebook', 3500.00, 10),
       ('Teclado', 150.00, 50),
       ('Mouse', 80.00, 60),
       ('Monitor', 1200.00, 15),
       ('Impressora', 900.00, 20);

-- Inserindo pedidos
INSERT INTO exerciciosql.pedidos (idCliente)
VALUES (1),
       (3),
       (5),
       (5);

-- Inserindo itens nos pedidos
INSERT INTO exerciciosql.itens_pedido (idPedido, idProduto, quantidade, precoUnitario)
VALUES (1, 1, 1, 3500.00),
       (1, 3, 2, 80.00),
       (2, 2, 1, 150.00),
       (2, 5, 1, 900.00),
       (3, 4, 1, 1200.00),
       (4, 1, 1, 1200.00);
