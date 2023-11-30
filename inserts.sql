#  REALIZANDO INSERÇÕES  POR PROCEDURE #

CALL cadastrar_cliente('João', '990.535.892-90', '1999-10-10', 'João da mata', 'Feira de Santana', 'BA', '48790-653', 'Rua de baixo', 'Praça', 'Campo Limpo', 99, 'Telefone', '75 9 9987-4758');
CALL cadastrar_cliente('Pedro', '072.870.585-02', '2000-11-11', 'Luan Santana', 'Feira de Santana', 'BA', '48790-653', 'Rua de baixo', 'Praça', 'Campo Limpo', 99, 'Telefone', '75 9 9247-7349');
CALL cadastrar_cliente('Ernandes', '875.365.245-18', '2002-11-11', 'Marmita', 'Santa Barbara', 'BA', '47840-743', 'Rua de rico', 'Praça', 'Alto', 148, 'Instragram', '@ernandesCoutinho');
CALL cadastrar_cliente('Antonio Henrique', '785.965.325-10', '2005-07-07', 'De frente', 'Irará', 'BA', '45478-727', 'Rua de playboy', 'Praça', 'Centro', 10, 'WhatsApp', '75 9 9875-2456');
CALL cadastrar_cliente('Rafael', '745.235.314-10', '2010-12-09', 'Rafa', 'Serrinha', 'BA', '44152-362', 'Rua da matinha', 'Praça', 'Morteiro', 107, 'E-mail', 'rafa12sf@gamil.com');
CALL cadastrar_cliente('José', '746.215.347-14', '1950-05-03', 'Jó', 'Cachoeiro de Itapemirim', 'MG', '29300190', 'Rua Capitão Deslandes', 'Rua', 'Centro', 931, 'E-mail', 'jose123@gmail.com');


SELECT * FROM clientes;
SELECT * FROM enderecos_clientes;
SELECT * FROM contatos_clientes;

#  REALIZANDO INSERÇÕES  POR CADA TABELA #



INSERT INTO recheios (nome_recheio, ativo )
VALUES
('Queijo', 'S'),
('Presunto', 'S'),
('Milho', 'S'),
('Calabresa', 'S'),
('Palmito', 'N'),
('Frango', 'S'),
('Bacon', 'S'),
('Salame', 'S'),
('Peixe', 'S'),
('Camarão', 'S'),
('Cenoura', 'S'),
('Berinjela', 'S'),
('Pepino', 'S'),
('Azeitona', 'S'),
('Cebola', 'S');

SELECT * FROM recheios;

INSERT INTO tamanhos (nome_tamanho, ativo)
VALUES
('Pequeno', 'S'),
('Médio', 'S'),
('Grande', 'S');

SELECT * FROM tamanhos;

INSERT INTO  categorias_pasteis(nome_categoria_pastel, ativo)
VALUES
('Veganos', 'S'),
('Vegetarianos ', 'S'),
('Sem lactose', 'S'),
('Tradicional', 'S');

SELECT * FROM categorias_pasteis;


INSERT INTO pasteis(nome_pastel, fk_categoria_pastel)
VALUES
('Frango', 4 ),
('Frango e queijo', 4),
('Pizza', 4),
('De tudo', 4),
('Calabresa', 4),
('Frango e calabresa', 4),
('Camarão', 4),
('Camarao Playboy', 4),
('Peixe', 4),
('Vegano Brabo', 1);

SELECT * FROM pasteis;

INSERT INTO recheios_pasteis (ativo, fk_recheio, fk_pastel)
VALUES

#Frango
('S', 6, 1),
#Frango e queijo
('S', 1, 2), ('S', 6, 2),
#Pizza
('S', 1, 3),('S', 2, 3),('S', 3, 3),('S', 4, 3),('S', 7, 3),
#De tudo
('S', 1, 4),('S', 2, 4),('S', 3, 4),('S', 5, 4),('S', 6, 4),('S', 7, 4),('S', 8, 4),('S', 9, 4),('S', 11, 4),('S', 12, 4),('S', 13, 4),('S', 14, 4),('S', 15, 4),
#Calabresa
('S', 4, 5),
#Frango e calabresa
('S', 6, 6), ('S', 4, 6),
#Camarão
('S', 10, 7),
#Camarao Playboy
('S', 10, 8), ('S', 1, 8), ('S', 7, 8),
#Peixe
('S', 9, 9),
#Vegano Brabo
('S', 12, 10);

SELECT * FROM recheios_pasteis;

INSERT INTO tamanhos_pasteis (ativo, preco_pastel, fk_tamanho, fk_pastel)
VALUES
('S', 15.00, 3, 1),
('S', 10.00, 2, 2),
('S', 30.00, 3, 4),
('S', 15.00, 3, 3),
('S', 5.00, 1, 5),
('S', 10.00, 2, 6),
('S', 15.00, 3, 7),
('S', 10.00, 2, 8),
('S', 10.00, 2, 9),
('S', 10.00, 2, 10);

SELECT * FROM tamanhos_pasteis;

INSERT INTO bebidas (nome_bebida, preco_bebida, ativo)
VALUES
('Coca-cola', 5, 'S'),
('Fanta Uva', 5, 'S'),
('Guaraná', 5, 'S'),
('Fanta Laranja', 5, 'S'),
('Cerveja Heinekein', 15, 'S'),
('Cerveja Skol', 9, 'S'),
('Água', 3, 'S'),
('Suco Limao', 7, 'S'),
('Suco maracujá', 7, 'S'),
('Suco Acerola', 7, 'S'),
('Suco Goiaba', 7, 'S');

SELECT * FROM bebidas;

# INSERT NAS TABELAS PARA TIPOS DE PAGAMENTO, PAGAEMNTO DOS PEDIDOS, PEDIDOS E STATUS DO PEDIDO #

INSERT INTO  tipos_pagamentos (nome_pagamento)
VALUES
('Cartão Débito'),
('Cartão Crédito'),
('Dinheiro'),
('Pix');

SELECT * FROM tipos_pagamentos;

INSERT INTO status_pedidos(nome_status, ativo)
VALUES
('Preparando', 'S'),
('Pronto para retirada', 'S'),
('Finalizado', 'S');

SELECT * FROM status_pedidos;

INSERT INTO tipos_entregas(nome_tipo_entrega, ativo)
VALUES
('Delivery', 'S'),
('Local', 'S');

SELECT * FROM tipos_entregas;

INSERT INTO pedidos(data_pedido, fk_tipo_entrega ,fk_cliente, fk_endereco_cliente, fk_status_pedido)
VALUES
('2022-10-10', 1, 1, 1, 3),
('2023-10-08', 1, 2, 2, 3),
('2023-11-05', 1, 3, 3, 3),
('2023-11-11', 1, 4, 4, 2),
('2023-07-11', 1, 5, 5, 3),
('2023-08-09', 2, 6, 6, 1),
('2023-09-10', 1, 6, 6, 2),
('2023-10-11', 2, 6, 6, 3);


SELECT * FROM pedidos;

INSERT INTO itens_pedidos(fk_bebida, fk_nome_pastel, fk_pedido, obs)
VALUES
(1, 4, 1, 'Colocar katchup'),
(4, 4, 2, 'Retirar palmito'),
(1, 10, 3, 'Quero caprichado'),
(9, 3, 4, 'Maionese temperada'),
(1, 1, 5, 'Menos sal'),
(3, 10, 6, 'Pouco óleo'),
(6, 3, 7, 'Muito recheio'),
(7, 8, 8, 'Bastante cebola');


SELECT * FROM itens_pedidos;


INSERT INTO pagamentos_dos_pedidos (valor, desconto, fk_tipo_pagamento, fk_pedido)
VALUES
(35, 0, 4, 1),
(35, 0, 4, 2),
(15, 0, 4, 3),
(20, 0, 4, 4),
(20, 0, 4, 5),
(15, 0, 2, 6),
(39, 0, 3, 7),
(13, 0, 4, 8);


SELECT * FROM pagamentos_dos_pedidos
