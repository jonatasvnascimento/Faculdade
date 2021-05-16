use loja;
create table if not exists cidade(
	cod_cidade int not null auto_increment primary key,
    dcr_cidade varchar(50) not null
);

create table if not exists cliente (
	cod_cliente int not null auto_increment primary key,
    nome varchar(50) not null,
    cpf char(11) null,
    contato varchar(20) not null,
    sexo char(1) null,
    data_nasc date null,
    bairro varchar(50) null
);

alter table cliente add cod_cidade int;
alter table cliente add foreign key(cod_cidade) references cidade(cod_cidade);

create table if not exists compra(
	num_compra int not null auto_increment primary key,
    data_compra date not null,
    vlr_compra float not null,
    est_status varchar(10) not null
);

alter table compra add cod_cliente int null;
alter table compra add foreign key (cod_cliente) references cliente(cod_cliente);

create table if not exists compras(
	cod_compra int not null auto_increment primary key,
    nome_comprador varchar(50) not null,
    data_compra date not null,
    vlr_compra float not null
);
alter table compras add cod_cliente int;
alter table compras add foreign key (cod_cliente) references cliente(cod_cliente);

insert into compras(nome_comprador, data_compra, vlr_compra, cod_cliente) values 
('Renato Nogueira', '2019-03-12', '35.60'   ,'2'),
('Renato Nogueira', '2019-03-21', '120.70'	,'2'),
('Renato Nogueira', '2019-04-25', '81.50'	,'2'),
('Rodrigo Gonçalves', '2019-03-14', '57.80'	,'5'),
('Rodrigo Gonçalves', '2019-04-04', '31.00'	,'5'),
('Vanessa Aquino', '2019-03-16', '23.70'	,'8'),
('Vanessa Aquino', '2019-04-10', '92.50'	,'8');

insert into cidade(dcr_cidade) values
('São Paulo'),
('Rio de Janeiro'),
('Salvador'),
('Manaus'),
('Porto Alegre'),
('Campo Grande');

insert into cliente(nome, cpf, contato, data_nasc, sexo, bairro, cod_cidade) 
values 
('Adriana Araújo',		'01120389921',	'71982213455',	'1987/02/03',	'F', 'Barra' 					,'1'),
('Renato Nogueira',		'98220379931',	'11933321999',	'1977/07/09', 	'M', 'Morumbi'					,'2'),
('Viviane Sales',		'43517386521',	'11987712022',	'1995/11/02',	'F', 'Vila Madalena' 			,'3'),
('Marcela Campos',		'99220377221',	'71973514498',	'1980/01/19',	'F', 'Barra' 					,'2'),
('Rodrigo Gonçalves',	'72177589991',	'21986121942',	'1992/05/10', 	'M', 'Centro' 					,'1'),
('Jorge Marinho',		'83144619976',	'11995439812',	'1990/06/07',	'M', 'Morumbi'  				,'1'),
('Rodrigo Vieira',		'73520421929',	'71972318872',	'1985/08/27',	'M', 'Centro'  					,'1'),
('Vanessa Aquino',		'76211038739',	'21933211346',	'1972/02/15',	'F', 'Centro' 					,'1'),
('Fabiana Moreira',		'31160319971',	'11933216758',	'1985/04/13',	'F', 'Vila Madalena' 			,'1'),
('Maria Conceição',		'82410399921',	'21954419257',	'1999/07/10',	'F', 'Centro' 					,'2'),
('Ana Perkins', 		'46132565894',	'71982213455',	'1989-10-13',	'F', 'Vila Pawnee'  			,'1'),
('Benny Wyatt',			'61345665894',	'11933321999',	'1978-03-20',	'M', 'Captol Hill'  			,'1'),
('Chris Traeger', 		'56482136598',	'11987712022',	'1972-09-18',	'M', 'Vila Healthynut'  		,'5'),
('Jerry Gergich', 		'42365123256',	'71973514498',	'1948-02-29',	'M', 'Centro'  					,'1'),
('Donna Meagle', 		'46213598542',	'21986121942',	'1977-06-14',	'F', 'Condomínio Flórida' 		,'1'),
('Bobby Newport', 		'52315698785',	'11995439812',	'1989-07-04',	'M', 'Vila Richasfâk'  			,'1'),
('Tammy Swanson 2', 	'42135698741',	'71972318872',	'1969-06-19',	'F', 'Vila dos Bibliotecários'  ,'1'),
('Jonnes Swanson 1', 	'41236987541',	'21933211346',	'1929-09-12',	'F', 'Centro'  					,'2'),
('Renato Nogueira',		'46321478965',	'11933216758',	'1965-10-25',	'M', 'City Hall'  				,'2'),
('Rodrigo Gonçalves',	'45231658987',	'21954419257',	'1933-07-04',	'M', 'Morumbi'  				,'3'),
('Vanessa Aquino',		'49512365789',	'21954419257',  '1942-09-05',	'M', 'Morumbi'  				,'2');

select c.nome, c.contato, cid.dcr_cidade from cliente as c inner join cidade as cid on c.cod_cidade = cid.cod_cidade;
#consulta inner join
select c.nome, c.contato, c.cpf, cid.cod_cidade, cid.dcr_cidade from cliente as c inner join cidade as cid on c.cod_cidade = cid.cod_cidade;

#Consulta left join
select 
	c.nome, c.contato,
    c.cod_cidade,
    cid.cod_cidade, 
    cid.dcr_cidade
from
	cliente as c left outer join cidade as cid
on
	c.cod_cidade = cid.cod_cidade;

#consulta right join
select c.nome, c.contato, c.cod_cidade, cid.cod_cidade, cid.dcr_cidade
from cliente as c right outer join cidade as cid
on c.cod_cidade = cid.cod_cidade;

#consulta com valor de not in
select nome from cliente where cod_cliente not in (select cod_cliente from compra);

#selecão com ardenação esquerda order by nome
select c.nome, c.contato, cid.dcr_cidade 
from cliente as c left join cidade as cid 
on c.cod_cidade = cid.cod_cidade
order by c.nome;

#seleção de table direita com order by em decrecente
select c.nome, c.contato, cid.dcr_cidade
from cliente as c right join cidade as cid
on c.cod_cidade = cid.cod_cidade
order by cid.dcr_cidade asc, c.nome desc;

#calcula a quantidade de compras (as depois uma string e o numero da coluna)
select 
	count(*) as "QTDE_Compras",
    sum(vlr_compra) as "SOMA_TOTAL"
from compras;

#contagem suma e valor maximo agrupado por nome
select 
	c.nome,
		count(*) as "QTDE",
		sum(comp.vlr_compra) as "Total",
		max(comp.vlr_compra) as "Maior"
from cliente as c inner join compras as comp
on c.cod_cliente = comp.cod_cliente group by c.nome;

#selecão usando função e com filtro (having)
select 
	c.nome,
		count(*) as "QTDE",
		sum(comp.vlr_compra) as "Total",
		max(comp.vlr_compra) as "Maior"
from cliente as c inner join compras as comp
group by c.nome having sum(comp.vlr_compra) > 100;

# criação de visões
create view compras_cliente as 
select cli.nome, cli.bairro, cli.data_nasc, cli.sexo, cli.cod_cidade, cid.dcr_cidade,cmp.data_compra, cmp.vlr_compra
from cliente as cli inner join compras as cmp on cli.cod_cliente = cmp.cod_cliente
inner join cidade as cid on cli.cod_cidade = cid.cod_cidade;

select * from compras_cliente;

select 
	c.nome,
    c.cpf, comp.vlr_compra ,
    sum(comp.vlr_compra) as "Soma"
from cliente as c inner join compras as comp;

select * from cidade;
select * from cliente;
select * from compras;
