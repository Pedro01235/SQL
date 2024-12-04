CREATE DATABASE escola;

USE escola;

drop table Aluno;

CREATE TABLE Aluno (
aluno_id INT AUTO_INCREMENT PRIMARY KEY,
nome varchar(100),
idade int,
turma varchar (100)
);

CREATE TABLE Professor ( 
professor_id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
disciplina VARCHAR(100),
);


SELECT * FROM Aluno;

INSERT INTO Aluno (nome, idade, turma) VALUES
('Pedro', '15', '3-A'),
('Mario', '10', '1-A'),
('Ana Clara', '18', '9-A'),
('João', '12', '2-B'),
('Maria', '14', '3-A'),
('Lucas', '16', '4-C'),
('Sofia', '13', '2-B'),
('Gabriel', '11', '1-A'),
('Laura', '17', '5-D'),
('Miguel', '12', '2-B'),
('Beatriz', '15', '3-A'),
('Henrique', '14', '4-C'),
('Alice', '13', '2-B'),
('Guilherme', '11', '1-A'),
('Manuela', '17', '5-D'),
('Arthur', '12', '2-B'),
('Olivia', '15', '3-A'),
('Rafael', '14', '4-C'),
('Evelyn', '13', '2-B'),
('Samuel', '11', '1-A');


SELECT * FROM Aluno WHERE idade <12;

SELECT * FROM Aluno order by nome ASC;

SELECT * FROM Aluno WHERE turma = '1-A';

SELECT COUNT(*) AS Total_de_Alunos FROM Aluno;

SELECT AVG (idade) AS Media_idade FROM Aluno;

SELECT min(idade) FROM Aluno;

SELECT max(idade) FROM Aluno;

SELECT turma, COUNT(aluno_id) AS total_alunos
FROM Aluno
GROUP BY turma
ORDER BY turma;





