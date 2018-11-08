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

-- a)	Selecione o nome , a matrícula e o endereço do sócio para o sócio que tenha a letra A na segunda posição do primeiro nome e qualquer caracteres após.
SELECT nomesoc AS 'NOME', matrsoc AS 'MATRÍCULA',endsoc as 'ENDEREÇO' FROM socio WHERE nomesoc LIKE '%_A%';

-- b)	Selecione o nome da modalidade esportiva e o seu código em ordem alfabética do nome da modalidade esportiva.
SELECT nomemodal AS 'NOME', codmodal AS 'CÓDIGO' FROM modalidade ORDER BY nomemodal;

-- c)	Selecione o nome do sócio e o valor da sua mensalidade em ordem decrescente do valor da mensalidade.
SELECT NOMESOC AS 'NOME' ,VLMENSSOC AS 'VALOR MENSAL' FROM socio ORDER BY VLMENSSOC;

-- d)	Selecione o nome do sócio e o valor da sua mensalidade, para mensalidades com valores entre R$140,00 e R$175,00, em ordem ascendente do nome do sócio.
SELECT NOMESOC AS 'NOME' ,VLMENSSOC AS 'VALOR MENSAL' FROM socio WHERE VLMENSSOC BETWEEN 140.00 AND 175.00 ORDER BY NOMESOC DESC;

-- e)	Selecione o nome do professor e o seu código para o professor formado pela UFMG.
SELECT NOMEPROF AS 'NOME',CODPROF AS 'CODIGO', FACULPROF AS 'FACULDADE' FROM PROFESSOR WHERE FACULPROF = 'UFMG';

-- f)	Selecione o nome do professor e o nome da sua faculdade para faculdade que não sejam UFMG.
SELECT NOMEPROF AS 'NOME',FACULPROF AS 'FACULDADE' FROM PROFESSOR WHERE FACULPROF != 'UFMG';

-- g)	Selecione o nome do sócio e o seu endereço para o sócio nascido fora do estado de Minas Gerais.
SELECT NOMESOC AS 'NOME',ENDSOC AS 'ENDEREÇO', LCLNASCSOC AS 'LOCAL DE NASCIMENTO' FROM socio WHERE LCLNASCSOC != 'MG';

-- h)	Selecione o código e o nome da modalidade esportiva que inicie com a letra F em ordem crescente de código.
SELECT CODMODAL AS 'CÓDIGO', NOMEMODAL AS 'NOME' FROM MODALIDADE WHERE NOMEMODAL LIKE 'F%' ORDER BY CODMODAL;

-- i)	Selecione o nome do professor e o nome da modalidade esportiva que o mesmo pode ministrar aulas.
SELECT 
    P.NOMEPROF AS 'PROFESSOR',
    M.NOMEMODAL AS 'MODALIDADE ESPORTIVA'
FROM
    Professor P
        INNER JOIN
    modalidade M
        INNER JOIN
    formacao F 
		ON F.CODPROF = P.CODPROF
        ON F.CODPROF = M.CODPROF;
        

-- j)	Selecione o número da turma, o nome do professor e o nome da modalidade esportiva na qual esta turma esta cursando.
SELECT T.NUMTUR as 'TURMA', P.NOMEPROF AS 'PROFESSOR', M.NOMEMODAL AS 'MODALIDADE ESPORTIVA' FROM  Professor P INNER JOIN modalidade M INNER JOIN Turma T;