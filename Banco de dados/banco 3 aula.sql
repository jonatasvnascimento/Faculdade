
# Criar tabela
CREATE TABLE if not exists clientes (
    codigo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) NULL,
    contato VARCHAR(20) NOT NULL,
    data_nasc DATE NULL,
    sexo CHAR(1) NULL,
    bairro VARCHAR(50) NULL,
    primary key(codigo)
);

use teste;

insert into clientes(nome, cpf, contato, data_nasc, sexo, bairro) 
values 
('Adriana Araújo', '01120389921',	'71982213455',	'1987/02/03',	'F', 'Barra'),
('Renato Nogueira', '98220379931',	'11933321999',	'1977/07/09', 'M', 'Morumbi'),
('Viviane Sales', '43517386521',	'11987712022',	'1995/11/02',	'F', 'Vila Madalena'),
('Marcela Campos', '99220377221',	'71973514498',	'1980/01/19',	'F', 'Barra'),
('Rodrigo Gonçalves', '72177589991', '21986121942','1992/05/10', 'M', 'Centro'),
('Jorge Marinho',	'83144619976', '11995439812',	'1990/06/07',	'M', 'Morumbi'),
('Rodrigo Vieira',	'73520421929', '71972318872',	'1985/08/27',	'M', 'Centro'),
('Vanessa Aquino',	'76211038739', '21933211346',	'1972/02/15',	'F', 'Centro'),
('Fabiana Moreira',	'31160319971', '11933216758',	'1985/04/13',	'F', 'Vila Madalena'),
('Maria Conceição',	'82410399921', '21954419257',	'1999/07/10',	'F', 'Centro');

#update todos os clientes que tem barra para nova barra mas cuidade !!!
update clientes set bairro = 'nova barra' where bairro = 'barra';

#update clientes onde o id e igual a 10
update clientes set bairro = 'nova barra' where codigo = 10;

#deleta todos os registros de uma base mas cuidado
delete from clientes;

#deleta todos os cliente onde são de nova barra
delete from clientes where bairro = 'nova barra';

delete from cliente where codigo = 7;

#traz todos dados de uma tabela
select * from clientes;

#seleciona na planilha com criterio de maior igual em data
select * from clientes where data_nasc >= '1990-01-01';

# seleciona dadfos com o criterio like onde procura o valor dentro do campo
select nome, contato from clientes where nome like '%Viviane%';

#consulta com between para pegar valores de data ate data
select nome, contato, data_nasc from clientes where data_nasc between '1990-01-01' and '1995-12-31 23:59';

# selecionar com criterio 'F'
select nome, contato, data_nasc from clientes where sexo = 'F';

#seleciona dados com and duas condições verdadeiras
select nome, sexo, bairro from clientes where sexo='F' and bairro='barra';

#seleciona dados com or uma condição verdadeira
select nome, data_nasc, sexo from clientes where  data_nasc < '1980-01-01' or sexo = 'M';

#seleciona clientes que não morra na barra
select nome, sexo, bairro from clientes where not(bairro='barra');

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
 
 #apagar chave estrangeira
ALTER TABLE CLIENTE DROP FOREIGN KEY FK_CLIENTE_CIDADE;

#deleta tabela
drop table teste.clientes;

describe clientes;
