CREATE TABLE clientes (
    codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) NULL,
    contato VARCHAR(20) NOT NULL,
    data_nasc DATE NULL,
    sexo CHAR(1) NULL,
    bairo VARCHAR(50) NULL
);

describe clientes