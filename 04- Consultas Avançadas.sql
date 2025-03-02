-- Listar todos os pedidos com nome do cliente e data
SELECT pedidos.idPedido,
       clientes.nome,
       pedidos.dataPedido
FROM exerciciosql.pedidos
         LEFT JOIN exerciciosql.clientes ON pedidos.idCliente = clientes.idCliente;

-- Mostrar os produtos comprados em cada pedido
SELECT pedidos.idPedido,
       produtos.nome AS "Nome Produto",
       itens_pedido.quantidade,
       itens_pedido.precoUnitario
FROM exerciciosql.itens_pedido
         LEFT JOIN exerciciosql.pedidos ON itens_pedido.idPedido = pedidos.idPedido
         LEFT JOIN exerciciosql.produtos ON itens_pedido.idProduto = produtos.idProduto;

-- Calcular o total gasto em cada pedido
SELECT pedidos.idPedido,
       COALESCE(SUM(ip.precoUnitario * ip.quantidade), 0) AS "VALOR TOTAL"
FROM exerciciosql.pedidos
         LEFT JOIN exerciciosql.itens_pedido ip ON pedidos.idPedido = ip.idPedido
GROUP BY pedidos.idPedido;

-- Cliente que fez mais pedidos
SELECT c.nome,
       p.TotalPedidosCliente
FROM (SELECT idCliente, COUNT(*) AS TotalPedidosCliente
      FROM exerciciosql.pedidos
      GROUP BY idCliente) AS p
         JOIN exerciciosql.clientes c
              ON p.idCliente = c.idCliente
ORDER BY p.TotalPedidosCliente DESC
LIMIT 1;

-- Produto mais vendido
SELECT p.nome,
       q.QuantidadeVendida
FROM (SELECT idProduto, SUM(itens_pedido.quantidade) AS QuantidadeVendida
      FROM exerciciosql.itens_pedido
      GROUP BY idProduto) AS q
         JOIN exerciciosql.produtos p ON p.idProduto = q.idProduto
ORDER BY q.QuantidadeVendida DESC
LIMIT 1;
