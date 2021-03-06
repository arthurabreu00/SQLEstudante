CREATE DATABASE atividade1;
USE atividade1;
 CREATE TABLE tb_aluno(
    ra_aluno INT(10), PRIMARY KEY(ra_aluno),
    nome_aluno VARCHAR(50),
    ano_admin_aluno YEAR,
	data_nasc_aluno DATE
);

CREATE TABLE tb_disciplina(
	cod_disc VARCHAR(10), PRIMARY KEY(cod_disc),
	nm_disc VARCHAR(50),
    corte_a_disc FLOAT, 
    corte_b_disc FLOAT,
	corte_c_disc FLOAT
    
);

CREATE TABLE tb_curso(
	cod_curso int(10) AUTO_INCREMENT, PRIMARY KEY (cod_curso),
    prof_curso VARCHAR(50),
    ano_curso YEAR,
    semestre_curso INT,
    nota_curso FLOAT,
    ra_aluno INT(10), FOREIGN KEY (ra_aluno) REFERENCES tb_aluno(ra_aluno),
    cod_disc  VARCHAR(10), FOREIGN KEY(cod_disc) REFERENCES tb_disciplina(cod_disc)
);

INSERT INTO tb_aluno VALUES(49234,"João",2018,'1982-09-03');
INSERT INTO tb_aluno VALUES(49235,"José",2004,'1983-05-19');
INSERT INTO tb_aluno VALUES(49236,"Roberto",2004,'1985-11-11');
INSERT INTO tb_aluno VALUES(49237,"Carmelo",2006,'1982-09-03');
INSERT INTO tb_aluno VALUES(49238,"JoseP",2010,'1984-07-16');
INSERT INTO tb_aluno VALUES(49239,"Karol",2019,'1988-10-20');
INSERT INTO tb_aluno VALUES(49240,"Manoel",2009,'2000-03-20');
INSERT INTO tb_aluno VALUES(49241,"Zezinho",2004,'1986-01-02');
INSERT INTO tb_aluno VALUES(49242,"Leila",2003,'1984-08-03');
INSERT INTO tb_aluno VALUES(49243,"Ana",2005,'1981-06-20');


INSERT INTO tb_disciplina(
	cod_disc,
    nm_disc,
    corte_a_disc,
    corte_b_disc,
    corte_c_disc
) VALUES('M0405','Informatica Aplicada',8.5,7,5);

INSERT INTO tb_disciplina (
	cod_disc,
    nm_disc,
    corte_a_disc,
    corte_b_disc,
    corte_c_disc
) VALUES('M0446','Banco de Dados',8.4,7,5 );

INSERT INTO  tb_disciplina(
	cod_disc,
    nm_disc,
    corte_a_disc,
    corte_b_disc,
    corte_c_disc
) VALUES('M0625','linguagem de Programação',8.7,7.2,5.4 );

INSERT INTO  tb_disciplina (
	cod_disc,
    nm_disc,
    corte_a_disc,
    corte_b_disc,
    corte_c_disc
) VALUES('M0640','Programação Web',8.5,7,5.4 );

INSERT INTO  tb_disciplina (
	cod_disc,
    nm_disc,
    corte_a_disc,
    corte_b_disc,
    corte_c_disc
) VALUES('M0646','Redes',9,7.5,5.5 );


INSERT INTO tb_curso(cod_disc,prof_curso,ano_curso,semestre_curso,nota_curso,ra_aluno) VALUES ('M0405', 'João Batista', '2005', 2, 7.3, '49234');
INSERT INTO tb_curso(cod_disc,prof_curso,ano_curso,semestre_curso,nota_curso,ra_aluno) VALUES ('M0405', 'João Batista', '2005', '2', '9', '49235');
INSERT INTO tb_curso(cod_disc,prof_curso,ano_curso,semestre_curso,nota_curso,ra_aluno) VALUES ('M0405', 'João Batista', '2005', '2', '6.5', '49236');
INSERT INTO tb_curso(cod_disc,prof_curso,ano_curso,semestre_curso,nota_curso,ra_aluno) VALUES ('M0405', 'María de Jesus', '2006', '1', '8.4', '49236');
INSERT INTO tb_curso(cod_disc,prof_curso,ano_curso,semestre_curso,nota_curso,ra_aluno) VALUES ('M0405', 'María de Jeses', '2006', '1', '8.3', '49234');
INSERT INTO tb_curso(cod_disc,prof_curso,ano_curso,semestre_curso,nota_curso,ra_aluno) VALUES ('M0640', 'María de Jesus', '2006', '1', '6.9', '49234');
INSERT INTO tb_curso(cod_disc,prof_curso,ano_curso,semestre_curso,nota_curso,ra_aluno) VALUES ('M0640', 'María de Jesus', '2006', '1', '8.4', '49235');
INSERT INTO tb_curso(cod_disc,prof_curso,ano_curso,semestre_curso,nota_curso,ra_aluno) VALUES ('M0640', 'Gustavo Freitas', '2004', '1', '7.7', '49235');
INSERT INTO tb_curso(cod_disc,prof_curso,ano_curso,semestre_curso,nota_curso,ra_aluno) VALUES ('M0625', 'Gustavo Freitas', '2004', '2', '4.3', '49234');
INSERT INTO tb_curso(cod_disc,prof_curso,ano_curso,semestre_curso,nota_curso,ra_aluno) VALUES ('M0625', 'Gustavo Freitas', '2004', '2', '8.7', '49234');
INSERT INTO tb_curso(cod_disc,prof_curso,ano_curso,semestre_curso,nota_curso,ra_aluno) VALUES ('M0625', 'Gustavo Freitas', '2004', '2', '9.5', '49235');

-- Selecione o nome das disciplinas que nenhum aluno cursou.
select D.nm_disc
From tb_disciplina D
LEFT JOIN tb_curso C
ON D.cod_disc = C.cod_disc
WHERE C.cod_disc IS NULL;


select D.nm_disc as 'Nome das disciplinas', count(D.nm_disc) as 'Contagem'
From tb_disciplina D, tb_curso C where C.cod_disc = D.cod_disc group by D.nm_disc;

-- Selecione a média das notas que os alunos da disciplina ministradas em 2005 em que essas médias forem superiores a 7.00 e o nome das respectivas disciplinas.
SELECT avg(C.nota_curso) as 'Media dos alunos', D.nm_disc, C.ano_curso from 
tb_curso C, tb_disciplina D group by C.ano_curso having C.ano_curso=2005 and avg(C.nota_curso > 7.00);

-- Selecione os alunos com a menor e maior nota respectivamente e o nome dos mesmo.
SELECT A.nome_aluno, MAX(C.nota_curso) AS 'Nota Máxima', MIN(c.nota_curso) AS 'Nota Minima' FROM tb_aluno A INNER JOIN tb_curso C ON C.ra_aluno = A.ra_aluno;


CREATE TABLE tb_tipo_curso(
	id_tp_curso INT AUTO_INCREMENT, PRIMARY KEY(id_tp_curso),
    desc_tp_curso VARCHAR(100),
    ativo_tp_curso BOOLEAN
);


USE atividade1;

INSERT INTO tb_tipo_curso (desc_tp_curso, ativo_tp_curso) VALUES('Informatica', FALSE);
INSERT INTO tb_tipo_curso (desc_tp_curso, ativo_tp_curso) VALUES('Administração',FALSE);
INSERT INTO tb_tipo_curso (desc_tp_curso, ativo_tp_curso) VALUES('Eletrônica',FALSE);
INSERT INTO tb_tipo_curso (desc_tp_curso, ativo_tp_curso) VALUES('Recursos Humanos',FALSE);
INSERT INTO tb_tipo_curso (desc_tp_curso, ativo_tp_curso) VALUES('Enfermagem',FALSE);



CREATE TABLE tp_curso_disciplina(
	id_tp_curso_disciplina INT AUTO_INCREMENT, PRIMARY KEY(id_tp_curso_disciplina),
	id_tp_curso INT(10), FOREIGN KEY(id_tp_curso) REFERENCES tb_tipo_curso(id_tp_curso),
    cod_disc VARCHAR(10), FOREIGN KEY(cod_disc) REFERENCES tb_disciplina(cod_disc)
);


ALTER TABLE tb_disciplina ADD  id_tp_curso_disciplina INT;
ALTER TABLE tb_disciplina ADD CONSTRAINT  FOREIGN KEY (id_tp_curso_disciplina) REFERENCES tp_curso_disciplina(id_tp_curso_disciplina);

ALTER TABLE tb_curso ADD  id_tp_curso_disciplina INT;
ALTER TABLE tb_curso ADD CONSTRAINT  FOREIGN KEY (id_tp_curso_disciplina) REFERENCES tp_curso_disciplina(id_tp_curso_disciplina);
