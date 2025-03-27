USE demonstracoes_contabeis;

TRUNCATE TABLE 1T2023;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/2023/1T2023.csv"
INTO TABLE `1T2023`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'  -- <<<< Altere para ; (ponto e vírgula)
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' -- Use \r\n para arquivos Windows
IGNORE 1 LINES
(
    @data, -- Use variáveis para tratamento
    reg_ans,
    cd_conta_contabil,
    descricao,
    @vl_saldo_inicial,
    @vl_saldo_final
)
SET
    data = STR_TO_DATE(@data, '%Y-%m-%d'), -- Converte texto para data
    vl_saldo_inicial = NULLIF(REPLACE(@vl_saldo_inicial, ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(@vl_saldo_final, ',', '.'), '');
    
TRUNCATE TABLE 2T2023;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/2023/1T2023.csv"
INTO TABLE `2T2023`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'  -- <<<< Altere para ; (ponto e vírgula)
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' -- Use \r\n para arquivos Windows
IGNORE 1 LINES
(
    @data, -- Use variáveis para tratamento
    reg_ans,
    cd_conta_contabil,
    descricao,
    @vl_saldo_inicial,
    @vl_saldo_final
)
SET
    data = STR_TO_DATE(@data, '%Y-%m-%d'), -- Converte texto para data
    vl_saldo_inicial = NULLIF(REPLACE(@vl_saldo_inicial, ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(@vl_saldo_final, ',', '.'), '');
    
TRUNCATE TABLE 3T2023;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/2023/1T2023.csv"
INTO TABLE `3T2023`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'  -- <<<< Altere para ; (ponto e vírgula)
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' -- Use \r\n para arquivos Windows
IGNORE 1 LINES
(
    @data, -- Use variáveis para tratamento
    reg_ans,
    cd_conta_contabil,
    descricao,
    @vl_saldo_inicial,
    @vl_saldo_final
)
SET
    data = STR_TO_DATE(@data, '%Y-%m-%d'), -- Converte texto para data
    vl_saldo_inicial = NULLIF(REPLACE(@vl_saldo_inicial, ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(@vl_saldo_final, ',', '.'), '');
    
TRUNCATE TABLE 4T2023;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/2023/1T2023.csv"
INTO TABLE `4T2023`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'  -- <<<< Altere para ; (ponto e vírgula)
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' -- Use \r\n para arquivos Windows
IGNORE 1 LINES
(
    @data, -- Use variáveis para tratamento
    reg_ans,
    cd_conta_contabil,
    descricao,
    @vl_saldo_inicial,
    @vl_saldo_final
)
SET
    data = STR_TO_DATE(@data, '%Y-%m-%d'), -- Converte texto para data
    vl_saldo_inicial = NULLIF(REPLACE(@vl_saldo_inicial, ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(@vl_saldo_final, ',', '.'), '');
    
TRUNCATE TABLE 1T2024;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/2024/1T2024.csv"
INTO TABLE `1T2024`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'  -- <<<< Altere para ; (ponto e vírgula)
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' -- Use \r\n para arquivos Windows
IGNORE 1 LINES
(
    @data, -- Use variáveis para tratamento
    reg_ans,
    cd_conta_contabil,
    descricao,
    @vl_saldo_inicial,
    @vl_saldo_final
)
SET
    data = STR_TO_DATE(@data, '%Y-%m-%d'), -- Converte texto para data
    vl_saldo_inicial = NULLIF(REPLACE(@vl_saldo_inicial, ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(@vl_saldo_final, ',', '.'), '');
    
TRUNCATE TABLE 2T2024;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/2024/1T2024.csv"
INTO TABLE `2T2024`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'  -- <<<< Altere para ; (ponto e vírgula)
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' -- Use \r\n para arquivos Windows
IGNORE 1 LINES
(
    @data, -- Use variáveis para tratamento
    reg_ans,
    cd_conta_contabil,
    descricao,
    @vl_saldo_inicial,
    @vl_saldo_final
)
SET
    data = STR_TO_DATE(@data, '%Y-%m-%d'), -- Converte texto para data
    vl_saldo_inicial = NULLIF(REPLACE(@vl_saldo_inicial, ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(@vl_saldo_final, ',', '.'), '');
    
TRUNCATE TABLE 3T2024;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/2024/1T2024.csv"
INTO TABLE `3T2024`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'  -- <<<< Altere para ; (ponto e vírgula)
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' -- Use \r\n para arquivos Windows
IGNORE 1 LINES
(
    @data, -- Use variáveis para tratamento
    reg_ans,
    cd_conta_contabil,
    descricao,
    @vl_saldo_inicial,
    @vl_saldo_final
)
SET
    data = STR_TO_DATE(@data, '%Y-%m-%d'), -- Converte texto para data
    vl_saldo_inicial = NULLIF(REPLACE(@vl_saldo_inicial, ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(@vl_saldo_final, ',', '.'), '');
    
TRUNCATE TABLE 4T2024;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/2024/1T2024.csv"
INTO TABLE `4T2024`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'  -- <<<< Altere para ; (ponto e vírgula)
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' -- Use \r\n para arquivos Windows
IGNORE 1 LINES
(
    @data, -- Use variáveis para tratamento
    reg_ans,
    cd_conta_contabil,
    descricao,
    @vl_saldo_inicial,
    @vl_saldo_final
)
SET
    data = STR_TO_DATE(@data, '%Y-%m-%d'), -- Converte texto para data
    vl_saldo_inicial = NULLIF(REPLACE(@vl_saldo_inicial, ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(@vl_saldo_final, ',', '.'), '');

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
    Regiao_de_Comercializacao = NULLIF(@Regiao_de_Comercializacao, '');  -- Converte '' para NULL