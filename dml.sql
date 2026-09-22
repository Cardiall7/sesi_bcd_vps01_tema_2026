use estoque_loja;

insert into categoria (id, nome, descricao) values
(1, 'Alimentos', 'Produtos para alimentação'),
(2, 'Limpeza', 'Produtos para limpeza da casa'),
(3, 'Papelaria', 'Materiais escolares e de escritório');

insert into fornecedor (id, razao_social, nome_fantasia, cnpj, telefone, email, endereco) values
(1, 'Alimentos Horizonte Ltda', 'Horizonte', '11.111.111/0001-11', '11911111111', 'horizonte@example.com', 'Rua das Flores 100'),
(2, 'Limpeza Aurora Ltda', 'Aurora', '22.222.222/0001-22', '11922222222', 'aurora@example.com', 'Rua Central 200'),
(3, 'Papelaria Ponto Ltda', 'Ponto', '33.333.333/0001-33', '11933333333', 'ponto@example.com', 'Avenida Brasil 300');

insert into produto (id, nome, descricao, preco, marca, id_categoria, id_fornecedor) values
(1, 'Arroz 1 kg', 'Pacote de arroz branco', 6.50, 'Horizonte', 1, 1),
(2, 'Detergente 500 ml', 'Detergente neutro', 2.80, 'Aurora', 2, 2),
(3, 'Caderno 96 folhas', 'Caderno pautado', 12.90, 'Ponto', 3, 3);

insert into estoque (id_estoque, id_produto, quantidade, quantidade_minima, localizacao) values
(1, 1, 45, 10, 'Prateleira A1'),
(2, 2, 32, 8, 'Prateleira B1'),
(3, 3, 27, 5, 'Prateleira C1');

insert into movimentacao_estoque (id_movimentacao, id_produto, tipo, quantidade, data) values
(1, 1, 'ENTRADA', 50, '2026-09-20 08:00:00'),
(2, 2, 'ENTRADA', 40, '2026-09-20 08:10:00'),
(3, 3, 'ENTRADA', 30, '2026-09-20 08:20:00'),
(4, 1, 'SAIDA', 5, '2026-09-21 10:00:00'),
(5, 2, 'SAIDA', 8, '2026-09-21 11:00:00'),
(6, 3, 'SAIDA', 3, '2026-09-21 14:00:00');