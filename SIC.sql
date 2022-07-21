
create database SIC;

use SIC;

create table Ranking (Ranking_id integer not null auto_increment, Ranking_descricao varchar(20), primary key (Ranking_id));

insert into Ranking (Ranking_descricao) values ("Trainee"); 
insert into Ranking (Ranking_descricao) values ("Junior"); 
insert into Ranking (Ranking_descricao) values ("Pleno");
insert into Ranking (Ranking_descricao) values ("Senior");
insert into Ranking (Ranking_descricao) values ("Master");

create table Usuario (Usuario_id integer not null auto_increment, Usuario_nomeUsuario varchar(50), Usuario_nomeCompleto varchar(200), Usuario_experiencia integer, Usuario_energia integer, Usuario_dinheiro float, Usuario_RankingId integer, primary key (Usuario_id), foreign key (Usuario_RankingId) references Ranking(Ranking_id));

insert into Usuario (Usuario_nomeUsuario, Usuario_nomeCompleto, Usuario_experiencia, Usuario_energia, Usuario_dinheiro, Usuario_RankingId) values ("LucasSarri", "Lucas Sarri de Mello", 0, 0, 0.0, 5);

create table Materia (Materia_id integer not null auto_increment, Materia_descricao varchar(50), primary key (Materia_id));

insert into Materia (Materia_descricao) values ("Banco de Dados");

create table UsuarioMateria (UsuarioMateria_id integer not null, UsuarioMateria_UsuarioId integer, UsuarioMateria_MateriaId integer, UsuarioMateria_Concluida boolean);

create table Aula (Aula_id integer not null auto_increment, Aula_descricao varchar(50), Aula_linkVideo varchar(250), Aula_Texto text, Aula_Materia integer, primary key (Aula_id), foreign key (Aula_Materia) references Materia(Materia_id));
