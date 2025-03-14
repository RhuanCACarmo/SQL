-- Criando o banco de dados
CREATE DATABASE anafit;

-- Criando a primeira tabela
CREATE TABLE cliente (
cpf BIGINT PRIMARY KEY,
primeironome VARCHAR(50) NOT NULL,
sobrenome VARCHAR(50) NOT NULL,
datanasc DATE NOT NULL,
peso DECIMAL(5,2),
altura FLOAT,
whatsapp VARCHAR(15) NOT NULL, 
email VARCHAR(100) UNIQUE,
rua VARCHAR(100) NOT NULL,
numero INT(6) NOT NULL,
complemento VARCHAR(100),
cep VARCHAR(8) NOT NULL
);

--Inserindo dados na tabela de clientes
INSERT INTO cliente(cpf,primeironome,sobrenome,datanasc,peso,altura,whatsapp,email,rua,numero,complemento,cep)
VALUES(12312312312,"Rhuan","Cezar","2006-09-05", 69.70, 1.66, "+55119999999999", "rhuan.cacarmo@senacsp.edu.br","Rua Dr Antônio Bento", 393,"","04750000");

--Crie a tabela treino
CREATE TABLE treino (
diadasemana VARCHAR(7) NOT NULL,
horario TIME NOT NULL,
tipo VARCHAR(50) NOT NULL
);

-- Inserindo dados na tabela de treino
INSERT INTO treino(diadasemana,horario,tipo)
VALUES("Segunda-Feira","15:00", "Pernas"),
      ("Quarta-Feira", "16:30","Musculação");

--Criando novos registros
INSERT INTO cliente(cpf, primeironome, sobrenome, datanasc, peso, altura, whatsapp, email, rua, numero, complemento, cep)
VALUES
(12345678911, 'João', 'Silva', '1990-05-15', 72.30, 1.80, '+5511998765432', 'joao.silva@email.com', 'Rua das Flores', 120, 'Api 301', '01234000'),
(12345678912, 'Maria', 'Oliveira', '1985-10-22', 58.00, 1.65, '+5511987654321', 'maria.oliveira@email.com', 'Avenida Paulista', 1000, 'Bloco B', '01310000'),
(12345678913, 'Carlos', 'Pereira', '1995-07-30', 85.50, 1.90, '+5511987432123', 'carlos.pereira@email.com', 'Rua dos Três Corações', 350, NULL, '01453000'),
(12345678914, 'Beatriz', 'Santos', '2000-02-10', 50.70, 1.70, '+5511976543210', 'beatriz.santos@email.com', 'Rua da Paz', 555, 'Sala 502', '02540000'),
(12345678915, 'Lucas', 'Costa', '1992-11-05', 77.40, 1.78, '+551198764321', 'lucas.costa@email.com', 'Praça da Liberdade', 300, NULL, '03120000');

--Criando uma nova tabela para pagamento
CREATE TABLE pagamento(
id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
valor DECIMAL (5,2) NOT NULL,
data_pagamento DATE NOT NULL,
cpf BIGINT,
FOREIGN KEY (cpf) REFERENCES cliente(cpf)
);

--inserindo registros para pagamento
INSERT INTO pagamento(valor,data_pagamento,cpf)
VALUES(150.00,"2025-03-01",12345678911),	-- Pagamento de João
(200.00,"2025-03-05",12345678912),	      -- Pagamento de Maria
(300.00,"2025-03-10",12345678913),	      -- Pagamento de Carlos
(250.00,"2025-03-02",12345678911),	      -- Outro pagamento de João
(100.00,"2025-03-03",12345678915);	      -- Pagamento de Lucas

--alterar registros de uma linha
UPDATE treino
SET diadasemana = "Terça-Feira"
WHERE tipo = "Pernas" AND diadasemana = "Segunda";

--alterar registros em duas linhas ao mesmo tempo
UPDATE treino
SET horario = "18:00"
WHERE horario IN ("15:00", "16:30");

--alterando dois registros diferente na tabela
UPDATE cliente;
SET peso = 67.7;
WHERE cpf = 12312312312;

--Read - Selecionando todos os dados na tabela
SELECT * FROM treino;

--Selecionando duas colunas ao mesmo tempo
SELECT diadasemana, horario FROM treino;

--Selecionando valores entre dois dados
SELECT * FROM cliente
WHERE datanasc BETWEEN "1992-01-01" AND "2000-12-31";

SELECT * FROM cliente
WHERE peso BETWEEN 66 AND 100;

SELECT * FROM cliente
WHERE peso = 66 OR peso = 100;

--Somar todos os pesos do registros
SELECT SUM(peso) AS soma_peso FROM cliente;

--Contar quantos registros eu tenho na tabela de clientes
SELECT COUNT(*) AS total_registro FROM cliente;

--Selecionando alturas maior que e menor que
SELECT * FROM cliente
WHERE altura > 1.78;

SELECT * FROM cliente
WHERE altura < 1.70;

--Combinando maior que e menor que
SELECT * FROM cliente
WHERE altura > 1.78 OR altura < 1.70;

--Inner Join (Select com chave estrangeira
SELECT
      c.cpf,
      c.primeironome,
      c.sobrenome,
      p.valor,
      p.data_pagamento
FROM
      cliente c
INNER JOIN
      pagamento p ON c.cpf = p.cpf
WHERE 
      c.cpf = 12345678911;

-- Deletando um dado/registro específico na tabela
DELETE FROM treino WHERE tipo = "Musculação";

-- Deletando TODOS os registros da tabela treino
DELETE FROM treino

--Deletar uma tabela
DROP TABLE treino;

DROP TABLE cliente;

--Deletar um banco de dados
DROP DATABASE anafit;
