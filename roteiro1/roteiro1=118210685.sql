-- questoes 1 e 2:
 
CREATE TABLE IF NOT EXISTS automovel (
placa CHAR(7),
modelo VARCHAR(20),
cor VARCHAR(20),
marca VARCHAR(20),
cpf_segurado CHAR(11),
seguro VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS segurado (
nome VARCHAR (40),
data_de_nascimento DATE,
cpf CHAR(11),
identidade CHAR(11)
);

CREATE TABLE IF NOT EXISTS perito (
nome VARCHAR (40),
nascimento DATE,
cpf CHAR(11),
identidade CHAR(11)
);

CREATE TABLE IF NOT EXISTS oficina (
rua VARCHAR(40),
numero INTEGER,
cep CHAR(9),
bairro VARCHAR(40),
referencia VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS seguro (
numeracao VARCHAR(40),
inicio_vigencia DATE,
final_vigencia DATE,
envolvimento_com_terceiros BOOLEAN,
placa_automovel CHAR(7)
);

CREATE TABLE IF NOT EXISTS sinistro (
id_sinistro INT,
descricao VARCHAR(60),
hora TIMESTAMP,
data_do_ocorrido DATE,
endereco VARCHAR(70), 
houve_vitima BOOLEAN
);

CREATE TABLE IF NOT EXISTS pericia (
cpf_perito CHAR(11),
descricao_dos_danos VARCHAR(60),
quilometragem VARCHAR(10),
placa_automovel CHAR(7)
);

CREATE TABLE IF NOT EXISTS reparo (
id_reparo INT,
houve_reparo BOOLEAN,
orcamento NUMERIC,
placa_automovel CHAR(7)
);


-- questao 3:

ALTER TABLE automovel ADD PRIMARY KEY(placa);
ALTER TABLE segurado ADD PRIMARY KEY(cpf);
ALTER TABLE perito ADD PRIMARY KEY(cpf);
ALTER TABLE oficina ADD PRIMARY KEY(numero);
ALTER TABLE seguro ADD PRIMARY KEY(numeracao);
ALTER TABLE pericia ADD PRIMARY KEY(cpf_perito);
ALTER TABLE sinistro ADD PRIMARY KEY(id_sinistro);
ALTER TABLE reparo ADD PRIMARY KEY(id_reparo);



-- questao 4:
ALTER TABLE pericia ADD FOREIGN KEY (cpf_perito) REFERENCES perito(cpf);
ALTER TABLE pericia ADD FOREIGN KEY(placa_automovel) REFERENCES automovel(placa);
ALTER TABLE automovel ADD FOREIGN KEY(cpf_segurado) REFERENCES segurado(cpf);
ALTER TABLE automovel ADD FOREIGN KEY(seguro) REFERENCES seguro(numeracao);
ALTER TABLE reparo ADD FOREIGN KEY(placa_automovel) REFERENCES automovel(placa);


-- questao 6:
DROP TABLE IF EXISTS pericia;
DROP TABLE IF EXISTS perito;
DROP TABLE IF EXISTS reparo;
DROP TABLE IF EXISTS oficina;
DROP TABLE IF EXISTS sinistro;
DROP TABLE IF EXISTS automovel;
DROP TABLE IF EXISTS segurado;
DROP TABLE IF EXISTS seguro;



-- questao 7 e 8:

CREATE TABLE IF NOT EXISTS automovel (
placa CHAR(7) PRIMARY KEY NOT NULL,
modelo VARCHAR(20) NOT NULL,
cor VARCHAR(20) NOT NULL,
marca VARCHAR(20) NOT NULL,
segurado CHAR(11) REFERENCES segurado(cpf),
seguro VARCHAR(40) REFERENCES seguro(numeracao)
);

CREATE TABLE IF NOT EXISTS segurado (
nome VARCHAR (40) NOT NULL,
data_de_nascimento DATE,
cpf CHAR(11) PRIMARY KEY NOT NULL,
identidade CHAR(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS pericia (
descricao_dos_danos VARCHAR(60),
quilometragem VARCHAR(10),
placa_do_carro CHAR(7) NOT NULL REFERENCES automovel(placa),
cpf_perito CHAR(11) NOT NULL REFERENCES perito(cpf)
);


CREATE TABLE IF NOT EXISTS perito (
nome VARCHAR (40),
nascimento DATE,
cpf CHAR(11) PRIMARY KEY NOT NULL,
identidade CHAR(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS oficina (
rua VARCHAR(40) NOT NULL,
numero INTEGER(10) PRIMARY KEY NOT NULL,
cep CHAR(9) NOT NULL,
bairro VARCHAR(40) NOT NULL,
referencia VARCHAR(40)
);


CREATE TABLE IF NOT EXISTS seguro (
numeracao VARCHAR(40) PRIMARY KEY NOT NULL,
placa_automovel CHAR(7) NOT NULL REFERENCES automovel(placa),
inicio_vigencia DATE,
final_vigencia DATE,
envolvimento_com_terceiros BOOLEAN
);

CREATE TABLE IF NOT EXISTS sinistro (
id_sinistro INT PRIMARY KEY NOT NULL,
descricao VARCHAR(60) NOT NULL,
hora TIMESTAMP,
data_do_ocorrido DATE,
endereco VARCHAR(70), 
houve_vitima BOOLEAN
);


CREATE TABLE IF NOT EXISTS reparo (
id_reparo INT PRIMARY KEY NOT NULL,
placa_automovel CHAR(7) NOT NULL REFERENCES automovel(placa),
houve_reparo BOOLEAN,
orcamento NUMERIC
);

-- questao 9

DROP TABLE IF EXISTS pericia;
DROP TABLE IF EXISTS perito;
DROP TABLE IF EXISTS reparo;
DROP TABLE IF EXISTS oficina;
DROP TABLE IF EXISTS sinistro;
DROP TABLE IF EXISTS automovel;
DROP TABLE IF EXISTS segurado;
DROP TABLE IF EXISTS seguro;


-- questao 10:

CREATE TABLE IF NOT EXISTS automovel (
placa CHAR(7) PRIMARY KEY NOT NULL,
modelo VARCHAR(20) NOT NULL,
cor VARCHAR(20) NOT NULL,
marca VARCHAR(20) NOT NULL,
segurado CHAR(11) REFERENCES segurado(cpf),
seguro VARCHAR(40) REFERENCES seguro(numeracao)
);

CREATE TABLE IF NOT EXISTS segurado (
nome VARCHAR (40) NOT NULL,
data_de_nascimento DATE,
cpf CHAR(11) PRIMARY KEY NOT NULL,
identidade CHAR(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS pericia (
descricao_dos_danos VARCHAR(60),
quilometragem VARCHAR(10),
placa_do_carro CHAR(7) NOT NULL REFERENCES automovel(placa),
cpf_perito CHAR(11) NOT NULL REFERENCES perito(cpf)
);


CREATE TABLE IF NOT EXISTS perito (
nome VARCHAR (40),
nascimento DATE,
cpf CHAR(11) PRIMARY KEY NOT NULL,
identidade CHAR(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS oficina (
rua VARCHAR(40) NOT NULL,
numero INTEGER(10) PRIMARY KEY NOT NULL,
cep CHAR(9) NOT NULL,
bairro VARCHAR(40) NOT NULL,
referencia VARCHAR(40)
);


CREATE TABLE IF NOT EXISTS seguro (
numeracao VARCHAR(40) PRIMARY KEY NOT NULL,
placa_automovel CHAR(7) NOT NULL REFERENCES automovel(placa),
inicio_vigencia DATE,
final_vigencia DATE,
envolvimento_com_terceiros BOOLEAN
);

CREATE TABLE IF NOT EXISTS sinistro (
id_sinistro INT PRIMARY KEY NOT NULL,
descricao VARCHAR(60) NOT NULL,
hora TIMESTAMP,
data_do_ocorrido DATE,
endereco VARCHAR(70), 
houve_vitima BOOLEAN
);


CREATE TABLE IF NOT EXISTS reparo (
id_reparo INT PRIMARY KEY NOT NULL,
placa_automovel CHAR(7) NOT NULL REFERENCES automovel(placa),
houve_reparo BOOLEAN,
orcamento NUMERIC
);



