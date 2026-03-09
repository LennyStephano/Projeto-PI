CREATE DATABASE easyserver;
USE easyserver;

CREATE TABLE administrador (
    idAdmin INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    cargo VARCHAR(60),
    nivel_acesso VARCHAR(30),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_conta VARCHAR(20) DEFAULT 'ativo'
);

CREATE TABLE usuarios (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    empresa VARCHAR(100),
    setor VARCHAR(80),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_conta VARCHAR(20),
    CONSTRAINT chkstatusConta CHECK (status_conta = 'ativa' OR status_conta = 'inativa')
);

CREATE TABLE sensor (
    idSensor INT AUTO_INCREMENT PRIMARY KEY,
    modelo_sensor VARCHAR(50) NOT NULL,
    tipo_sensor VARCHAR(50),
    ambiente_monitorado VARCHAR(100),
    data_instalacao DATE,
    status_sensor VARCHAR(30),
    CONSTRAINT chkstatus CHECK (status_sensor = 'ativo' OR status_sensor = 'inativo')
);

CREATE TABLE leituras (
    idLeitura INT AUTO_INCREMENT PRIMARY KEY,
    temperatura DECIMAL(5,2) NOT NULL,
    umidade DECIMAL(5,2) NOT NULL,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_temperatura VARCHAR(30),
    CONSTRAINT chkstatusLeituras CHECK (status_temperatura IN('alta','moderada','controlada'))
);

INSERT INTO administrador (nome, email, senha, telefone, cargo, nivel_acesso, status_conta) VALUES 
('Maria', 'maria.paula@sptech.com', '123456', '11987654321', 'Administrador de TI', 'total', 'ativo'),
('Emilly', 'emilly.luiza@sptech.com', '234567', '11976543210', 'Gerente de Infraestrutura', 'alto', 'ativo'),
('Júlia', 'julia.lemos@sptech.com', '345678', '11965432109', 'Supervisor de Sistemas', 'medio', 'ativo'),
('Lenny', 'lenny.stephano@sptech.com', '456789', '11995544321', 'Analista de Infraestrutura', 'medio', 'ativo'),
('Daniel', 'daniel.henrique@sptech.com', '567890', '11994433221', 'Administrador de Sistemas', 'alto', 'ativo'),
('Andrey', 'andrey.brauslauska@sptech.com', '0987654', '11993322110', 'Coordenadora de TI', 'total', 'ativo'),
('Thor', 'thor.secco@sptech.com', '9876543', '11992211009', 'Supervisor de Redes', 'medio', 'inativo');

INSERT INTO usuarios (nome, email, senha, telefone, empresa, setor, status_conta) VALUES
('Juliana Martins', 'juliana.martins@sptech.com', '123456', '11991234567', 'Tech Solutions', 'Infraestrutura', 'ativa'),
('Pedro Henrique', 'pedro.henrique@sptech.com', '234567', '11992345678', 'CloudData', 'Suporte Técnico', 'ativa'),
('Mariana Costa', 'mariana.costa@sptech.com', '345678', '11993456789', 'ServerTech', 'Monitoramento', 'inativa'),
('Lucas Pereira', 'lucas.pereira@sptech.com', '456789', '11994567890', 'DataCore', 'TI', 'ativa'),
('Bruno Almeida', 'bruno.almeida@sptech.com', '567890', '11991111222', 'DataSafe', 'Infraestrutura', 'ativa'),
('Camila Rocha', 'camila.rocha@sptech.com', '098765', '11992222333', 'CloudNet', 'Monitoramento', 'ativa'),
('Larissa Monteiro', 'larissa.monteiro@sptech.com', '987654', '11994444555', 'ServerTech', 'Suporte', 'inativa');

INSERT INTO sensor (modelo_sensor, tipo_sensor, ambiente_monitorado, data_instalacao, status_sensor) VALUES
('DHT11', 'Temperatura e Umidade', 'Sala de Servidores A', '2025-03-10', 'ativo'),
('DHT11', 'Temperatura e Umidade', 'Sala de Servidores B', '2025-03-12', 'ativo'),
('DHT11', 'Temperatura e Umidade', 'Data Center Principal', '2025-03-15', 'ativo'),
('DHT11', 'Temperatura e Umidade', 'Rack de Backup', '2025-03-18', 'inativo'),
('DHT11', 'Temperatura e Umidade', 'Data Center Secundário', '2025-03-23', 'ativo'),
('DHT11', 'Temperatura e Umidade', 'Rack de Armazenamento', '2025-03-24', 'inativo'),
('DHT11', 'Temperatura e Umidade', 'Sala de Monitoramento', '2025-03-25', 'ativo');

INSERT INTO leituras (temperatura, umidade, status_temperatura) VALUES
(22.5, 55.0, 'controlada'),
(25.0, 60.0, 'controlada'),
(28.7, 65.0, 'moderada'),
(31.2, 70.0, 'alta'),
(27.5, 63.0, 'moderada'),
(23.4, 58.0, 'controlada');

select * from usuarios;

SELECT nome, email, empresa FROM usuarios WHERE status_conta = 'ativa';

UPDATE usuarios SET telefone = '11988887777' WHERE idUsuario = 2;

UPDATE sensor SET status_sensor = 'ativo' WHERE idSensor = 4;

ALTER TABLE usuarios ADD COLUMN cidade VARCHAR(80);

