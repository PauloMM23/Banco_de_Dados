#CREATE SCHEMA editora_db;

USE editora_db;

CREATE TABLE Autor (
  idAutor INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (idAutor)
);
  
CREATE TABLE Editora (
  idEditora INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (idEditora)
);

CREATE TABLE Genero (
  idGenero INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (idGenero)
);

CREATE TABLE Livro (
  idLivro INT NOT NULL,
  titulo VARCHAR(45) NOT NULL,
  preco DECIMAL(3) NULL,
  idEditora INT NOT NULL,
  idGenero INT NOT NULL,
  PRIMARY KEY (idLivro),
  CONSTRAINT fk_Livro_Editora
    FOREIGN KEY (idEditora)
    REFERENCES Editora (idEditora)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Livro_Genero
    FOREIGN KEY (idGenero)
    REFERENCES Genero (idGenero)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE Livro_Autor (
  idLivro INT NOT NULL,
  idAutor INT NOT NULL,
  PRIMARY KEY (idLivro, idAutor),
  CONSTRAINT fk_Livro_has_Livro_Autor
    FOREIGN KEY (idLivro)
    REFERENCES Livro (idLivro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Autor_has_Livro_Autor
    FOREIGN KEY (idAutor)
    REFERENCES Autor (idAutor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

drop table Livro_Autor;

CREATE TABLE Ranking (
  idRanking INT NOT NULL,
  dataInicial DATE NOT NULL,
  dataFinal DATE NOT NULL,
  PRIMARY KEY (idRanking)
);

CREATE TABLE Ranking_Semanal (
  idRanking INT NOT NULL,
  idLivro INT NOT NULL,
  posicao DECIMAL(2) NULL,
  quantidadeSemanas DECIMAL(2) NULL,
  semanasConsecutivas DECIMAL(2) NULL,
  posicaoSemanaAnterior DECIMAL(2) NULL,
  PRIMARY KEY (idRanking, idLivro),
  CONSTRAINT fk_Ranking_has_Livro_Ranking
    FOREIGN KEY (idRanking)
    REFERENCES Ranking (idRanking)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Livro_has_Livro_Ranking
    FOREIGN KEY (idLivro)
    REFERENCES Livro (idLivro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

insert into Genero values (1, "Infantil");
insert into Genero values (2, "Ficção");
insert into Genero values (3, "Romance");
insert into Genero values (4, "Auto-ajuda");
insert into Genero values (5, "Negócios");
insert into Genero values (6, "História");

select *
from genero;

insert into Editora values (1, "Ática");
insert into Editora values (2, "Makron Books");
insert into Editora values (3, "Rocco");
insert into Editora values (4, "Scipione");
insert into Editora values (5, "Sagra Luzato");

select *
from editora;

insert into Autor values (1, "Pedro");
insert into Autor values (2, "Marcos");
insert into Autor values (3, "Felipe");
insert into Autor values (4, "Ana");
insert into Autor values (5, "Maria");
insert into Autor values (6, "Francisco");
insert into Autor values (7, "Lucas");

select *
from Autor;

insert into Livro values (1, "A", 25.30, 1, 1);
insert into Livro values (2, "B", 32.45, 1, 4);
insert into Livro values (3, "C", 122.00, 4, 2);
insert into Livro values (4, "D", 100.99, 4, 3);
insert into Livro values (5, "E", 16.16, 1, 5);
insert into Livro values (6, "F", 4.56, 3, 1);
insert into Livro values (7, "G", 85.20, 2, 5);
insert into Livro values (8, "H", 89.90, 5, 5);
insert into Livro values (9, "I", 63.36, 2, 2);
insert into Livro values (10, "J", 41.40, 3, 3);
insert into Livro values (11, "K", 200.30, 4, 6);
insert into Livro values (12, "L", 99.99, 2, 4);

select *
from Livro;

insert into Livro_Autor values (1, 1);
insert into Livro_Autor values (6, 1);
insert into Livro_Autor values (6, 2);
insert into Livro_Autor values (5, 3);
insert into Livro_Autor values (1, 3);
insert into Livro_Autor values (4, 3);
insert into Livro_Autor values (4, 4);
insert into Livro_Autor values (1, 5);
insert into Livro_Autor values (5, 6);
insert into Livro_Autor values (3, 6);
insert into Livro_Autor values (3, 7);
insert into Livro_Autor values (2, 7);

select *
from Livro_Autor;

insert into Ranking values (1, "20030817", "20030823");
insert into Ranking values (2, "20030824", "20030830");
insert into Ranking values (3, "20030831", "20030906");
insert into Ranking values (4, "20030907", "20030913");

select *
from Ranking;

insert into Ranking_Semanal values (1,1,4,6,3,3);
insert into Ranking_Semanal values (2,1,5,7,3,4);
insert into Ranking_Semanal values (3,2,1,1,1,null);
insert into Ranking_Semanal values (4,2,1,2,2,1);
insert into Ranking_Semanal values (1,3,2,2,2,null);
insert into Ranking_Semanal values (2,3,2,3,3,2);
insert into Ranking_Semanal values (3,3,8,4,4,2);
insert into Ranking_Semanal values (4,3,10,5,5,8);
insert into Ranking_Semanal values (1,4,1,50,43,1);
insert into Ranking_Semanal values (2,5,1,1,1,null);
insert into Ranking_Semanal values (3,5,2,2,2,1);
insert into Ranking_Semanal values (4,5,9,3,3,2);
insert into Ranking_Semanal values (4,6,8,1,1,null);
insert into Ranking_Semanal values (3,7,5,1,1,null);
insert into Ranking_Semanal values (4,7,5,2,2,5);
insert into Ranking_Semanal values (1,8,3,13,12,6);
insert into Ranking_Semanal values (2,8,3,14,13,3);
insert into Ranking_Semanal values (3,8,3,15,14,3);
insert into Ranking_Semanal values (4,8,4,16,15,3);
insert into Ranking_Semanal values (2,9,7,1,1,null);
insert into Ranking_Semanal values (3,9,7,2,2,7);
insert into Ranking_Semanal values (1,10,8,4,4,10);
insert into Ranking_Semanal values (2,10,9,5,5,8);
insert into Ranking_Semanal values (3,11,9,1,1,null);
insert into Ranking_Semanal values (1,12,6,3,2,6);

select *
from Ranking_Semanal;

select *
from editora
where editora.nome like "%cc%";


-- Conta quantas tuplas/linhas há na tabela Ranking_Semanal
select count(*)
from Ranking_Semanal;

select count(*)
from Ranking_Semanal
where posicaoSemanaAnterior = posicao;

-- i.Mostre todos os autores cadastrados; 
select * from Autor;

-- ii.Mostre apenas os nomes dos autores;
select nome
from Autor;

-- iii.Mostre o nome e a identificação do autor, nesta ordem;
select nome, idAutor
from Autor;

-- iv.Mostre o nome dos autores que aparecem na tabela Livro_Autor;
select Autor.nome
from Autor, Livro_Autor
where Autor.idAutor = Livro_Autor.idAutor;

select Autor.nome, Livro.titulo
from Autor, Livro, Livro_Autor
where Autor.idAutor = Livro_Autor.idAutor and
	  Livro.idLivro = Livro_Autor.idLivro;

SELECT distinct(Autor.nome)
FROM Autor
INNER JOIN Livro_Autor
ON Autor.idAutor = Livro_Autor.idAutor;

-- v.Mostre o nome dos autores, sem repetição, presentes na tabela Livro_Autor; 
select distinct(Autor.nome)
from Autor, Livro_Autor
where Autor.idAutor = Livro_Autor.idAutor;

-- vi.Mostre os autores em ordem alfabética;
select distinct(Autor.nome)
from Autor, Livro_Autor
where Autor.idAutor = Livro_Autor.idAutor
order by Autor.nome;
#Usar DESC no final de order by Autor.nome para colocar em ordem decrescente

-- vii.Mostre o título dos livros que são da editora Rocco ou da editora Scipione; 
select Livro.titulo, Editora.nome
from Livro, Editora 
where (Editora.nome = "Rocco" or Editora.nome = "Scipione") and Livro.idEditora = Editora.idEditora;

