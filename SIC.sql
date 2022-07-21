create database SIC;

use SIC;

create table Ranking (Ranking_id integer not null auto_increment, Ranking_descricao varchar(20), primary key (Ranking_id));

insert into Ranking (Ranking_descricao) values ("Trainee"); 
insert into Ranking (Ranking_descricao) values ("Junior"); 
insert into Ranking (Ranking_descricao) values ("Pleno");
insert into Ranking (Ranking_descricao) values ("Senior");
insert into Ranking (Ranking_descricao) values ("Master");

create table Usuario (Usuario_Id integer not null auto_increment, Usuario_nomeUsuario varchar(50), Usuario_nomeCompleto varchar(200), Usuario_experiencia integer, Usuario_energia integer, Usuario_dinheiro float, Usuario_RankingId integer, primary key (Usuario_Id), foreign key (Usuario_RankingId) references Ranking(Ranking_id));

insert into Usuario (Usuario_nomeUsuario, Usuario_nomeCompleto, Usuario_experiencia, Usuario_energia, Usuario_dinheiro, Usuario_RankingId) values ("LucasSarri", "Lucas Sarri de Mello", 0, 0, 0.0, 5);

create table Materia (Materia_id integer not null auto_increment, Materia_descricao varchar(50), primary key (Materia_id));

insert into Materia (Materia_descricao) values ("Banco de Dados");

create table UsuarioMateria (UsuarioMateria_id integer not null, UsuarioMateria_UsuarioId integer, UsuarioMateria_MateriaId integer, UsuarioMateria_Concluida boolean);

create table Aula (Aula_id integer not null auto_increment, Aula_descricao varchar(50), Aula_linkVideo varchar(250), Aula_Texto text, Aula_Materia integer, primary key (Aula_id), foreign key (Aula_Materia) references Materia(Materia_id));

create table UsuarioAula (UsuarioAula_Id integer not null auto_increment, UsuarioAula_Concluida boolean, UsuarioAula_UsuarioId integer, UsuarioAula_AulaId integer, primary key (UsuarioAula_Id), foreign key (UsuarioAula_UsuarioId) references Usuario(Usuario_Id), foreign key (UsuarioAula_AulaId) references Aula(Aula_Id));

create table Atividade (Atividade_Id integer not null auto_increment, Atividade_QtdQuestoes integer, Atividade_MinimoAcertos integer, Atividade_AulaId integer, primary key (Atividade_Id), foreign key (Atividade_AulaId) references Aula(Aula_Id));

create table UsuarioAtividade (UsuarioAtividade_Id integer not null auto_increment, UsuarioAtividade_Concluido boolean, UsuarioAtividade_NotaTotal float, UsuarioAtividade_Tempo time, UsuarioAtividades_Acertos integer, UsuarioAtividade_UsuarioId integer, UsuarioAtividade_AtividadeId integer, primary key (UsuarioAtividade_Id), foreign key (UsuarioAtividade_UsuarioId) references Usuario(Usuario_Id), foreign key (UsuarioAtividade_AtividadeId) references Atividade(Atividade_Id));

create table Questao (Questao_Id integer not null auto_increment, Questao_Enunciado varchar (300), Questao_Resposta text, Questao_AtividadeId integer, primary key (Questao_Id), foreign key (Questao_AtividadeId) references Atividade(Atividade_Id));

create table UsuarioQuestao (UsuarioQuestao_Id integer not null auto_increment, UsuarioQuestao_Acerto boolean, UsuarioQuestao_UsuarioId integer, UsuarioQuestao_QuestaoId integer, primary key (UsuarioQuestao_Id), foreign key (UsuarioQuestao_UsuarioId) references Usuario(Usuario_Id), foreign key (UsuarioQuestao_QuestaoId) references Questao(Questao_Id));