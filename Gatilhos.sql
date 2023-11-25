CREATE TABLE atualizacao (
    id_atualizao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    mensagem VARCHAR(255),
    data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE  deletados (
    id_deletado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    mensagem  VARCHAR(255),
    data_delecao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM atualizacao;

SELECT * FROM deletados;
#   PRIMEIRA TRIGGER CRIADA  #
# TRIGGER PARA ATUALIZAR PEDIDO#


DELIMITER //
CREATE TRIGGER atualiza_apelido_cliente
BEFORE UPDATE ON clientes
FOR EACH ROW
BEGIN
   
	INSERT INTO atualizacao (mensagem, data_modificacao) VALUES ('Apelido atualizado',CURRENT_TIMESTAMP);

END;
//
DELIMITER ;


SET SQL_SAFE_UPDATES = 0;

UPDATE clientes SET apelido = 'PP' WHERE nome = 'Pedro';


#   SEGUNDA TRIGGER CRIADA  #
# TRIGGER PARA ATUALIZAR NOME PASTEL #


DELIMITER //
CREATE TRIGGER atualiza_nome_pastel
BEFORE UPDATE ON pasteis
FOR EACH ROW
BEGIN
 
	INSERT INTO atualizacao (mensagem, data_modificacao) VALUES ('Nome pastel atualizado', CURRENT_TIMESTAMP);

END;
//
DELIMITER ;

UPDATE pasteis SET nome_pastel = 'Frango top' WHERE id_pastel = 1;

SELECT * FROM pasteis;


#   TERCEIRA TRIGGER CRIADA  #
# TRIGGER PARA ATUALIZAR NOME BEBIDA #

DELIMITER //
CREATE TRIGGER atualiza_nome_bebida
BEFORE UPDATE ON bebidas
FOR EACH ROW
BEGIN
    
	INSERT INTO atualizacao (mensagem, data_modificacao) VALUES ('Nome bebida atualizado', CURRENT_TIMESTAMP);

END;
//
DELIMITER ;

UPDATE bebidas SET nome_bebida = 'Cola_cola ZERO' WHERE id_bebida = 1;

SELECT * FROM bebidas;


#   QUARTA TRIGGER CRIADA  #
# TRIGGER PARA ATUALIZAR TIPO DE CONTATO #

DELIMITER //
CREATE TRIGGER atualiza_tipo_contato_cliente
BEFORE UPDATE ON contatos_clientes
FOR EACH ROW
BEGIN
    
	INSERT INTO atualizacao (mensagem, data_modificacao) VALUES ('Tipo do contato atualizado', CURRENT_TIMESTAMP);

END;
//
DELIMITER ;



UPDATE contatos_clientes SET tipo_contato = 'WhatsApp' WHERE id_contato_cliente = 1;

SELECT * FROM contatos_clientes;



#   QUINTA TRIGGER CRIADA  #
# TRIGGER PARA DELETAR TIPO DE CONTATO #


DELIMITER //
CREATE TRIGGER  delete_tipo_pagamento
BEFORE DELETE ON tipos_pagamentos
FOR EACH ROW
BEGIN

    INSERT INTO deletados (mensagem, data_delecao) VALUES ('Tipo de pagamento deletado',CURRENT_TIMESTAMP );
    
END;
//
DELIMITER ;

DROP TRIGGER delete_tipo_pagamento;

DELETE FROM tipos_pagamentos WHERE id_tipo_pagamento = 1;

SELECT * FROM tipos_pagamentos;



