CREATE DATABASE  atividade2;

use atividade2;

CREATE TABLE tipo_cursos(
	id_tp_curso INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100),
    ativo TINYINT(1)
);

CREATE TABLE disciplina(
	codigo_disciplina VARCHAR(20) PRIMARY KEY,
    nome_disciplina VARCHAR(100),
    corte_a FLOAT,
    corte_b FLOAT,
    corte_c FLOAT
);

CREATE TABLE alunos(
	ra VARCHAR(20) PRIMARY KEY,
    nome_aluno VARCHAR(150),
    ano_admissao INT(11),
    data_nasc DATE
);



CREATE TABLE cursos(
	codigo INT(11) PRIMARY KEY,
	codigo_disciplina VARCHAR(20), FOREIGN KEY(codigo_disciplina) REFERENCES disciplina(codigo_disciplina),
    ra VARCHAR(20), FOREIGN KEY(ra) REFERENCES alunos(ra),
    ano INT(4),
    semestre INT,
    nota float
);

CREATE TABLE tpCurso_Disciplina(
	idTpCurso_discplina INT AUTO_INCREMENT PRIMARY KEY,
	codigo_disciplina VARCHAR(20), FOREIGN KEY(codigo_disciplina) REFERENCES disciplina(codigo_disciplina),
    id_tp_curso INT, FOREIGN KEY(id_tp_curso) REFERENCES tipo_cursos(id_tp_curso),
    dt_inclusao DATETIME
);


INSERT INTO alunos VALUES(49234,"Mauricio",2005,"1986-05-06");
INSERT INTO alunos VALUES(49235,"João",2005,"1988-03-20"); 
INSERT INTO alunos VALUES(49236,"Júlio Cesar",2005,"1985-02-04"); 
INSERT INTO alunos VALUES(49237,"Pamela",2006,"2001-03-05"); 
INSERT INTO alunos VALUES(49238,"José",2007,"2000-09-01"); 

INSERT INTO disciplina VALUES('M0405', "Banco de dados",24,36,60);
INSERT INTO disciplina VALUES('M0406', "Web",24,36,60);
INSERT INTO disciplina VALUES('M0407', "Redes",24,36,60);
INSERT INTO disciplina VALUES('M0408', "Fundamentos de Hardware",24,36,60);
INSERT INTO disciplina VALUES('M0409', "Introdução á administração",24,36,60);
INSERT INTO disciplina VALUES('M0410', "Português Instrumental",24,36,60);

INSERT INTO cursos VALUES(10,"M0405",49234,2005,1,80);
INSERT INTO cursos VALUES(11,"M0406",49234,2005,1,75);
INSERT INTO cursos VALUES(12,"M0407",49234,2005,1,90);
INSERT INTO cursos VALUES(13,"M0408",49234,2005,1,80);
INSERT INTO cursos VALUES(14,"M0405",49235,2005,1,60);
INSERT INTO cursos VALUES(15,"M0406",49235,2005,1,70);
INSERT INTO cursos VALUES(16,"M0407",49235,2005,1,80);
INSERT INTO cursos VALUES(17,"M0408",49235,2005,1,90);
INSERT INTO cursos VALUES(18,"M0405",49236,2005,1,78);
INSERT INTO cursos VALUES(19,"M0406",49236,2005,1,92);
INSERT INTO cursos VALUES(20,"M0407",49236,2005,1,70);
INSERT INTO cursos VALUES(21,"M0408",49236,2005,1,79);
INSERT INTO cursos VALUES(22,"M0409",49237,2006,1,68);
INSERT INTO cursos VALUES(23,"M0410",49237,2006,1,68);

INSERT INTO tipo_cursos(descricao,ativo) VALUES('Informática',1);
INSERT INTO tipo_cursos(descricao,ativo) VALUES('Administração',1);
INSERT INTO tipo_cursos(descricao,ativo) VALUES('Recursos Humanos',1);
INSERT INTO tipo_cursos(descricao,ativo) VALUES('Enfermagem',1);
INSERT INTO tipo_cursos(descricao,ativo) VALUES('Eletrônica',1);


INSERT INTO tpcurso_disciplina(codigo_disciplina,id_tp_curso,dt_inclusao) VALUES('M0405',1,"2005-01-01 00:00");
INSERT INTO tpcurso_disciplina(codigo_disciplina,id_tp_curso,dt_inclusao) VALUES('M0406',1,"2005-01-01 00:00");
INSERT INTO tpcurso_disciplina(codigo_disciplina,id_tp_curso,dt_inclusao) VALUES('M0407',1,"2005-01-01 00:00");
INSERT INTO tpcurso_disciplina(codigo_disciplina,id_tp_curso,dt_inclusao) VALUES('M0408',1,"2005-01-01 00:00");
INSERT INTO tpcurso_disciplina(codigo_disciplina,id_tp_curso,dt_inclusao) VALUES('M0405',5,"2005-01-01 00:00");
INSERT INTO tpcurso_disciplina(codigo_disciplina,id_tp_curso) VALUES('M0409',2);
INSERT INTO tpcurso_disciplina(codigo_disciplina,id_tp_curso,dt_inclusao) VALUES('M0410',2,"2005-01-01 00:00");

-- Selecione o nome dos tipos de curso que não possuem disciplinas cadastradas.

SELECT C.descricao FROM tipo_cursos C LEFT JOIN tpcurso_disciplina A ON C.id_tp_curso = A.id_tp_curso WHERE A.id_tp_curso IS NULL;

-- Selecionar os alunos que estão inscritos no curso de informatica.

SELECT A.*
FROM alunos A
NATURAL JOIN cursos B
NATURAL JOIN disciplina C 
NATURAL JOIN tpcurso_disciplina D
NATURAL JOIN tipo_cursos E
WHERE descricao = 'Eletrônica'
GROUP BY A.ra
;

-- Selecionar a descrição dos tipos de curso e a quantidade de disciplinas vinculadas.

SELECT A.descricao, COUNT(B.codigo_disciplina ) as 'Quantida de disciplinas' FROM tipo_cursos A NATURAL JOIN tpcurso_disciplina B GROUP BY A.id_tp_curso;

-- Selecionar os alunos que estão inscritos no curso de informática e eletronica.

SELECT E.descricao,A.* FROM alunos A
NATURAL JOIN cursos B
NATURAL JOIN disciplina C 
NATURAL JOIN tpcurso_disciplina D
NATURAL JOIN tipo_cursos E
WHERE E.descricao = 'Informática' || E.descricao = 'Eletrônica'
GROUP BY A.ra
;

-- Selecionar o nome da disciplina e o nome do tipo de curso a qual os mesmos estão inseridos.

SELECT D.nome_disciplina,T.descricao 
FROM disciplina D 
INNER JOIN tpcurso_disciplina TP 
INNER JOIN tipo_cursos T
WHERE TP.codigo_disciplina = D.codigo_disciplina AND TP.id_tp_curso = T.id_tp_curso;

-- Selecionar a quantidade de alunos matriculados por tipo de curso.

SELECT 
    T.descricao, COUNT(C.ra) AS 'Número de alunos'
FROM
    cursos C
        INNER JOIN
    disciplina D
        INNER JOIN
    tpcurso_disciplina TP
        INNER JOIN
    tipo_cursos T ON D.codigo_disciplina = C.codigo_disciplina
        AND TP.codigo_disciplina = D.codigo_disciplina
        AND TP.id_tp_curso = T.id_tp_curso
GROUP BY TP.id_tp_curso;


-- Selecionar o nome da disciplina e média das notas dos alunos obtidas

SELECT A.nome_disciplina , AVG(B.nota) AS 'Media das notas'
FROM disciplina A 
INNER JOIN cursos B
ON B.codigo_disciplina = A.codigo_disciplina
GROUP BY A.nome_disciplina;

-- Selecionar o nome da disciplina e média das notas dos alunos obtidas que tenham valor acima de 70%;

SELECT A.nome_disciplina , AVG(B.nota) AS 'Media das notas'
FROM disciplina A 
INNER JOIN cursos B
ON B.codigo_disciplina = A.codigo_disciplina
GROUP BY A.nome_disciplina HAVING AVG(B.nota) >= 70;

-- Selecionar o nome e quantidade de disciplinas cadastradas por tipo de curso.

SELECT A.nome_disciplina, COUNT(B.id_tp_curso) as 'Quantidade de disciplinas'
FROM disciplina A
INNER JOIN tpcurso_disciplina B
ON A.codigo_disciplina = B.codigo_disciplina GROUP BY B.id_tp_curso;

-- Selecionar os nomes os nomes e ra's que nasceram a partir do ano 2000.

SELECT nome_aluno, ra FROM alunos WHERE data_nasc > '2000-01-01';

-- Selecionar os nomes dos alunos com maior e menor média e apresente as respectivas médias.

SELECT A.nome_aluno As 'Nome do aluno', MAX(B.nota) as 'Maior média', MIN(B.nota) as 'Menor média'
FROM alunos A
INNER JOIN cursos B
ON A.ra = B.ra 
GROUP BY B.ra;

-- Selecionar o nome, em ordem crescente, dos alunos que cursaram mais de uma disciplina no ano de 2005.
SELECT A.nome_aluno , B.ano
FROM alunos A
INNER JOIN cursos B
ON A.ra = B.ra
GROUP BY A.ra
HAVING B.ano = 2005 AND COUNT(B.ra) > 2
ORDER BY A.nome_aluno;

-- Selecionar os tipos de cursos que não possuem disciplinas vinculadas.

SELECT DISTINCT a.descricao
FROM tipo_cursos A
LEFT JOIN tpcurso_disciplina B
ON  A.id_tp_curso = b.id_tp_curso
WHERE b.id_tp_curso IS NULL;


-- Selecionar todas as informações sobre as disciplinas  que não possuem alunos matriculados.

SELECT A.*
FROM disciplina A
LEFT JOIN cursos B
ON A.codigo_disciplina = B.codigo_disciplina
WHERE B.ra IS NULL;








