# PRIMEIRA VIEW, VIEW PARA VER O ULTIMO PEDIDO FEITO#


CREATE OR REPLACE VIEW v_ultimo_pedido
AS
SELECT id_pedido as idPedido, data_pedido as dataUltimoPedido, c.nome
FROM pedidos p
JOIN clientes c
ON p.fk_cliente = c.id_cliente
WHERE data_pedido = (SELECT MAX(data_pedido) FROM pedidos);

SELECT * FROM v_ultimo_pedido;

SELECT * FROM pedidos;



# SEGUNDA VIEW, VIEW PARA FAZER UMA ETIQUETA DE ENTREGAS DELIVERY #


CREATE OR REPLACE VIEW v_etiqueta_delivery
AS 
SELECT valor, desconto, nome, id_pedido, data_pedido, fk_tipo_entrega, cidade, 
cep, rua, logradouro, bairro, numero FROM enderecos_clientes
INNER JOIN clientes ON clientes.id_cliente = enderecos_clientes.fk_cliente
INNER JOIN pedidos ON pedidos.fk_cliente = enderecos_clientes.fk_cliente
INNER JOIN pagamentos_dos_pedidos ON pagamentos_dos_pedidos.fk_pedido = pedidos.id_pedido
WHERE fk_tipo_entrega = 1;

SELECT * FROM v_etiqueta_delivery;

SELECT * FROM enderecos_clientes;
SELECT * FROM clientes;
SELECT * FROM pedidos;
SELECT * FROM pagamentos_dos_pedidos;



# TERCEIRA VIEW, CONSULTANDO OS PEDIDOS DE PESSOAS IDOSAS#


CREATE OR REPLACE VIEW v_pessoa_idosa
AS
SELECT id_cliente AS idCliente, nome, FLOOR(DATEDIFF(now(), data_nascimento)/365.25) AS idade
from clientes
HAVING idade >= 60;

SELECT * FROM v_pessoa_idosa;



# QUARTA VIEW, CONSULTANDO OS RECHEIOS DISPONÍVEIS#

CREATE OR REPLACE VIEW v_recheios_disponiveis 
AS
SELECT nome_recheio AS nomeRecheio, ativo
FROM recheios
WHERE ativo = 'S';

SELECT * FROM v_recheios_disponiveis;



# QUINTA VIEW, CONSULTANDO OS PEDIDOS QUE FORAM DE PASTEIS VEGANOS#


CREATE OR REPLACE VIEW v_pedido_vegano
AS
SELECT id_pedido, id_pastel, nome_categoria_pastel AS categoria, ativo,
nome_pastel, obs, nome, id_cliente FROM itens_pedidos
INNER JOIN pasteis ON pasteis.id_pastel = itens_pedidos.fk_nome_pastel
INNER JOIN categorias_pasteis ON categorias_pasteis.id_categoria_pastel = pasteis.fk_categoria_pastel
INNER JOIN pedidos ON pedidos.id_pedido = itens_pedidos.fk_pedido
INNER JOIN clientes ON clientes.id_cliente = pedidos.fk_cliente
WHERE fk_nome_pastel = 10;


SELECT * FROM v_pedido_vegano;

SELECT * FROM itens_pedidos;
SELECT * FROM pasteis;
SELECT * FROM pedidos;
SELECT * FROM itens_pedidos;



# SEXTA VIEW, CONSULTAR OS CLIENTES CADASTRADOS COM NUMERO DE TELEFONE#


CREATE OR REPLACE VIEW v_cadastros_telefone
AS
SELECT c.nome AS nomeCliente, cc.descricao_contato AS Número, tipo_contato as Tipo
FROM clientes c
JOIN contatos_clientes cc
ON c.id_cliente = cc.fk_cliente
WHERE tipo_contato = 'Telefone';

SELECT * FROM v_cadastros_telefone;



# SÉTIMA VIEW, CONSULTAR OS PEDIDOS PAGOS COM PIX#


CREATE OR REPLACE VIEW v_pedidos_pix
AS
SELECT c.nome, p.valor, fk_pedido AS codigoPedido
FROM clientes c
JOIN pagamentos_dos_pedidos p
ON c.id_cliente = p.fk_pedido
WHERE fk_tipo_pagamento = 4;

SELECT * FROM v_pedidos_pix;



# OITAVA VIEW, CONSULTAR OS PEDIDOS COM O STATUS "Finalizado" #


CREATE OR REPLACE VIEW v_pedidos_finalizados
AS
SELECT p.data_pedido AS Dia, s.nome_status as Status, id_pedido as cod_pedido
FROM pedidos p
JOIN status_pedidos s
ON p.fk_status_pedido = s.id_status_pedidos
WHERE fk_status_pedido = 3;

SELECT * FROM v_pedidos_finalizados;



# NONA VIEW, FAZENDO ETIQUETA PARA A COZINHA #


CREATE OR REPLACE VIEW v_etiqueta_cozinha
AS
SELECT id_pedido, nome_categoria_pastel AS categoria,
nome_pastel, obs, nome FROM itens_pedidos
INNER JOIN pasteis ON pasteis.id_pastel = itens_pedidos.fk_nome_pastel
INNER JOIN categorias_pasteis ON categorias_pasteis.id_categoria_pastel = pasteis.fk_categoria_pastel
INNER JOIN pedidos ON pedidos.id_pedido = itens_pedidos.fk_pedido
INNER JOIN clientes ON clientes.id_cliente = pedidos.fk_cliente;

SELECT * FROM v_etiqueta_cozinha;



# DÉCIMA VIEW, VISUALIZAR BEBIDAS DE ATÉ 5 REAIS #


CREATE OR REPLACE VIEW v_bebidas_ate5reais
AS
SELECT nome_bebida AS Descrição, preco_bebida AS Preço
from bebidas
WHERE ativo = 'S'
HAVING preco_bebida <= 5;

SELECT * FROM v_bebidas_ate5reais;



# DÉCIMA PRIMEIRA VIEW, CONSULTA SIMPLIFICADA DE CLIENTE #


CREATE OR REPLACE VIEW v_consulta_simplificada
AS
SELECT c.nome, c.cpf, e.cidade,e.bairro, id_cliente AS codigoCliente
FROM clientes c
JOIN enderecos_clientes e
ON c.id_cliente = e.fk_cliente;

SELECT * FROM v_consulta_simplificada;