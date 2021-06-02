create database wm;

use wm;

create table estados(
	id int unsigned not null  auto_increment primary key,
    nome varchar(45) not null,
    sigla varchar(2) not null,
    regiao Enum('Norte', 'Nordeste', 'Centro-Oeste', 'Sudeste', 'Sul') not null,
    populacao decimal(5,2) not null,
    unique key (nome),
    unique key (sigla)
);		

create table if not exists cidades(
	id int unsigned not null auto_increment primary key,
    nome varchar(255) not null,
    estado_id int unsigned not null,
    area decimal(10,2),
    foreign key (estado_id) references estados (id) 
);

create table if not exists teste(
	id int unsigned not null auto_increment primary key
);

create table if not exists prefeitos(
	id int unsigned not null auto_increment primary key,
    nome varchar(255) not null,
    cidade_id int unsigned unique key,
    foreign key (cidade_id) references cidades(id)
);

create table if not exists empresas(
	id int unsigned not null auto_increment primary key,
    nome varchar(255) not null,
    cnpj int unsigned unique
);

create table if not exists empresas_unidades(
	empresa_id int unsigned not null,
    cidade_id int unsigned not null,
    sede tinyint(1) not null,
    primary key(empresa_id, cidade_id)
);

insert into empresas(nome, cnpj) values
('Bradesco', 77991054000190),
('Vale', 35699945000128),
('Cielo', 46502530000139);

insert into empresas_unidades (empresa_id, cidade_id, sede) values
(1,1,1),
(1,2,0),
(2,1,0),
(2,2,1);

alter table empresas modify cnpj varchar(14);

insert into estados (nome, sigla, regiao, populacao) values 
('Acre', 	 'AC', 'Norte',    0.83),
('Alagoas',  'AL', 'Nordeste', 3.38),
('Amazonas', 'AM', 'Norte',    0.8),
('Amapá', 	 'AP', 'Norte',	   4.06),
('Bahia', 'BA', 'Nordeste', 15.34),
('Ceará', 'CE', 'Nordeste', 9.02),
('Distrito Federal', 'DF', 'Centro-Oeste', 3.04),
('Espírito Santo', 'ES', 'Sudeste', 4.02),
('Goiás', 'GO', 'Centro-Oeste', 6.78),
('Maranhao', 'MA', 'Nordeste', 7.00),
('Mato Grosso', 'MT', 'Centro-Oeste', 3.34),
('Mato Grosso do Sul', 'MS', 'Centro-Oeste', 2.71),
('Minas Gerais', 'MG', 'Sudeste', 21.12),
('Pará', 'PA', 'Norte', 8.36),
('Paraíba', 'PB', 'Nordeste', 4.03),
('Parana', 'PR', 'Sul', 11.22),
('Pernambuco', 'PE', 'Nordeste', 9.47),
('Piauí', 'PI', 'Nordeste', 3.22),
('Rio de Janeiro', 'RJ', 'Sudeste', 16.72),
('Rio Grande do Norte', 'RN', 'Nordeste', 3.51),
('Rio Grande do Sul', 'RS', 'Sul', 11.32),
('Rondônia', 'RO', 'Norte', 1.81),
('Roraima', 'RR', 'Norte', 0.52),
('Santa Catarina', 'SC', 'Sul', 7.01),
('São Paulo', 'SP', 'Sudeste', 45.10),
('Sergipe', 'SE', 'Nordeste', 2.29),
('Tocantins', 'TO', 'Norte', 1.55);

insert into estados (id, nome, sigla, regiao, populacao) values
(1111, 'Silent Hill', 'SH', 'Nordeste', 20.29),
(2222, 'Springfield', 'SF', 'Norte', 15.55);

insert into cidades (nome, area, estado_id) values 
('Campinas', 795, 25),
('Niteroi', 133.9, 19);

insert into cidades (nome, area, estado_id) values
('Caruaru', 920.6, (select id from estados where sigla = 'PR')),
('Juazeiro do Norte', 248.2, (select id from estados where sigla = 'CE'));

insert into prefeitos(nome, cidade_id) values
('Rodrigo Neves', 2),
('Raquel Lyra', 3),
('Zaneldo Coutinho', null),
('Rafael Greca', null); 



select * from empresas;
select * from empresas_unidades;
select * from estados;
select * from cidades;
select * from prefeitos;
select sigla, nome, regiao from estados where regiao = 'sul';
select nome, regiao, populacao from estados where populacao >= 10 order by populacao desc;
select nome, sigla from estados where sigla = 'MA';
select nome, populacao, sigla from estados where sigla = 'PR';
select nome, populacao, sigla from estados where sigla = 'SH' or sigla = 'SF';

select 
	regiao,
    sum(populacao) as 'Total'
from estados 
group by regiao
order by Total desc;

select
	e.nome as 'Cidade', 
	c.nome as 'Estado', 
    regiao as 'Região'
from estados as e ,cidades as c
where e.id = c.estado_id;

select
	e.nome as 'Cidade', 
	c.nome as 'Estado', 
    regiao as 'Região'
from estados as e inner join cidades as c on e.id = c.estado_id;

select * from cidades as c inner join prefeitos as p on c.id = p.cidade_id;
select * from cidades as c left join prefeitos as p on c.id = p.cidade_id;
select * from cidades as c right join prefeitos as p on c.id = p.cidade_id;

select * from cidades as c left join prefeitos as p on c.id = p.cidade_id
union
select * from cidades as c right join prefeitos as p on c.id = p.cidade_id;

select e.nome, c.nome
from empresas as e, empresas_unidades as eu, cidades as c
where e.id = eu.empresa_id
and c.id = eu.cidade_id
and sede = 1;

update estados set nome = 'Maranhão' where sigla = 'MA';
update estados set populacao = 11.32 where sigla = 'PR';

delete from estados where sigla = 'SH';
delete from estados where id = '2222';
delete from estados where id >= 1000;
delete from prefeitos where id >= 1;

drop table if exists teste;
drop table if exists prefeitos;




describe estados;
describe cidades;

