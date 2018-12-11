CREATE DATABASE EscolaEsporte;
USE EscolaEsporte;
 CREATE TABLE Socio(
    MATRSOC FLOAT, PRIMARY KEY(MATRSOC),
    NOMESOC VARCHAR(45),
    ENDSOC VARCHAR(45),
    VLMENSSOC FLOAT,
    LCLNASCSOC VARCHAR(2),
    DTNASCSOC VARCHAR(12)
);

CREATE TABLE Modalidade(
	CODMODAL INT, PRIMARY KEY(CODMODAL),
	NOMEMODAL VARCHAR(45)
);

CREATE TABLE Curso(
    CODCURSO VARCHAR(5), PRIMARY KEY(CODCURSO),
    DURDIARCURSOF INT,
    CODMODAL INT ,FOREIGN KEY(CODMODAL) REFERENCES Modalidade(CODMODAL));

CREATE TABLE Professor(
    CODPROF INT, PRIMARY KEY(CODPROF),
    NOMEPROF VARCHAR(45),
    ENDPROF VARCHAR(45),
    FACULPROF VARCHAR(20)
);

CREATE TABLE Turma(
    NUMTUR INT, PRIMARY KEY(NUMTUR),
    MATRSOC FLOAT, FOREIGN KEY(MATRSOC) REFERENCES Socio(MATRSOC),
    CODCURSO VARCHAR(5) ,FOREIGN KEY(CODCURSO) REFERENCES Curso(CODCURSO),
    CODPROF INT, FOREIGN KEY(CODPROF) REFERENCES Professor(CODPROF)
);

CREATE TABLE Formacao(
    CODPROF INT, FOREIGN KEY(CODPROF) REFERENCES Professor(CODPROF),
    CODMODAL INT,FOREIGN KEY(CODMODAL) REFERENCES Modalidade(CODMODAL)
);

-- ALTER TABLE escolaesporte.socio MODIFY COLUMN DTNASCSO VARCHAR(12);

INSERT INTO socio VALUES(16.541,"Gabriel Moreira",'Rua Pires – 41',130.00,'MG','22/09/1975');
INSERT INTO socio VALUES(19.841,"Paulo Carlos Soares",'Rua Afonso – 26',164.00,'MG','25/09/1971');
INSERT INTO socio VALUES(25.362,"Juarez Matos",'Rua Nova – 132',159.00,'MG','17/11/1977');
INSERT INTO socio VALUES(30.147,"Marcos Santos",'Rua Quatro – 25',150.00,'SP','20/03/1984');
INSERT INTO socio VALUES(40.251,"Carolina Silva",'Av. Vinho – 625',180.00,'ES','13/10/1974');
INSERT INTO socio VALUES(50.126,"Marília Almeida",'Rua Trinta – 14',120.00,'MG','26/05/1966');

INSERT INTO professor VALUES(025,"Cristina Santos Gomide","Av. Horizonte – 150 ","USP");
INSERT INTO professor VALUES(031,"Paulo Rogério Moura","Rua Cristal – 564","UFMG");
INSERT INTO professor VALUES(041,"Marcelo Araújo","Av. Rabelo – 215","USP");
INSERT INTO professor VALUES(074,"Paula Gomes","Rua Mármore – 25","UFVC");
INSERT INTO professor VALUES(095,"Vanessa Rodrigues","Av. Branca – 78","UFMG");
INSERT INTO professor VALUES(105,"Fabrício Marques","Rua Vila Verde  – 94","UNICAMP");
INSERT INTO professor VALUES(124,"Cristiano Manoel Gomes","Rua Paracatu – 656","UFMG");

INSERT INTO modalidade VALUES(00121,'Volley');
INSERT INTO modalidade VALUES(00187,"Futebol de Areia");
INSERT INTO modalidade VALUES(00214,"Basquete");
INSERT INTO modalidade VALUES(00312,"Natação");
INSERT INTO modalidade VALUES(00412,'Futebol de Salão');
INSERT INTO modalidade VALUES(00541,'Peteca');
INSERT INTO modalidade VALUES(00654,'Handboll');

INSERT INTO curso VALUES("BA001",02,00214);
INSERT INTO curso VALUES("FA001",02,00187);
INSERT INTO curso VALUES("FS001",02,00412);
INSERT INTO curso VALUES("NA001",01,00312);
INSERT INTO curso VALUES("PE001",02,00541);
INSERT INTO curso VALUES("VO001",02,00121);

INSERT INTO turma VALUES(0120,16.541,'FA001',105);
INSERT INTO turma VALUES(0625,19.841,'BA001',124);
INSERT INTO turma VALUES(0451,25.362,'PE001',095);
INSERT INTO turma VALUES(0524,30.147,'FS001',031);
INSERT INTO turma VALUES(0321,40.251,'NA001',025);
INSERT INTO turma VALUES(0251,50.126,'VO001',074);

INSERT INTO formacao VALUES(025,00312);
INSERT INTO formacao VALUES(031,00187);
INSERT INTO formacao VALUES(031,00412);
INSERT INTO formacao VALUES(041,00654);
INSERT INTO formacao VALUES(074,00121);
INSERT INTO formacao VALUES(074,00541);
INSERT INTO formacao VALUES(095,00541);
INSERT INTO formacao VALUES(105,00187);
INSERT INTO formacao VALUES(124,00214);

use EscolaEsporte;

-- a)	Selecione o nome , a matrícula e o endereço do sócio para o sócio que tenha a letra A na segunda posição do primeiro nome e qualquer caracteres após.
SELECT nomesoc, MATRSOC , ENDSOC from escolaesporte.socio WHERE nomesoc Like '_A%';

-- b)Selecione o nome da modalidade esportiva e o seu código em ordem alfabética do nome da modalidade esportiva.

SELECT nomemodal, CODMODAL FROM modalidade ORDER BY nomemodal;

-- c)	Selecione o nome do sócio e o valor da sua mensalidade em ordem decrescente do valor da mensalidade.

SELECT nomesoc, VLMENSSOC FROM socio order by VLMENSSOC desc;

-- d)	Selecione o nome do sócio e o valor da sua mensalidade, para mensalidades com valores entre R$140,00 e R$175,00, em ordem ascendente do nome do sócio.
SELECT nomesoc, VLMENSSOC FROM socio WHERE VLMENSSOC BETWEEN 140 AND 175 ORDER BY nomesoc desc;

-- e)	Selecione o nome do professor e o seu código para o professor formado pela UFMG.

SELECT nomeprof, codprof, faculprof FROM professor WHERE  ACULPROF = 'UFMG';

-- f)	Selecione o nome do professor e o nome da sua faculdade para faculdade que não sejam UFMG.
SELECT nomeprof, codprof,FACULPROF FROM professor WHERE FACULPROF != 'UFMG';

-- g)	Selecione o nome do sócio e o seu endereço para o sócio nascido fora do estado de Minas Gerais.

SELECT nomesoc, ENDSOC FROM socio WHERE LCLNASCSOC != 'MG';

-- h) Selecione o código e o nome da modalidade esportiva que inicie com a letra F em ordem crescente de código.

SELECT CODMODAL, NOMEMODAL FROM modalidade WHERE nomemodal like 'F%' ORDER BY CODMODAL;

-- i)	Selecione o nome do professor e o nome da modalidade esportiva que o mesmo pode ministrar aulas.

SELECT NOMEPROF AS 'Nome Do Professor', NOMEMODAL AS 'Nome Da Modalidade' FROM professor p, modalidade m INNER JOIN formacao f WHERE p.CODPROF = f.CODPROF AND m.CODMODAL = f.CODMODAL;

-- j)	Selecione o número da turma, o nome do professor e o nome da modalidade esportiva na qual esta turma esta cursando.

USE escolaesporte;

SELECT t.numtur, p.nomeprof, m.nomemodal 
FROM turma t 
INNER JOIN professor p 
INNER JOIN modalidade m
INNER JOIN formacao f
ON p.codprof = t.codprof 
AND t.codprof = f.codprof
AND f.CODMODAL = m.CODMODAL;

-- k)	Selecione o código do curso, duração diária do curso e o nome da modalidade esportiva deste curso para a modalidade esportiva que tenha a letra T na terceira posição do nome e quaisquer outros caracteres após.

SELECT CODCURSO AS 'Codigo do curso', DURDIARCURSO AS 'Duração do curso', NOMEMODAL AS 'Nome modalidade'  FROM curso c NATURAL JOIN modalidade m WHERE NOMEMODAL LIKE '__t%';

-- l)	Selecione o código do curso, o número da turma e o nome do sócio que está freqüentando 
-- esta turma em ordem alfabética do nome do sócio, alterando as colunas do resultado para : 
-- Curso, Turma e Sócio respectivamente.

USE escolaesporte;
SELECT c.CODCURSO, t.numtur, s.nomesoc 
FROM curso c 
INNER JOIN turma t
INNER JOIN socio s
ON c.CODCURSO = t.CODCURSO AND t.MATRSOC = s.MATRSOC
