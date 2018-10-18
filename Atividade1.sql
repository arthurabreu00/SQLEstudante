-- 1.	Relação de placas e modelos dos veículos cuja descrição da marca comece com FIAT.
 SELECT placa_vei, modelo_vei FROM veiculo WHERE marca_vei 
 LIKE ('FIAT%');

-- 2.	Relação alfabética dos nomes e estados dos proprietários dos seguintes estados: MG, SP, RJ.

SELECT nome_prop,estado_prop FROM propietario WHERE estado_prop IN ("MG","SP","RJ");

-- 3.	Relação de todos os dados dos veículos cujo valor do IPVA é 800, em ordem da placa.

SELECT * FROM veiculo WHERE vlrIpva_vei = 800 ORDER BY placa_vei;


-- 4.	Relação dos distintos estados e cidades dos proprietários de veículos, em ordem alfabética de estado e cidade.
SELECT estado_prop AS ESTADO ,cidade_prop AS CIDADE FROM propietario ORDER BY estado_prop,cidade_prop;

-- 5.	Nº de veículos por ano de fabricação em ordem crescente do ano de fabricação.
USE bd_detran
SELECT ano_vei AS 'ANO DO VEICULO',COUNT(ano_vei) AS 'NÚMERO DE VEICULOS' FROM veiculo GROUP BY ano_vei ORDER BY ano_vei;

-- 6.	Somatório dos valores de IPVA de cada proprietário em ordem do código do proprietário.

SELECT id_prop AS 'ID DO PROPRIETARIO', SUM(vlrIpva_vei) AS 'SOMA DO IPVA' FROM veiculo GROUP BY id_prop  ORDER BY id_prop;

-- 7.	Somatório dos valores de IPVA por modelo de veículos, mas apenas para os modelos que tenham mais de 2 veículos.

SELECT modelo_vei AS 'MODELO' , SUM(vlrIpva_vei) AS 'SOMA' FROM veiculo GROUP BY modelo_vei HAVING COUNT(modelo_vei) > 2;

-- 8.	Valor do maior e menor IPVA por ano de fabricação.
SELECT ano_vei AS 'ANO DE FABRICAÇÃO', MAX(vlrIpva_vei) AS 'MAIOR IPVA', MIN(vlrIpva_vei) AS 'MENOR IPVA' FROM veiculo GROUP BY ano_vei  ORDER BY ano_vei;


-- 9.	Relação com placa e modelo dos veículos (em ordem alfabética da placa) onde o ano de fabricação não é 2000 e o valor do IPVA está entre 1150 e 2000 reais.

SELECT placa_vei AS'Placa',modelo_vei AS 'Modelo' FROM veiculo WHERE ano_vei != 2000 AND vlrIpva_vei BETWEEN 1150 AND 2000 ORDER BY placa_vei;


-- 10.	Somatório dos valores de IPVA agrupados por ano de fabricação do veículo, em ordem decrescente do valor do IPVA acumulado.

SELECT ano_vei AS 'Ano de fabricação', SUM(vlrIpva_vei) AS 'Soma do Ipva' FROM veiculo GROUP BY(ano_vei) ORDER BY vlrIpva_vei DESC;

-- 11.	Valor do IPVA médio por modelo.

SELECT modelo_vei AS 'Modelo', AVG(vlripva_vei) AS 'Média'
FROM veiculo GROUP BY(modelo_vei);

-- 12.	Relação dos códigos dos proprietários que tem mais de um veículo.

SELECT id_prop as 'Código propietario', count(id_prop) AS 'Número de veiculos' from VEICULO GROUP BY(id_prop) HAVING Count(id_prop) > 1
ORDER BY SUM(placa_vei);

-- 13.	Relação com todos os dados dos proprietários de veículos de Belo Horizonte.

SELECT * FROM propietario  WHERE cidade_prop = 'Belo Horizonte';

-- 14.	Quantidade de proprietários por cidade.

SELECT cidade_prop AS 'Cidade',COUNT(id_prop) FROM propietario GROUP BY (cidade_prop);

-- 15.	Placa dos veículos fabricados em 2000, 2006, 2010 e 2012, que têm o modelo começando com FORD e o valor do IPVA menor que R$200,00 ou maior do que R$800,00.

SELECT placa_vei AS 'Placa', vlrIpva_vei AS 'Valor' FROM veiculo WHERE id_prop in (2000,2006,2010,2012) AND vlrIpva_vei < 200 OR vlrIpva_vei > 800; 

-- 16.	Relação dos estados que tem menos de 3 proprietários em ordem decrescente do número de proprietários.

SELECT estado_prop AS 'Estado ',COUNT(estado_prop) AS ' Número de propietarios' FROM propietario GROUP BY estado_prop HAVING COUNT(id_prop) < 3 ORDER BY COUNT(id_prop) DESC;

-- 17.	Relação dos nomes dos proprietários do estado de MG e dos modelos de seus veículos, em ordem alfabética do nome do proprietário e do modelo do veículo.

SELECT p.nome_prop AS 'NOME',v.modelo_vei AS 'VEICULO' FROM propietario p INNER JOIN veiculo v ON p.id_prop = v.id_prop GROUP BY(p.id_prop) ORDER BY p.nome_prop,v.modelo_vei;


-- 18.	Somatório do valor do IPVA arrecadado por estado em ordem decrescente do somatório.
USE bd_detran;
SELECT p.estado_prop,SUM(v.vlrIpva_vei) 
FROM propietario p 
INNER JOIN veiculo v 
ON p.id_prop = v.id_prop
GROUP BY(p.estado_prop)  
ORDER BY SUM(v.vlrIpva_vei);

-- 19.	Nº de veículos por cidade, mas apenas para as cidades com mais de 3 veiculos.

SELECT cidade_prop, COUNT(cidade_prop) FROM propietario GROUP BY cidade_prop HAVING COUNT(cidade_prop) > 3;

-- 20.	Relação com o nome de proprietários e quantidade de veículos que cada um possui, mas apenas para os proprietários de mais de um veículo, em ordem decrescente da quantidade de veículos possuídos.

SELECT p.nome_prop,COUNT(v.id_prop) FROM propietario p INNER JOIN veiculo v ON v.id_prop = p.id_prop GROUP BY(v.id_prop); 

-- 21. Ano de fabricação mais recente e mais antigo por cidade em ordem alfabética de cidade.

SELECT p.cidade_prop AS 'Cidade', MAX(v.ano_vei) AS "Mais velho" , MIN(v.ano_vei) AS "Mais Antigo" 
FROM veiculo v NATURAL JOIN propietario p GROUP BY p.cidade_prop ORDER BY p.cidade_prop;

-- 22.	Nº dos distintos anos de fabricação de veículos agrupados por cidade em ordem alfabética.

SELECT p.cidade_prop AS "Cidade", COUNT(v.ano_vei) AS"Nº dos distintos anos de fabricação"FROM propietario p 
NATURAL JOIN veiculo v GROUP BY p.cidade_prop ORDER BY p.cidade_prop ;

