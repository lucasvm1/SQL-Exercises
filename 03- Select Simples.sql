-- Listar todos os clientes
SELECT *
FROM exerciciosql.clientes;

-- Listar nome e email dos clientes, ordenados pelo nome
SELECT clientes.nome,
       clientes.email
FROM exerciciosql.clientes
ORDER BY clientes.nome ASC;

-- Listar produtos com preço maior que 100
SELECT *
FROM exerciciosql.produtos
WHERE produtos.preco > 100;

-- Exibir todos os pedidos
SELECT pedidos.idPedido,
       pedidos.idCliente,
       pedidos.dataPedido
FROM exerciciosql.pedidos;

-- Mostrar apenas os itens do pedido 1
SELECT itens_pedido.idProduto,
       itens_pedido.quantidade,
       itens_pedido.precoUnitario
FROM exerciciosql.itens_pedido
WHERE itens_pedido.idPedido = 1;
