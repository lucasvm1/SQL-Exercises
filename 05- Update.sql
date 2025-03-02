-- Atualizar o preço do Notebook
UPDATE exerciciosql.produtos
SET preco = 3800
WHERE idProduto = 1;

-- Reduzir o estoque do produto após uma venda (Teclado - 2 unidades)
UPDATE exerciciosql.produtos
SET quantidadeEstoque = quantidadeEstoque - 2
WHERE idProduto = 2;

-- Atualizar o email do cliente Ana Santos
UPDATE exerciciosql.clientes
SET email = 'ana.nova@email.com'
WHERE idCliente = 3;

-- Excluir um pedido e garantir que os itens também sejam removidos
DELETE FROM exerciciosql.itens_pedido
WHERE idPedido = 2;

DELETE FROM exerciciosql.pedidos
WHERE idPedido = 2;

-- Excluir um cliente e garantir que seus pedidos e itens também sejam removidos
DELETE FROM exerciciosql.itens_pedido
WHERE idPedido IN (SELECT idPedido FROM exerciciosql.pedidos WHERE idCliente = 3);

DELETE FROM exerciciosql.pedidos
WHERE idCliente = 3;

DELETE FROM exerciciosql.clientes
WHERE idCliente = 3;
