use bd_noticias;
DELIMITER $$
CREATE PROCEDURE ProcedureB(in limite INT)
BEGIN
SELECT * FROM noticia LIMIT limite;
END $$;

DELIMITER $$

call ProcedureB(10);