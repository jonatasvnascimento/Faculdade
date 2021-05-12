create database loja;
use loja;

create table if not exists cidade(
	cod_cidade int not null auto_increment primary key,
    dcr_cidade varchar(50) not null
);

create table if not exists cliente (
    codigo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) NULL,
    contato VARCHAR(20) NOT NULL,
    data_nasc DATE NULL,
    sexo CHAR(1) NULL,
    bairro VARCHAR(50) NULL,
    primary key(codigo)
);

alter table cliente add cod_cidade int;
alter table cliente add foreign key (cod_cidade) references cidade(cod_cidade);

insert into cliente(nome, cpf, contato, data_nasc, sexo, bairro) 
values 
('Adriana Araújo',		'01120389921',	'71982213455',	'1987/02/03',	'F', 'Barra'),
('Renato Nogueira',		'98220379931',	'11933321999',	'1977/07/09', 	'M', 'Morumbi'),
('Viviane Sales',		'43517386521',	'11987712022',	'1995/11/02',	'F', 'Vila Madalena'),
('Marcela Campos',		'99220377221',	'71973514498',	'1980/01/19',	'F', 'Barra'),
('Rodrigo Gonçalves',	'72177589991',	'21986121942',	'1992/05/10', 	'M', 'Centro'),
('Jorge Marinho',		'83144619976',	'11995439812',	'1990/06/07',	'M', 'Morumbi'),
('Rodrigo Vieira',		'73520421929',	'71972318872',	'1985/08/27',	'M', 'Centro'),
('Vanessa Aquino',		'76211038739',	'21933211346',	'1972/02/15',	'F', 'Centro'),
('Fabiana Moreira',		'31160319971',	'11933216758',	'1985/04/13',	'F', 'Vila Madalena'),
('Maria Conceição',		'82410399921',	'21954419257',	'1999/07/10',	'F', 'Centro'),
('Ana Perkins', 		'46132565894',	'71982213455',	'1989-10-13',	'F', 'Vila Pawnee'),
('Benny Wyatt',			'61345665894',	'11933321999',	'1978-03-20',	'M', 'Captol Hill'),
('Chris Traeger', 		'56482136598',	'11987712022',	'1972-09-18',	'M', 'Vila Healthynut'),
('Jerry Gergich', 		'42365123256',	'71973514498',	'1948-02-29',	'M', 'Centro'),
('Donna Meagle', 		'46213598542',	'21986121942',	'1977-06-14',	'F', 'Condomínio Flórida'),
('Bobby Newport', 		'52315698785',	'11995439812',	'1989-07-04',	'M', 'Vila Richasfâk'),
('Tammy Swanson 2', 	'42135698741',	'71972318872',	'1969-06-19',	'F', 'Vila dos Bibliotecários'),
('Jonnes Swanson 1', 	'41236987541',	'21933211346',	'1929-09-12',	'F', 'Centro'),
('Jeremy Ann',			'46321478965',	'11933216758',	'1965-10-25',	'M', 'City Hall'),
('Caiio Gunderson',		'45231658987',	'21954419257',	'1933-07-04',	'M', 'Morumbi'),
('Xaiomi Herzog',		'49512365789',	'21954419257',  '1942-09-05',	'M', 'Morumbi');

insert into cidade(dcr_cidade) values
('São Paulo'),
('Rio de Janeiro'),
('Afonso Cláudio'),
('Água Doce do Norte'),
('Águia Branca'),
('Alegre'),
('Alfredo Chaves'),
('Alto Rio Novo'),
('Anchieta'),
('Apiacá'),
('Aracruz');

#Como recuperar os clientes de determinado sexo e que moram em certo bairro?
select nome, sexo, bairro from cliente where sexo = 'f' or bairro = 'barra';

#Como recuperar os clientes cujo DDD seja de São Paulo (11)?
# like pode trazer contatos que tem dados no meio
select * from cliente where contato like '%11%';
select * from cliente where contato REGEXP '^[11]';

update clientes set bairro = 'nova barra' where bairro = 'barra';
update clientes set bairro = 'Barra Funda' where codigo = 15;

delete from cliente;
delete from cliente where bairro = 'Morumbi';
delete from cliente where codigo = 16;

select * from cliente;
select * from cidade;
select * from cliente where data_nasc >= '1990-01-01';

select nome, contato from cliente where nome like '%Perkins%';
select nome, contato, data_nasc from cliente where data_nasc between '1990-01-01' and '1995-12-31';
select nome, contato, data_nasc from cliente where sexo = 'F';
select nome, sexo, bairro from cliente where sexo='F' and bairro='barra';
select nome, data_nasc, sexo from cliente where  data_nasc < '1980-01-01' or sexo = 'M';
select nome, sexo, bairro from cliente where not(bairro='barra');

alter table cliente drop data_nasc;
alter table cliente ADD PRIMARY KEY id_cliente(CODIGO);
alter table cliente ADD CONSTRAINT id_cliente PRIMARY KEY (CODIGO);
ALTER TABLE cliente ADD CONSTRAINT id_cliente_cidade FOREIGN KEY (cod_cidade) REFERENCES cidade(cod_cidade);
ALTER TABLE cliente DROP FOREIGN KEY id_cliente_cidade;

drop table loja.cliente;
describe cliente;

