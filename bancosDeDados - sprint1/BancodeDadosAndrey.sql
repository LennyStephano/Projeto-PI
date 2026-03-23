
create database easyserver;
use easyserver;

create table administrador( 
id_adm int auto_increment primary key,
nome varchar (50)  not null, 
email_adm varchar(40) not null  , 
contato varchar(15),
senha_adm varchar(30) not null  ); 
create table empresa(
id_emp int auto_increment primary key ,
nome_empresa varchar (30) ,
cnpj varchar(20) not null ,
func_responsa varchar (60) not null ,
endereco_empresa varchar(60),
statuse varchar(22) ,constraint chkstatus check  (statuse in ('em preparo','ativo','aguardando resposta') )) auto_increment = 1000;

create table responsavel ( 
id_func int auto_increment primary key,
nome_funcio varchar(60) not null ,
contato_func varchar(15) not null, 
email_func varchar (40) , 
id_emp int );

create table sensor( 
id_sensor int primary key auto_increment, 
nome_sensor varchar(10) not null ,
tipo varchar(11),
valor float ,
sttssensor varchar(12), constraint sensor check (sttssensor in ('ativo','em manutenção','inativo')),
id_servidor int );

create table servidor ( 
id_servidor int auto_increment primary key,
modelo_servidor varchar (100) not null ,
nome_servidor varchar (12) not null , 
id_sensor int,
valor float,
tipo varchar(11),
nome_sensor varchar(10)) ;

insert into administrador values 
(default,'Emilly Luiza','emilly@gmail.com','11978605432','emillyadm'),
(default,'Maria Paula','mariapaula@gmail.com','119657432','mariapaulasds'),
(default,'Julia Lemos','julia@gmail.com','11945432434','juhujl'),
(default,'Thor','thork@gmail.com','1194670987','thor12sd'),
(default,'Lenny','lennysde@gmail.com','11945432098','lenny'),
(default,'Andrey','andreyba@gmail.com','11945472334','andreymns'),
(default,'Daniel Henrique','dahenrique@gmail.com','1195645670','danielskdj');

insert into empresa values 
(default,'LX Man','02349212345439','Leonardo Marques','Rua Manoel Lourdes 340','em preparo'),
(default,'HB CENTER','02349211269879','Juliana Almeida','Rua Leonind Ferras 34','ativo'),
(default,'ALAX','09823432192345','Manoel Pires','Rua Lindes 90','aguardando resposta');

insert into responsavel values 
(default,'Leonardo Marques','11967503421','leo@gmail.com',1),
(default,'Juliana Almeida','11976786543','julia@gmail.com',2) ,
(default,'Manoel Pires','11976789098','manoelpi@gmail.com',3);

insert into sensor values 
(default,'sensor1','temperatura','24','ativo',2),
(default,'sensor1','umidade','20','ativo',2),
(default,'sensor2','temperatura','22','ativo',1),
(default,'sensor2','umidade','30','ativo',1),
(default,'sensor3','temperatura',null ,'inativo',3),
(default,'sensor3','umidade',null,'inativo',3);

insert into servidor values 
(default,'DELL AXB','servidoral',1,'24','temperatura','sensor1'),
(default,'LENOVO A1','servidora','2','22','temperatura','sensor2'),
(default,'MKN','servidorm','3',null,null,'sensor3');

select * from administrador;

select * from sensor 
where sttssensor= 'inativo' or sttssensor='em manutencao';

select * from empresa 
where func_responsa = 'Leonardo Marques';

select * from servidor where nome_sensor = 'sensor1';
