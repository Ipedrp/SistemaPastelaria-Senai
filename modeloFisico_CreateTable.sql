CREATE DATABASE SistemaPastelaria;

USE SistemaPastelaria;

DROP DATABASE SistemaPastelaria;



#  CRIANDO TABELAS #

-- CLIENTE, ENDEREÇO, CONTATO --

CREATE TABLE clientes (
	id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(45) NOT NULL,
    data_nascimento DATE NOT NULL,
    apelido VARCHAR(45) NOT NULL
);

CREATE TABLE enderecos_clientes (
	id_endereco_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(100) NOT NULL,
    uf VARCHAR(10) NOT NULL,
    cep VARCHAR(55) NOT NULL,
    rua VARCHAR(45) NOT NULL,
    logradouro VARCHAR(45) NOT NULL,
	bairro VARCHAR(45) NOT NULL,
	numero INT NOT NULL,
    fk_cliente INT NOT NULL,
    FOREIGN KEY (fk_cliente) REFERENCES clientes(id_cliente)
);


CREATE TABLE contatos_clientes(
	id_contato_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	tipo_contato VARCHAR(45) NOT NULL,
	descricao_contato VARCHAR(45) NOT NULL,
    fk_cliente INT NOT NULL,
    FOREIGN KEY (fk_cliente) REFERENCES Clientes(id_cliente)
);


-- PEDIDOS, PAGAMENTO DOS PEDIDOS, TIPOS DE PAGAMENTO, TIPOS DE ENTREGAS, STATUS PEDIDO --

CREATE TABLE tipos_pagamentos(
	id_tipo_pagamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_pagamento VARCHAR(45) NOT NULL
);

CREATE TABLE status_pedidos(
	id_status_pedidos INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_status VARCHAR(45) NOT NULL,
    ativo CHAR(1) DEFAULT 'S'
);

CREATE TABLE tipos_entregas(
	id_tipo_entrega INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_tipo_entrega VARCHAR(45) NOT NULL,
    ativo CHAR(1) DEFAULT 'S'
);

CREATE TABLE pedidos(
	id_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE NOT NULL,
    fk_tipo_entrega INT NOT NULL,
	fk_cliente INT NOT NULL,
	fk_endereco_cliente INT NOT NULL,
    fk_status_pedido INT NOT NULL,
	FOREIGN KEY (fk_tipo_entrega) REFERENCES tipos_entregas(id_tipo_entrega),
    FOREIGN KEY (fk_cliente) REFERENCES clientes(id_cliente),
	FOREIGN KEY (fk_endereco_cliente) REFERENCES enderecos_clientes(id_endereco_cliente),
	FOREIGN KEY (fk_status_pedido) REFERENCES status_pedidos(id_status_pedidos)
);

CREATE TABLE pagamentos_dos_pedidos(
	id_pagamento_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    valor DOUBLE NOT NULL,
    desconto DOUBLE NULL,
    fk_tipo_pagamento INT NOT NULL,
    fk_pedido INT NOT NULL,
	FOREIGN KEY (fk_tipo_pagamento) REFERENCES tipos_pagamentos(id_tipo_pagamento),
	FOREIGN KEY (fk_pedido) REFERENCES pedidos(id_pedido)
    
);

-- ITENS PEDIDOS, BEBIDAS, PASTEIS, RECHEIOS PASTEIS, CATEGORIAS CASTEIS, TAMANHOS PASTEIS, RECHEIOS, TAMANHOS  --


CREATE TABLE recheios(
	id_recheio INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_recheio VARCHAR(45) NOT NULL,
    ativo CHAR(1) DEFAULT 'S'
);


CREATE TABLE tamanhos(
	id_tamanho INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_tamanho VARCHAR(45) NOT NULL,
    ativo CHAR(1) DEFAULT 'S'
);

CREATE TABLE categorias_pasteis(
	id_categoria_pastel INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_categoria_pastel VARCHAR(45) NOT NULL,
    ativo CHAR(1) DEFAULT 'S'
);

CREATE TABLE pasteis(
	id_pastel INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_pastel VARCHAR(45) NOT NULL,
    fk_categoria_pastel INT NOT NULL,
	FOREIGN KEY (fk_categoria_pastel) REFERENCES categorias_pasteis(id_categoria_pastel)

);

CREATE TABLE recheios_pasteis(
	id_recheio_pastel INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	ativo CHAR(1) DEFAULT 'S',
    fk_recheio INT NOT NULL, 
    fk_pastel INT NOT NULL,
	FOREIGN KEY (fk_recheio) REFERENCES recheios(id_recheio),
	FOREIGN KEY (fk_pastel) REFERENCES pasteis(id_pastel)
);

CREATE TABLE tamanhos_pasteis(
	id_tamanho_pastel INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	ativo CHAR(1) DEFAULT 'S',
    preco_pastel DOUBLE,
    fk_tamanho INT NOT NULL, 
    fk_pastel INT NOT NULL,
	FOREIGN KEY (fk_tamanho) REFERENCES tamanhos(id_tamanho),
	FOREIGN KEY (fk_pastel) REFERENCES pasteis(id_pastel)
);

CREATE TABLE bebidas(
	id_bebida INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome_bebida VARCHAR(45) NOT NULL,
	preco_bebida DOUBLE,
    ativo CHAR(1) DEFAULT 'S'
);

CREATE TABLE itens_pedidos(
	id_item_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_bebida INT NOT NULL,
    fk_nome_pastel INT NOT NULL,
    fk_pedido INT NOT NULL,
    obs VARCHAR(100) NULL,
    FOREIGN KEY (fk_bebida) REFERENCES bebidas(id_bebida),
    FOREIGN KEY (fk_nome_pastel) REFERENCES pasteis(id_pastel),
	FOREIGN KEY (fk_pedido) REFERENCES pedidos(id_pedido)
);















