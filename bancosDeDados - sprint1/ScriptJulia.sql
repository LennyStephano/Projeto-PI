CREATE DATABASE servico;

USE servico;

CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY,
nome VARCHAR(60),
cnpj CHAR(14),
endereco VARCHAR(100),
telefone CHAR(8),
email VARCHAR(200),
qntServidores INT
);

CREATE TABLE funcionario (
idFuncionario INT PRIMARY KEY,
nome VARCHAR(60),
cargo VARCHAR(40),
telefone CHAR(11),
email VARCHAR(200)
);

CREATE TABLE servidor (
idServidor INT PRIMARY KEY,
marca VARCHAR(40),
preco DECIMAL(10,2),
temperatura CHAR(3),
umidade CHAR(3)
);