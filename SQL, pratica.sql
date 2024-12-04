CREATE DATABASE gestao_pedidos;

USE gestao_pedidos;

-- Essa tabela armazena informações sobre os clientes da loja.
CREATE TABLE Cliente (
cliente_id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50),
email VARCHAR(100) UNIQUE,
data_nascimento DATE,
ativo BOOLEAN DEFAULT TRUE
);

-- Armazena os produtos disponíveis para compra.
CREATE TABLE Produto (
produto_id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
descricao TEXT,
preco DECIMAL (10, 2) NOT NULL,
estoque INT DEFAULT 0
);

-- Armazena informações dos pedidos realizados por clientes.
CREATE TABLE Pedido (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pendente', 'enviado', 'concluido', 'cancelado') DEFAULT 'pendente',
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Cada linha representa um item em um pedido específico, ligando um produto a um pedido.
CREATE TABLE ItensPedido (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id)
);

-- Inserindo Clientes
INSERT INTO Cliente (nome, email, data_nascimento) VALUES
('Maria Silva', 'maria.silva@hotmail.com', '1985-05-15'),
('João Oliveira', 'joao.oliveira@gmail.com', '1990-11-20'),
('Pedro Henrique', 'pedro@gmail.com', '2001-08-02');

-- Selecionando dados da tabela Cliente
SELECT * FROM Cliente;

-- Inserindo Produtos
INSERT INTO Produto (nome, descricao, preco, estoque) VALUES
('Notebook', 'Notebook com 8GB RAM e 256GB SSD', 3500.00, 10),
('Smartphone', 'Smartphone com 128GB de armazenamento', 1500.00, 30);

-- Selecionando dados da tabela Produto
SELECT * FROM Produto;

-- Inserindo Pedidos
INSERT INTO Pedido (cliente_id, status) VALUES
(1, 'pendente'),
(2, 'enviado');

-- Selecionando dados da tabela Pedido
SELECT * FROM Pedido;

-- Inserindo Itens em Pedidos
INSERT INTO ItensPedido (pedido_id, produto_id, quantidade, preco) VALUES
(1, 1, 1, 3500.00),
(2, 2, 2, 1500.00);

-- Selecionando dados da tabela Pedido
SELECT * FROM ItensPedido;

-- Consultar todos os clientes ativos:
SELECT * FROM Cliente WHERE ativo = TRUE;

-- Listar produtos com estoque abaixo de 5 unidades
SELECT * FROM Produto WHERE estoque <5; 

-- Consultar todos os pedidos e nome do cliente que fez o pedido
SELECT Pedido.pedido_id, Cliente.nome, Pedido.data_pedido, Pedido.status
FROM Pedido
JOIN Cliente ON Pedido.cliente_id = Cliente.cliente_id;

-- Listar todos os itens de um pedido esprecífico (exemplo pedido_id = 1)
SELECT ItensPedido.quantidade, Produto.nome, ItensPedido.preco
FROM ItensPedido
JOIN Produto ON ItensPedido.produto_id = produto.produto_id
WHERE ItensPedido.pedido_id = 1;

-- Calcular o valor total de um pedido
SELECT pedido_id, SUM(quantidade * preco) AS total_pedido
FROM ItensPedido
WHERE pedido_id = 1
GROUP BY pedido_id;