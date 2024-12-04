CREATE DATABASE vendas_loja;

DROP TABLE venda;
USE vendas_loja;

CREATE TABLE venda (
id_venda INT AUTO_INCREMENT PRIMARY KEY,
cliente VARCHAR(100),
produto VARCHAR(50),
quantidade INT,
preco_unitario DECIMAL (10, 2),
data_venda DATE
);


INSERT INTO venda (id_venda, cliente, produto, quantidade, preco_unitario, data_venda)
VALUES 
(1, 'João Silva', 'Notebook', 1, 4500, '2023-11-01'),
(2, 'Maria Oliveira', 'Smartphone', 2, 2500, NULL),
(3, 'Ana Souza', 'Notebook', 1, 4500, '2023-11-05'),
(4, 'João Silva', 'Tablet', 3, 1200, '2023-10-20'),
(5, NULL, 'Smartphone', NULL, 2500, '2023-10-25'),
(6, 'Carlos Mendes', 'Tablet', 2, 1200, '2023-11-10'),
(7, 'Luciana Santos', 'Cadeira Gamer', 1, 1500, '2023-11-12'),
(8, 'Ricardo Pereira', 'Fone de Ouvido', 5, 200, '2023-11-13'),
(9, 'Beatriz Costa', 'Teclado', 2, 350, '2023-11-14'),
(10, 'Carlos Oliveira', 'Notebook', 1, 4500, '2023-11-15'),
(11, 'Paula Mendes', 'Smartwatch', 1, 1000, '2023-11-16'),
(12, 'Juliana Lima', NULL, 2, 1500, '2023-11-17'),
(13, 'Felipe Almeida', 'Câmera Digital', 1, 2500, NULL),
(14, 'Roberto Souza', 'Mouse', NULL, 150, '2023-11-18'),
(15, 'Daniele Martins', 'Notebook', 1, 4000, '2023-11-19'),
(16, 'Andreia Silva', 'Teclado', 1, 350, '2023-11-20'),
(17, 'Lucas Silva', 'Cadeira Gamer', 3, 1200, '2023-11-21'),
(18, 'Fernanda Barbosa', 'Smartphone', 1, 2500, '2023-11-22'),
(19, 'Roberta Costa', 'Smartwatch', 2, 1000, '2023-11-23'),
(20, 'Pedro Oliveira', 'Fone de Ouvido', 4, 200, '2023-11-24'),
(21, 'João Silva', 'Tablet', 3, 1200, '2023-11-25'),
(22, 'Lucas Pereira', 'Smartphone', 1, 2200, NULL),
(23, 'Carla Santos', 'Notebook', 1, 4500, '2023-11-26'),
(24, 'Gabriel Mendes', NULL, NULL, NULL, NULL),
(25, 'Eduardo Costa', 'Teclado', 1, NULL, '2023-11-27'),
(26, 'Tatiane Oliveira', 'Câmera Digital', 1, 2500, '2023-11-28'),
(27, 'José Ferreira', 'Smartphone', 3, 2500, '2023-11-29'),
(28, 'Sofia Almeida', 'Notebook', 2, 4500, '2023-11-30'),
(29, 'Mário Silva', 'Mouse', 2, 150, '2023-12-01'),
(30, 'Luciana Costa', 'Tablet', 1, 1200, '2023-12-02');

SELECT * FROM venda;

-- LIMPEZA E TRATAMENTO DE DADOS

SELECT * FROM venda WHERE cliente IS NULL OR quantidade IS NULL OR produto IS NULL or preco_unitario IS NULL OR data_venda is NULL;

DELETE FROM venda WHERE cliente IS NULL OR quantidade IS NULL OR produto IS NULL or preco_unitario IS NULL OR data_venda is NULL;

ALTER TABLE venda ADD COLUMN valor_total DECIMAL(10, 2);

UPDATE venda SET valor_total = quantidade * preco_unitario;

SELECT * FROM venda;