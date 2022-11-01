#criando a base de dados.

CREATE DATABASE BSBmedclinycs;

USE BSBmedclinycs;

#Criação das tabelas

CREATE TABLE tab_PACIENTE 
(
	CPF char(11) PRIMARY KEY,
	Nome varchar(90),
	Data_de_nascimento datetime,
	Endereco varchar(55),
	Email varchar(60),
	Celular varchar(20),
	Telefone_fixo varchar(20)
);

CREATE TABLE tab_ESPECIALIDADES
(
	Id int auto_increment PRIMARY KEY,
	Especialidade varchar(40)
);

CREATE TABLE tab_MEDICOS
(
	Id int auto_increment PRIMARY KEY,
	CPF char(11),
	Nome varchar(90),
	Endereco varchar(55),
	Email varchar(40),
	Celular varchar(20),
	Telefone_fixo varchar(20),
	Especialidade_Id int,
	FOREIGN KEY(Especialidade_Id) REFERENCES tab_ESPECIALIDADES(Id)
	);

CREATE TABLE tab_HORARIOS
(
	Id int auto_increment PRIMARY KEY,
	Hora_inicio time NOT NULL,
	Hora_fim time NOT NULL
);

CREATE TABLE tab_DIAS
(
	Dia char(10),
	Medico_id int,
	FOREIGN KEY(Medico_id) REFERENCES tab_MEDICOS (Id),
	Horario_id int,
	FOREIGN KEY(Horario_id) REFERENCES tab_HORARIOS(Id),
	PRIMARY KEY (Dia,Medico_id)
);

CREATE TABLE tab_AGENDAMENTOS
(
	Id int auto_increment PRIMARY KEY,
	Paciente_CPF char(11) NOT NULL,
	FOREIGN KEY (Paciente_CPF) REFERENCES tab_PACIENTE(CPF),
	Medico_id int NOT NULL,
	FOREIGN KEY (Medico_id) REFERENCES tab_MEDICOS(Id),
	Urgencia Boolean,  #1=URGENTE 0=NORMAL,
	Data_agendamento datetime NOT NULL,
	Ficha_registro datetime DEFAULT NOW(),
	senha int CHECK (senha>=1)
);

#Inserindo dados da tab_ESPECIALIDADES

	insert into tab_ESPECIALIDADES (Especialidade)
		values('Odontologia');
	insert into tab_ESPECIALIDADES (Especialidade)
		values('Oftalmologia');
	insert into tab_ESPECIALIDADES (Especialidade)
		values('Pediatria');
	insert into tab_ESPECIALIDADES (Especialidade)
		values('Medico geral');
		
#inserção dos dados da tab_MEDICOS

	insert into tab_MEDICOS (CPF,Nome,Endereco,Email,Celular,Telefone_fixo,Especialidade_Id)
		values ('12345678910','Arnaldo Bocão','Sobral Q.08 Conj "i" casa 22','arnaldo@someail.com','71933130733','34791898','1');
	insert into tab_MEDICOS (CPF,Nome,Endereco,Email,Celular,Telefone_fixo,Especialidade_Id)
		values ('12345678911','Chico Fuzy','Sobral Q.22 Conj "k" casa 42','chico@someail.com','71933789654','56988909','2');
	insert into tab_MEDICOS (CPF,Nome,Endereco,Email,Celular,Telefone_fixo,Especialidade_Id)
		values ('12345678912','Armenio Amarelo','Sobral Q.15 Conj "a" casa 25','Armenio@someail.com','71965743548','45129581','3');
	insert into tab_MEDICOS (CPF,Nome,Endereco,Email,Celular,Telefone_fixo,Especialidade_Id)
		values ('12345678913','Slim Shady','Sobral Q.01 Conj "b" casa 27','shady@someail.com','71959483058','34515879','4');

#Inserção dos horarios disponiveis na tab_HORARIOS

	insert into tab_HORARIOS(Hora_inicio,Hora_fim)
		values('08:00','19:00');
	insert into tab_HORARIOS(Hora_inicio,Hora_fim)
		values('08:00','19:00');
	insert into tab_HORARIOS(Hora_inicio,Hora_fim)
		values('08:00','19:00');
	insert into tab_HORARIOS(Hora_inicio,Hora_fim)
		values('08:00','19:00');
	
    
#Inserção dos dias disponiveis para agendamento na tab_DIAS

	insert into tab_DIAS(Dia, Medico_id, Horario_id)
		values('Terça','1','1');
	insert into tab_DIAS(Dia, Medico_id, Horario_id)
		values('Segunda','1','1');
	insert into tab_DIAS(Dia, Medico_id, Horario_id)
		values('Quinta','2','3');
	insert into tab_DIAS(Dia, Medico_id, Horario_id)
		values('Quarta','2','3');
	insert into tab_DIAS(Dia, Medico_id, Horario_id)
		values('Sexta','3','4');
	insert into tab_DIAS(Dia, Medico_id, Horario_id)
		values('Terça','3','4');
	insert into tab_DIAS(Dia, Medico_id, Horario_id)
		values('Quarta','3','4');
	insert into tab_DIAS(Dia, Medico_id, Horario_id)
		values('Quinta','4','4');
	insert into tab_DIAS(Dia, Medico_id, Horario_id)
		values('Viernes','4','4');

#Inserção dos dados na tab_PACIETE

	insert into tab_PACIENTE (CPF,Nome,Data_de_nascimento,endereco,Email,Celular,Telefone_fixo)
		values ('22345678910','Marshal Matters','1990/07/20','Sobral Q.23 Conj "l" casa 14','marshal@someail.com','71933130733','34748563');
	insert into tab_PACIENTE (CPF,Nome,Data_de_nascimento,endereco,Email,Celular,Telefone_fixo)
		values ('22345678911','Chico Grilo','1978/02/18','Sobral Q.11 Conj "d" casa 45','chico@someail.com','7198574637','34712341');
	insert into tab_PACIENTE (CPF,Nome,Data_de_nascimento,endereco,Email,Celular,Telefone_fixo)
		values ('22345678912','Vladmir Putin','1969/11/16','Sobral Q.27 Conj "z" casa 78','vladmir@someail.com','71938572948','34712412');
	insert into tab_PACIENTE (CPF,Nome,Data_de_nascimento,endereco,Email,Celular,Telefone_fixo)
		values ('22345678913','Arlindo Tomás','1967/12/19','Sobral Q.08 Conj "i" casa 22','arnalindo@someail.com','71948385732','34312564');

#Inserção dos dados na tab_AGENDAMENTOS

	insert into tab_AGENDAMENTOS(Paciente_CPF,Medico_id,Urgencia,Data_agendamento,senha)
		values ('22345678910','4','0','2022/03/24 17:45:12','1');
	insert into tab_AGENDAMENTOS(Paciente_CPF,Medico_id,Urgencia,Data_agendamento,senha)
		values ('22345678911','2','1','2022/03/24 19:53:22','2');
	insert into tab_AGENDAMENTOS(Paciente_CPF,Medico_id,Urgencia,Data_agendamento,senha)
		values ('22345678912','3','0','2022/03/23 18:34:26','3');
	insert into tab_AGENDAMENTOS(Paciente_CPF,Medico_id,Urgencia,Data_agendamento,senha)
		values ('22345678913','1','0','2022/03/23 20:53:52','4');
        