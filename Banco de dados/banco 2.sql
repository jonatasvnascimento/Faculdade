CREATE TABLE if not exists clientes (
    codigo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) NULL,
    contato VARCHAR(20) NOT NULL,
    data_nasc DATE NULL,
    sexo CHAR(1) NULL,
    bairo VARCHAR(50) NULL,
    primary key(codigo)
);

# cria colunas em uma tabela
alter table clientes add cod_cidade int null;

#apaga coluna de uma tabela
alter table clientes drop data_nasc;

#adiciona primary key em uma tabela
ALTER TABLE CLIENTE ADD PRIMARY KEY PK_CLIENTE (CODIGO);

#adiciona primar
ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE PRIMARY KEY (CODIGO);
 
 #apaga chave primary
ALTER TABLE CLIENTE DROP PRIMARY KEY;

# chave estrangeira
ALTER TABLE CLIENTE ADD CONSTRAINT FK_CLIENTE_CIDADE FOREIGN KEY (COD_CIDADE) REFERENCES CIDADE(COD_CIDADE);
 
ALTER TABLE                     CLIENTE
DROP FOREIGN KEY       FK_CLIENTE_CIDADE;

#deleta tabela
drop table teste.clientes;

describe clientes;
