CREATE DATABASE Empresa;

USE Empresa;

CREATE TABLE departamento(cod_dep int not null, 
primary key(cod_dep),nome_dep varchar(45),
andar_dep varchar(3), sala_dep int);

DESC departamento;

CREATE TABLE funcionario(mtr_fun INT NOT NULL, PRIMARY KEY(mtr_fun), nm_fun VARCHAR(45), sal_fun DOUBLE, cod_dep int, FOREIGN KEY(cod_dep)REFERENCES departamento(cod_dep));
DESC funcionario;


INSERT INTO funcionario VALUES(303,'RONALDO',2500,103);
INSERT INTO funcionario VALUES(304,'ROBERTO',1000,101);
INSERT INTO funcionario VALUES(305,'ARTHUR',3000,102);
INSERT INTO funcionario VALUES(306,'CARLOS',1000,103);
INSERT INTO funcionario VALUES(307,'DANIEL',2300,101);
INSERT INTO funcionario VALUES(308,'SONARA',2400,102);
INSERT INTO funcionario VALUES(309,'VERONICA',890,103);
INSERT INTO funcionario VALUES(310,'MOISES',5200,101);
INSERT INTO funcionario VALUES(311,'NATALIA',7000,102);
INSERT INTO funcionario VALUES(312,'KEYLA',1300,103);

USE Empresa;
UPDATE funcionario SET sal_fun = 120000 WHERE mtr_fun = 301;
DELETE FROM funcionario WHERE mtr_fun = 301;


SELECT nm_fun, sal_fun FROM funcionario;