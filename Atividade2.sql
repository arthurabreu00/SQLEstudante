CREATE DATABASE Loja;

USE Loja;

CREATE TABLE cliente(
    cod_cli INT NOT NULL AUTO_INCREMENT, 
    PRIMARY KEY(cod_cli),
    nome_cli VARCHAR(45),
    tel_cli VARCHAR(13)
    );

ALTER TABLE `cliente`
    AUTO_INCREMENT=100;

CREATE TABLE produto(
    cod_prod INT NOT NULL,  
    PRIMARY KEY(cod_prod),
    nome_prod VARCHAR(45),
    vlr_prod FLOAT,
    qnt_prod INT);

CREATE TABLE pedido(cod_ped INT NOT NULL ,PRIMARY KEY(cod_ped), 
vlr_pedido FLOAT, dt_pedido DATE, hr_pedido TIME, cod_prod INT,
FOREIGN KEY(cod_prod)REFERENCES produto(cod_prod));

CREATE TABLE nota_fiscal(cod_nota INT NOT NULL, PRIMARY KEY(cod_nota), vlr_nota 
FLOAT, dt_nota DATE, hr_nota TIME,cod_ped INT, 
FOREIGN KEY(cod_ped)REFERENCES pedido(cod_ped));

INSERT INTO cliente VALUES(103,'Jose','98277-3737');
DELETE FROM `cliente` WHERE id_cli = 102;