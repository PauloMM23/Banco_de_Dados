#Mostrar databases
show databases;

#Usar(ativar) database
use padel_db;

#Mostrar tabelas
show tables;

#Mostra tudo que esta dentro da tabela "jogador"
select *
from jogador;

#Mostra tudo que esta dentro da tabela "torneio"
select *
from torneio;

#Mostra tudo que esta dentro da tabela "jogador_torneio"
select *
from jogador_torneio;

CREATE TABLE Ranking (
  idRanking INT NOT NULL,
  idJogador INT NOT NULL,
  pontos INT NOT NULL,
  PRIMARY KEY (idRanking),
  INDEX `index` (pontos DESC) VISIBLE,
  CONSTRAINT `fk_Ranking_Jogador`
    FOREIGN KEY (idJogador)
    REFERENCES Jogador (idJogador)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

#Mostra tudo que esta dentro da tabela "ranking"
select *
from ranking;

#Deleta a tabela "ranking"
drop table ranking;

#Adiciona a coluna "ano" na tabela "ranking"
ALTER TABLE Ranking
ADD INDEX `IndexAno` (ano DESC) VISIBLE;

#Adicionando atributos na tabela "jogador"
##jogador
INSERT INTO Jogador (idJogador, nome, apelido, posicao)
VALUES (1, 'Luiz Batista', NULL, 'Drive');
##				OU
INSERT INTO Jogador VALUES (2, 'Tobias Vieiro', 'Harris', 'Reves');
INSERT INTO Jogador VALUES (3, 'Guilherme Scalcon', 'Guiga', 'Reves');
INSERT INTO Jogador VALUES (4, 'Victor Bortoluzzi', 'Vitinho', 'Reves');

#Mostra tudo que esta dentro da tabela "jogador"
select *
from jogador;
 
#Adicionando atributos na tabela "torneio"
##torneio
INSERT INTO Torneio VALUES (100, 'StarPadel');
INSERT INTO Torneio VALUES (101, 'Squadra');
INSERT INTO Torneio VALUES (102, 'Clube Dores');

#Mostra tudo que esta dentro da tabela "torneio"
select *
from torneio;


#jogador_torneio


#Adicionando atributos na tabela "ranking"
##ranking
INSERT INTO Ranking (idRanking, idJogador, pontos, ano)
VALUES (1, 1, 100, '2020-12-01');
INSERT INTO Ranking VALUES (2, 2, 10, '2020-12-01');
INSERT INTO Ranking VALUES (3, 2, 70, '2021-12-01');

#Mostra tudo que esta dentro da tabela "ranking"
select *
from ranking;