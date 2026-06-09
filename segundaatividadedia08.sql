CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(60),
    email VARCHAR(60),
    cidade VARCHAR(30),
    estado CHAR(2),
    data_cadastro DATE
);

INSERT INTO clientes VALUES
(1, 'Marcos Silva', 'marcos@email.com', 'Vargem Alta', 'ES', '2024-01-15'),
(2, 'Julia Santos', 'julia@email.com', 'Cachoeiro', 'ES', '2024-03-22'),
(3, 'Rafael Costa', 'rafael@email.com', 'Vitória', 'ES', '2023-11-10'),
(4, 'Beatriz Lima', 'bia@email.com', 'Vila Velha', 'ES', '2024-05-01'),
(5, 'Lucas Moura', 'lucas@email.com', 'São Paulo', 'SP', '2023-08-30');


CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(50),
    categoria VARCHAR(30),
    preco DECIMAL(8,2),
    estoque INT
);

INSERT INTO produtos VALUES
(101, 'Notebook Dell i5', 'Notebook', 3200.00, 15),
(102, 'Mouse Logitech', 'Periférico', 120.50, 50),
(103, 'Teclado Mecânico', 'Periférico', 350.00, 30),
(104, 'Monitor 24"', 'Monitor', 899.90, 20),
(105, 'Notebook Lenovo i7', 'Notebook', 4500.00, 8);


CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    quantidade INT,
    data_pedido DATE,
    status VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO pedidos VALUES
(1001, 1, 102, 2, '2024-04-10', 'Entregue'),
(1002, 2, 101, 1, '2024-04-12', 'Entregue'),
(1003, 3, 103, 1, '2024-05-05', 'Enviado'),
(1004, 1, 104, 1, '2024-05-20', 'Processando'),
(1005, 4, 102, 3, '2024-05-21', 'Entregue'),
(1006, 5, 105, 1, '2024-02-14', 'Cancelado'),
(1007, 2, 103, 2, '2024-06-01', 'Entregue');


-- 1. Clientes do ES
SELECT nome, email FROM clientes
WHERE estado = 'ES';


-- 2. Produtos caros
SELECT nome_produto, preco FROM produtos
WHERE preco > 1000
ORDER BY preco DESC;


-- 3. Estoque baixo
SELECT nome_produto, estoque FROM produtos
WHERE estoque < 20;


-- 4. Busca por nome
SELECT nome, cidade FROM clientes
WHERE nome LIKE 'M%';


-- 5. Total de produtos
SELECT COUNT(*) AS total_produtos FROM produtos;


-- 6. Pedidos por status
SELECT status, COUNT(*) AS total FROM pedidos
GROUP BY status;