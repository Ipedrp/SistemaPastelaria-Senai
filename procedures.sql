#  CRIANDO PROCEDURES  #

### CRIANDO PROCEDURE PARA INSERIR O CLIENTE, ENDEREÇO E CONTATO ###

DELIMITER $$
CREATE PROCEDURE cadastrar_cliente (
	IN nome VARCHAR(100),
	IN cpf VARCHAR(45),
    IN idade INT,
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
    INSERT INTO clientes (nome, cpf, idade, apelido)
    VALUES (nome, cpf, idade, apelido);
    
    SET codigo_cliente = LAST_INSERT_ID();
    
    INSERT INTO enderecos_clientes(cidade, uf, cep, rua, logradouro, bairro, numero, fk_cliente)
    VALUES (cidade, uf, cep, rua, logradouro, bairro, numero, codigo_cliente);
    
    INSERT INTO contatos_clientes(tipo_contato, descricao_contato, fk_cliente)
    VALUES (tipo_contato, descricao_contato, codigo_cliente);
    COMMIT;
END;
$$
DELIMITER ;

drop procedure cadastrar_cliente

