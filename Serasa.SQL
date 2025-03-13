--Crie um banco de dados chamado Serasa, e acrescente a tabela chamada empregado
--com os atributos e registros abaixo:

CREATE DATABASE Serasa;

CREATE TABLE empregado(
codigo INT(5),
nome VARCHAR(50),
depto INT(4),
salario DECIMAL(6,2)
);

INSERT INTO empregado(codigo,nome,depto,salario)
VALUES (43500, 'Ana da Silva', 9411, 5200),
(43501, 'Vitoria Beatriz', 9411, 3400),
(43502, 'Pedro José', 9412, 2600),
(43503, 'Amary Manoel', 9412, 8400),
(43504, 'Carlos Silva', 9412, 5600),
(43505, 'Vitorio Cardoso', 9413, 2300),
(43506, 'Carlos Ives Souza', 9413, 3380),
(43507, 'Victor Silva', 9413, 4500),
(43508, 'Saulo Monteiro', 9413, 6800);

-- Altere o departamento de todos para 9414
UPDATE empregado
SET depto = 9414
WHERE codigo BETWEEN 43500 AND 43508;

-- Altere o departamento dos três primeiros registros para 9415
UPDATE empregado
SET depto = 9415
WHERE codigo BETWEEN 43500 AND 43502;

-- Altere o departamento de cada um para o valor original novamente
UPDATE empregado SET DEPTO = 9411 WHERE CODIGO IN (43500, 43501);
UPDATE empregado SET DEPTO = 9412 WHERE CODIGO IN (43502, 43503, 43504);
UPDATE empregado SET DEPTO = 9413 WHERE CODIGO IN (43505, 43506, 43507, 43508);

-- Select todos para o banco de dados
SELECT * FROM empregado;

-- Realize um Select da coluna nome onde o salário for igual a R$ 6800,00
SELECT * FROM empregado
WHERE salario = 6800;

-- Realize um Select da coluna Codigo e nome onde o salário for igual a R$ 5200,00
SELECT codigo FROM empregado
WHERE salario = 5200; 

-- Realize um Select da coluna DEPTO onde o salário for maior que R$ 3000,00 e menor que R$ 5.500,00
SELECT depto FROM empregado
WHERE salario > 3000.00 AND salario < 5500.00;

-- Realize um Select da coluna Codigo e DEPTO onde o salário estiver entre R$ 2600,00 e R$ 3380,00
SELECT codigo, depto FROM empregado
WHERE salario BETWEEN 2600 AND 3380;

-- Realize um Select da coluna nome onde o DEPTO for 9411 AND 9412
SELECT nome FROM empregado
WHERE depto = 9411 and 9412

-- Realize um Select de DEPTO, Salario e Nome onde o Código for 43500 OR 43502
SELECT depto, salario, nome FROM empregado
WHERE codigo = 43500 and 43502;

-- Realize um Select SUM de todos os salários da tabela
SELECT SUM(salario) FROM empregado;