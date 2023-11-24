#  REALIZANDO INSERÇÕES  #

CALL cadastrar_cliente('João', '990.535.892-90', 25, 'João da mata', 'Feira de Santana', 'BA', '48790-653', 'Rua de baixo', 'Praça', 'Campo Limpo', 99, 'Telefone', '75 9 9987-4758');
CALL cadastrar_cliente('Pedro', '072.870.585-02', 22, 'Luan Santana', 'Feira de Santana', 'BA', '48790-653', 'Rua de baixo', 'Praça', 'Campo Limpo', 99, 'Telefone', '75 9 9247-7349');
CALL cadastrar_cliente('Ernandes', '875.365.245-18', 20, 'Chato pra caralho0', 'Santa Barbara', 'BA', '47840-743', 'Rua de rico', 'Praça', 'Alto', 148, 'Instragram', '@ernandesCoutinho');
CALL cadastrar_cliente('Antonio Henrique', '785.965.325-10', 18, 'De frente', 'Irará', 'BA', '45478-727', 'Rua de playboy', 'Praça', 'Centro', 10, 'WhatsApp', '75 9 9875-2456');
CALL cadastrar_cliente('Rafael', '745.235.314-10', 10, 'RAFA', 'Serrinha', 'BA', '44152-362', 'Rua da matinha', 'Praça', 'Morteiro', 107, 'E-mail', 'rafa12sf@gamil.com');

SELECT * FROM clientes;
SELECT * FROM enderecos_clientes;
SELECT * FROM contatos_clientes;