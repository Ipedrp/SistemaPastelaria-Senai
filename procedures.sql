#  CRIANDO PROCEDURES  #

### CRIANDO PROCEDURE PARA INSERIR O CLIENTE, ENDEREÇO E CONTATO ###

DELIMITER $$
CREATE PROCEDURE cadastrar_cliente (
	IN nome VARCHAR(100),
	IN cpf VARCHAR(45),
    IN data_nascimento DATE,
    IN apelido VARCHAR(45),
	IN cidade VARCHAR(100),
    IN uf VARCHAR(10),
    IN cep VARCHAR(55),
    IN rua VARCHAR(45),
    IN logradouro VARCHAR(45),
	IN bairro VARCHAR(45),
	IN numero INT,
    IN tipo_contato VARCHAR(45),
    IN descricao_contato VARCHAR(45)
)
BEGIN
	DECLARE codigo_cliente INT;
    
    START TRANSACTION;
    INSERT INTO clientes (nome, cpf, data_nascimento, apelido)
    VALUES (nome, cpf, data_nascimento, apelido);
    
    SET codigo_cliente = LAST_INSERT_ID();
    
    INSERT INTO enderecos_clientes(cidade, uf, cep, rua, logradouro, bairro, numero, fk_cliente)
    VALUES (cidade, uf, cep, rua, logradouro, bairro, numero, codigo_cliente);
    
    INSERT INTO contatos_clientes(tipo_contato, descricao_contato, fk_cliente)
    VALUES (tipo_contato, descricao_contato, codigo_cliente);
    COMMIT;
END;
$$
DELIMITER ;


# SEGUNDA PROCEDURE PARA INSERIR TIPO DE PAGAMENTO #


DELIMITER //
CREATE PROCEDURE inserir_tipo_pagamento(
	IN novo_tipo VARCHAR(45)
    )
BEGIN
    -- Inserir um novo tipo de pagamento na tabela
    INSERT INTO tipos_pagamentos (nome_pagamento) VALUES (novo_tipo);
END;
//
DELIMITER ;

CALL inserir_tipo_pagamento('Cartão Débito');


SELECT * FROM tipos_pagamentos;

# TERCEIRA PROCEDURE  PARA INSERIR TIPO DE ENTREGA #


DELIMITER //
CREATE PROCEDURE inserir_tipo_entrega(
	IN novo_tipo VARCHAR(45),
    IN ativo CHAR(1)
    )
BEGIN

    INSERT INTO tipos_entregas (nome_tipo_entrega, ativo) VALUES (novo_tipo, ativo);
    
END;
//
DELIMITER ;

CALL inserir_tipo_entrega('Entrega de drone', 'S');

SELECT * FROM tipos_entregas;


