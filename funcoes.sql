# CRIANDO FUNÇÕES #

/* CRIANDO FUNÇÃO PARA RETORNAR A SIGLA DO ESTADO */

SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER //
CREATE FUNCTION  buscar_sigla_estado(id_endereco_cliente INT)
RETURNS  VARCHAR(10) 
BEGIN
	DECLARE resultado VARCHAR(10) ;
    SELECT 	distinct uf INTO resultado FROM enderecos_clientes WHERE id_endereco_cliente = id_endereco_cliente;
    RETURN resultado;
END;
//
DELIMITER ;


### INVOCANDO A FUNÇÃO ###
SELECT buscar_sigla_estado(2) as sigla;

#-------------------------------------------------------#

/* CRIANDO FUNÇÃO PARA RETORNAR A IDADE DO SEGUNDO ID (ID - 2) */

SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$

CREATE FUNCTION buscar_idade(id_cliente INT)
RETURNS DECIMAL(10,0)
BEGIN
    DECLARE resultado DECIMAL(10,0);

    SELECT DATEDIFF(NOW(), data_nascimento) / 365.3 INTO resultado
    FROM clientes
    WHERE id_cliente = id_cliente
    LIMIT 1;

    RETURN resultado;
END;

$$

DELIMITER ;

drop function buscar_idade;

### INVOCANDO A FUNÇÃO ###
SELECT buscar_idade(2) as idade_cliente;

#-------------------------------------------------------#

/* CRIANDO FUNÇÃO PARA RETORNAR A SOMA DE TODAS AS BEBIDAS  */

DELIMITER //

CREATE FUNCTION calcular_soma_precos()
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE soma DECIMAL(10,2);

    SELECT SUM(preco_bebida) INTO soma
    FROM bebidas;

    RETURN soma;
END //

DELIMITER ;

### INVOCANDO A FUNÇÃO ###

SELECT * FROM bebidas;

SELECT calcular_soma_precos();

#-------------------------------------------------------#