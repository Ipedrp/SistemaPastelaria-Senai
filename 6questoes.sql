#1. Liste os nomes de todos os pastéis veganos vendidos para pessoas com mais de 18 anos#

SELECT nome, FLOOR(DATEDIFF(now(), data_nascimento)/365.25) AS idade, id_pedido FROM clientes
INNER JOIN pedidos ON pedidos.fk_cliente = clientes.id_cliente
INNER JOIN itens_pedidos ON itens_pedidos.fk_pedido = pedidos.id_pedido
WHERE data_nascimento > 18 AND fk_nome_pastel = 10;

SELECT * FROM itens_pedidos;


#2. Liste os clientes com maior número de pedidos realizados em 1 ano agrupados por mês#

SELECT MONTH(data_pedido) AS mes, YEAR(data_pedido) AS ano, id_cliente, nome, COUNT(id_pedido) AS compras FROM pedidos
INNER JOIN clientes ON pedidos.fk_cliente = clientes.id_cliente
WHERE YEAR(pedidos.data_pedido) = 2023 #(2022)#
GROUP BY ano, mes, pedidos.fk_cliente, clientes.nome, clientes.data_nascimento
ORDER BY mes ASC;

SELECT * FROM pedidos;



#3. Liste todos os pastéis que possuem bacon e queijo em seu recheio#

SELECT DISTINCT id_pastel,nome_pastel FROM pasteis
WHERE id_pastel IN (SELECT fk_pastel from recheios_pasteis WHERE fk_recheio IN(1,7) GROUP BY fk_pastel
HAVING COUNT(fk_pastel) = 2);


SELECT * FROM recheios_pasteis;
SELECT * FROM recheios;
SELECT * FROM pasteis;



#4. Mostre o valor de venda total de todos os pastéis cadastrados no sistema#

SELECT SUM(preco_pastel) AS vendaTotalUnidade FROM tamanhos_pasteis;

SELECT * FROM tamanhos_pasteis;


#5. Liste todos os pedidos onde há pelo menos um pastel e uma bebida#

SELECT fk_pedido, fk_nome_pastel, fk_bebida FROM itens_pedidos
GROUP BY fk_pedido
HAVING COUNT(fk_nome_pastel) >= 1 AND COUNT(fk_bebida) >= 1;

SELECT * FROM itens_pedidos;


#6. Liste quais são os pastéis mais vendidos, incluindo a quantidade de vendas em ordem crescente#


SELECT nome_pastel, count(fk_nome_pastel) as vendas FROM itens_pedidos
INNER JOIN pasteis ON pasteis.id_pastel = itens_pedidos.fk_nome_pastel
GROUP BY fk_nome_pastel
HAVING COUNT(fk_nome_pastel) >= 1
ORDER BY COUNT(fk_nome_pastel) ASC;

SELECT * FROM itens_pedidos;

