-- Criando a VIEW para histórico de pedidos
CREATE VIEW exerciciosql.vw_historico_pedidos AS
SELECT
    pedidos.idPedido,
    clientes.nome AS nome_cliente,
    pedidos.dataPedido,
    produtos.nome AS nome_produto,
    itens_pedido.quantidade,
    itens_pedido.precoUnitario,
    (itens_pedido.quantidade * itens_pedido.precoUnitario) AS valor_total_item
FROM exerciciosql.pedidos
         LEFT JOIN exerciciosql.clientes ON pedidos.idCliente = clientes.idCliente
         LEFT JOIN exerciciosql.itens_pedido ON pedidos.idPedido = itens_pedido.idPedido
         LEFT JOIN exerciciosql.produtos ON itens_pedido.idProduto = produtos.idProduto;

-- Testando se a VIEW foi criada corretamente
SELECT * FROM exerciciosql.vw_historico_pedidos;

-- Consulta usando a VIEW para buscar pedidos de um cliente específico
SELECT * FROM exerciciosql.vw_historico_pedidos
WHERE nome_cliente = 'Maria Silva';
