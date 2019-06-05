use bd_noticias;
DELIMITER $$
CREATE PROCEDURE ProcedureA(out total int)
BEGIN
SELECT count(id_usuario) INTO total FROM usuario ;
END $$;

DELIMITER $$
call ProcedureA(@total);
DELIMITER $$

