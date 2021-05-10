CREATE TABLE IF NOT EXISTS projetos(
	id_projetos INT AUTO_INCREMENT PRIMARY KEY,
    descricao_projeto VARCHAR(300) NOT NULL,
    abreviatura VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS setores(
	id_setor INT AUTO_INCREMENT PRIMARY KEY,
    descricao_setor VARCHAR(300) NOT NULL
);

CREATE TABLE IF NOT EXISTS cargos(
	id_cargo INT AUTO_INCREMENT PRIMARY KEY,
	descricao_cargo VARCHAR(300) NOT NULL,
    salario REAL NOT NULL
);

 ALTER TABLE cargos ADD id_setor INT;
 ALTER TABLE cargos ADD FOREIGN KEY (id_setor) REFERENCES setores(id_setor);
 
 DESCRIBE cargos;
 
CREATE TABLE IF NOT EXISTS empregados(
	id_empregado INT AUTO_INCREMENT PRIMARY KEY,
    nome_empregado VARCHAR(50) NOT NULL
);

ALTER TABLE empregados ADD id_cargo INT;
ALTER TABLE empregados ADD FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo);

DESCRIBE empregados;

CREATE TABLE IF NOT EXISTS alocados(
	id_locacao INT AUTO_INCREMENT PRIMARY KEY,
    id_empregado INT,
    id_projetos INT
);

ALTER TABLE alocados ADD FOREIGN KEY (id_empregado) REFERENCES empregados(id_empregado);
ALTER TABLE alocados ADD FOREIGN KEY (id_projetos) REFERENCES projetos(id_projetos);

DESCRIBE alocados;