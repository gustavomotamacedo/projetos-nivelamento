CREATE DATABASE IF NOT EXISTS demonstracoes_contabeis;
USE demonstracoes_contabeis;

CREATE TABLE IF NOT EXISTS 1T2023 (
    data DATE NOT NULL,
    reg_ans VARCHAR(20) NOT NULL,
    cd_conta_contabil VARCHAR(20) NOT NULL,
    descricao TEXT NOT NULL,
    vl_saldo_inicial NUMERIC(18,2) NOT NULL,
    vl_saldo_final NUMERIC(18,2) NOT NULL,
    PRIMARY KEY (data, reg_ans, cd_conta_contabil)
);

CREATE TABLE IF NOT EXISTS 2T2023 (
    data DATE NOT NULL,
    reg_ans VARCHAR(20) NOT NULL,
    cd_conta_contabil VARCHAR(20) NOT NULL,
    descricao TEXT NOT NULL,
    vl_saldo_inicial NUMERIC(18,2) NOT NULL,
    vl_saldo_final NUMERIC(18,2) NOT NULL,
    PRIMARY KEY (data, reg_ans, cd_conta_contabil)
);

CREATE TABLE IF NOT EXISTS 3T2023 (
    data DATE NOT NULL,
    reg_ans VARCHAR(20) NOT NULL,
    cd_conta_contabil VARCHAR(20) NOT NULL,
    descricao TEXT NOT NULL,
    vl_saldo_inicial NUMERIC(18,2) NOT NULL,
    vl_saldo_final NUMERIC(18,2) NOT NULL,
    PRIMARY KEY (data, reg_ans, cd_conta_contabil)
);

CREATE TABLE IF NOT EXISTS 4T2023 (
    data DATE NOT NULL,
    reg_ans VARCHAR(20) NOT NULL,
    cd_conta_contabil VARCHAR(20) NOT NULL,
    descricao TEXT NOT NULL,
    vl_saldo_inicial NUMERIC(18,2) NOT NULL,
    vl_saldo_final NUMERIC(18,2) NOT NULL,
    PRIMARY KEY (data, reg_ans, cd_conta_contabil)
);

CREATE TABLE IF NOT EXISTS 1T2024 (
    data DATE NOT NULL,
    reg_ans VARCHAR(20) NOT NULL,
    cd_conta_contabil VARCHAR(20) NOT NULL,
    descricao TEXT NOT NULL,
    vl_saldo_inicial NUMERIC(18,2) NOT NULL,
    vl_saldo_final NUMERIC(18,2) NOT NULL,
    PRIMARY KEY (data, reg_ans, cd_conta_contabil)
);

CREATE TABLE IF NOT EXISTS 2T2024 (
    data DATE NOT NULL,
    reg_ans VARCHAR(20) NOT NULL,
    cd_conta_contabil VARCHAR(20) NOT NULL,
    descricao TEXT NOT NULL,
    vl_saldo_inicial NUMERIC(18,2) NOT NULL,
    vl_saldo_final NUMERIC(18,2) NOT NULL,
    PRIMARY KEY (data, reg_ans, cd_conta_contabil)
);

CREATE TABLE IF NOT EXISTS 3T2024 (
    data DATE NOT NULL,
    reg_ans VARCHAR(20) NOT NULL,
    cd_conta_contabil VARCHAR(20) NOT NULL,
    descricao TEXT NOT NULL,
    vl_saldo_inicial NUMERIC(18,2) NOT NULL,
    vl_saldo_final NUMERIC(18,2) NOT NULL,
    PRIMARY KEY (data, reg_ans, cd_conta_contabil)
);

CREATE TABLE IF NOT EXISTS 4T2024 (
    data DATE NOT NULL,
    reg_ans VARCHAR(20) NOT NULL,
    cd_conta_contabil VARCHAR(20) NOT NULL,
    descricao TEXT NOT NULL,
    vl_saldo_inicial NUMERIC(18,2) NOT NULL,
    vl_saldo_final NUMERIC(18,2) NOT NULL,
    PRIMARY KEY (data, reg_ans, cd_conta_contabil)
);

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

