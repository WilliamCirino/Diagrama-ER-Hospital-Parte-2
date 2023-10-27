Create database Hospital

--Tabela onde será adicionada as Capacidades Médicas, a coluna 'Nome' recebera as capacidades:Generalistas, Especialistas, Residentes
Create table Capacidade_medicas(
ID int IDENTITY(1,1) PRIMARY KEY,
Nome varchar(100) not null,
MedicoID int,
);

--Tabela onde será adicionada as Especialidades Médicas, a coluna 'Nome' recebera as Especialidades:Pediatria, Clinica Geral, Gastroenterologia 
Create table Especialidades_medicas(
ID int IDENTITY(1,1) PRIMARY KEY,
Nome varchar(100) not null,
MedicoID int,
);

Create table Consultas(
ID int IDENTITY(1,1) PRIMARY KEY,
Data_De_Realização Date not null,
Hora_De_Realização time not null,
MedicoID int,
PacienteID int not null,
Valor_Da_Consulta decimal(18,2),
ConvenioID int,
Numero_Da_Carteira int,
ReceitaMedicaID int
);

Create table Receita_Medica(
ID int IDENTITY(1,1) PRIMARY KEY,
Medicamento varchar(max) not null,
Quantidade int,
Instrucao varchar(max),
ConsultaID int
); 

Create table Dados_medicos(
ID int IDENTITY(1,1) PRIMARY KEY,
Nome varchar(max) not null,
Data_De_Nascimento date not null,
Telefone int,
Endereco varchar(max),
Email varchar(max),
CPF int, 
RG int, 
Capacidade_MedicaID int,
Especialidade_MedicaID int, 
);


Create table Dados_Pacientes(
ID int IDENTITY(1,1) PRIMARY KEY,
Nome varchar(max) not null,
Data_De_Nascimento date not null,
Telefone int,
Endereco varchar(max),
Email varchar(max),
CPF int, 
RG int, 
ConsultasID int,
MedicoID int, 
ConvenioID int,
ReceitaMedicaID int, 
);


Create table Convenio(
ID int IDENTITY(1,1) PRIMARY KEY,
Nome varchar(max) not null,
CNPJ int not null,
PacienteID int not null
);

Create table Quartos(
ID int IDENTITY(1,1) PRIMARY KEY,
PacienteID int not null,
NumeroDoQuarto int not null,
TipoDoQuarto varchar(100) not null
);

Create table Internacao(
ID int IDENTITY(1,1) PRIMARY KEY,
DataDeEntrada datetime not null,
DataPrevistaDeAlta datetime not null,
DataEfetivaDeAlta datetime not null,
DescricaoDosProcedimentos varchar(max) not null,
PacienteID int not null,
MedicoID int not null
);