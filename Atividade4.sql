

CREATE DATABASE atividade1;
USE atividade1;
 CREATE TABLE tb_aluno(
    ra_aluno INT(10), PRIMARY KEY(ra_aluno),
    nome_aluno VARCHAR(50),
    ano_admin_aluno YEAR,
	data_nasc_aluno DATE
);

CREATE TABLE tb_curso(
	cod_curso INT(10), PRIMARY KEY (cod_curso),
    prof_curso VARCHAR(50),
    ano_curso YEAR,
    semestre_curso INT,
    nota_curso FLOAT,
    ra_aluno INT(10), FOREIGN KEY (ra_aluno) REFERENCES tb_aluno(ra_aluno)
);

CREATE TABLE tb_disciplina(
	cod_disc INT(10), PRIMARY KEY(cod_disc),
	nm_disc VARCHAR(50),
    corte_a_disc FLOAT, 
    corte_b_disc FLOAT,
	corte_c_disc FLOAT,
    cod_curso INT(10), FOREIGN KEY (cod_curso) REFERENCES tb_curso(cod_curso)
);

INSERT INTO tb_aluno VALUES(49234,"João",2018,'1982-09-03');
INSERT INTO tb_aluno VALUES(49235,"",2004,'1983-05-19');
INSERT INTO tb_aluno VALUES(49236,"",2004,'1985-11-11');
INSERT INTO tb_aluno VALUES(49237,"",2006,'1982-09-03');
INSERT INTO tb_aluno VALUES(49238,"",2010,'1984-07-16');
INSERT INTO tb_aluno VALUES(49239,"",2019,'1988-10-20');
INSERT INTO tb_aluno VALUES(49240,"",2009,'2000-03-20');
INSERT INTO tb_aluno VALUES(49241,"",2004,'1986-01-02');
INSERT INTO tb_aluno VALUES(49242,"",2003,'1984-08-03');
INSERT INTO tb_aluno VALUES(49243,"",2005,'1981-06-20');

