-- Criando índice para otimizar buscas por email dos clientes
CREATE INDEX idx_email_cliente
    ON exerciciosql.clientes (email);

-- Criando índice para otimizar buscas em itens de pedidos
CREATE INDEX idx_itens_pedido
    ON exerciciosql.itens_pedido (idPedido, idProduto);

-- Testando se os índices foram criados corretamente
SHOW INDEXES FROM exerciciosql.clientes;
SHOW INDEXES FROM exerciciosql.itens_pedido;

-- Consulta otimizada usando índice de email
SELECT * FROM exerciciosql.clientes
WHERE email = 'joao@email.com';

-- Consulta otimizada usando índice de pedidos e produtos
SELECT * FROM exerciciosql.itens_pedido
WHERE idPedido = 2 AND idProduto = 3;
