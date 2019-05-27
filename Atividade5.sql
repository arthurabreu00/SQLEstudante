CREATE DATABASE atividade3;
use atividade3;

CREATE TABLE produtos(
	referencia VARCHAR(3) PRIMARY KEY,
    descricao VARCHAR(50),
    estoque INT
);

INSERT INTO Produtos VALUES ('001', 'Feijão', 10);
INSERT INTO Produtos VALUES ('002', 'Arroz', 5);
INSERT INTO Produtos VALUES ('003', 'Farinha', 15);


CREATE TABLE itensVenda(
	venda INT,
    produto varchar(3) REFERENCES produtos(referencia),
    quantidade INT
);


DELIMITER $$
CREATE TRIGGER Tgr_ItensVenda_Insert AFTER INSERT ON itensVenda
FOR EACH ROW
BEGIN
UPDATE Produtos SET Estoque = NEW.quantidade WHERE referencia = NEW.produto;
END$$

CREATE TRIGGER Tgr_ItensVenda_Delete AFTER DELETE on itensVenda
FOR EACH ROW
BEGIN
UPDATE Produtos SET estoque = estoque + OLD.quantidade WHERE referencia = OLD.produto;
END$$

DELIMITER $$
