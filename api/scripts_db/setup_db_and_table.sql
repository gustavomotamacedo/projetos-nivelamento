CREATE DATABASE IF NOT EXISTS python_api;

USE python_api;

CREATE TABLE IF NOT EXISTS operadoras (
    Registro_ANS INT NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    Razao_Social TEXT NOT NULL,
    Nome_Fantasia VARCHAR(255) NULL,
    Modalidade VARCHAR(50) NOT NULL,
    Logradouro VARCHAR(255) NOT NULL,
    Numero VARCHAR(20) NOT NULL,
    Complemento VARCHAR(100) NULL,
    Bairro VARCHAR(100) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    UF CHAR(2) NOT NULL,
    CEP CHAR(8) NOT NULL,
    DDD CHAR(2) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Fax VARCHAR(20) NULL,
    Endereco_eletronico VARCHAR(255) NOT NULL,
    Representante VARCHAR(255) NOT NULL,
    Cargo_Representante VARCHAR(100) NOT NULL,
    Regiao_de_Comercializacao INT NULL,
    Data_Registro_ANS DATE NOT NULL,
    PRIMARY KEY (Registro_ANS)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4;

TRUNCATE TABLE operadoras;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/operadoras_de_plano_de_saude_ativas/Relatorio_cadop.csv'
INTO TABLE operadoras
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    Registro_ANS,
    CNPJ,
    Razao_Social,
    Nome_Fantasia,
    Modalidade,
    Logradouro,
    Numero,
    Complemento,
    Bairro,
    Cidade,
    UF,
    CEP,
    DDD,
    Telefone,
    Fax,
    Endereco_eletronico,
    Representante,
    Cargo_Representante,
    @Regiao_de_Comercializacao,  -- Variável temporária
    Data_Registro_ANS
)
SET 
    Regiao_de_Comercializacao = NULLIF(@Regiao_de_Comercializacao, '');