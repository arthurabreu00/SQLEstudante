use bd_noticias;
DELIMITER $$
CREATE PROCEDURE ProcedureC(in mult int)
BEGIN
SELECT mult*10;
END $$;

DELIMITER $$
call ProcedureC(20);
DELIMITER $$

