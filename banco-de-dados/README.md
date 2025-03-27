# Documentação do Código 01estrutura_das_tabelas.sql

Este documento descreve o código SQL fornecido, que cria um banco de dados e tabelas para armazenar informações contábeis relacionadas a demonstrações financeiras e operadoras. O código está estruturado para facilitar a organização e consulta de dados em períodos trimestrais e anuais.

---

## 1. Estrutura do Banco de Dados

### 1.1. Criação do Banco de Dados
O código começa com a criação de um banco de dados chamado `demonstracoes_contabeis`, caso ele ainda não exista:

```sql
CREATE DATABASE IF NOT EXISTS demonstracoes_contabeis;
USE demonstracoes_contabeis;
```

- **Função**: O comando `CREATE DATABASE IF NOT EXISTS` garante que o banco de dados seja criado apenas se ele ainda não existir. O comando `USE` seleciona o banco de dados recém-criado como o contexto ativo para as próximas operações.

---

## 2. Tabelas Trimestrais

Foram criadas tabelas separadas para cada trimestre dos anos de 2023 e 2024. As tabelas seguem o padrão `1T2023`, `2T2023`, ..., `4T2024`.

### 2.1. Estrutura das Tabelas Trimestrais
Cada tabela possui os seguintes campos:

| Campo               | Tipo             | Descrição                                                                 |
|---------------------|------------------|---------------------------------------------------------------------------|
| `data`              | `DATE`           | Data associada ao registro (não pode ser nula).                           |
| `reg_ans`           | `VARCHAR(20)`    | Registro da Agência Nacional de Saúde Suplementar (ANS) (não pode ser nulo). |
| `cd_conta_contabil` | `VARCHAR(20)`    | Código da conta contábil (não pode ser nulo).                            |
| `descricao`         | `TEXT`           | Descrição da conta contábil (não pode ser nula).                         |
| `vl_saldo_inicial`  | `NUMERIC(18,2)`  | Valor do saldo inicial da conta contábil (não pode ser nulo).            |
| `vl_saldo_final`    | `NUMERIC(18,2)`  | Valor do saldo final da conta contábil (não pode ser nulo).              |

- **Chave Primária**: A combinação dos campos `(data, reg_ans, cd_conta_contabil)` é usada como chave primária para garantir a unicidade dos registros.

### 2.2. Exemplo de Criação de Tabela
Aqui está um exemplo da criação de uma tabela trimestral (`1T2023`):

```sql
CREATE TABLE IF NOT EXISTS 1T2023 (
    data DATE NOT NULL,
    reg_ans VARCHAR(20) NOT NULL,
    cd_conta_contabil VARCHAR(20) NOT NULL,
    descricao TEXT NOT NULL,
    vl_saldo_inicial NUMERIC(18,2) NOT NULL,
    vl_saldo_final NUMERIC(18,2) NOT NULL,
    PRIMARY KEY (data, reg_ans, cd_conta_contabil)
);
```

- **Função**: Essas tabelas permitem armazenar informações contábeis de forma organizada por trimestre, facilitando consultas específicas para períodos definidos.

---

## 3. Tabela de Operadoras

Além das tabelas trimestrais, foi criada uma tabela chamada `operadoras` para armazenar informações sobre as operadoras registradas na ANS.

### 3.1. Estrutura da Tabela `operadoras`
A tabela `operadoras` possui os seguintes campos:

| Campo                     | Tipo             | Descrição                                                                 |
|---------------------------|------------------|---------------------------------------------------------------------------|
| `Registro_ANS`            | `INT`            | Número de registro na ANS (chave primária).                              |
| `CNPJ`                    | `CHAR(14)`       | CNPJ da operadora (não pode ser nulo).                                   |
| `Razao_Social`            | `TEXT`           | Razão social da operadora (não pode ser nulo).                           |
| `Nome_Fantasia`           | `VARCHAR(255)`   | Nome fantasia da operadora (opcional).                                   |
| `Modalidade`              | `VARCHAR(50)`    | Modalidade da operadora (não pode ser nulo).                             |
| `Logradouro`              | `VARCHAR(255)`   | Endereço da operadora (não pode ser nulo).                               |
| `Numero`                  | `VARCHAR(20)`    | Número do endereço (não pode ser nulo).                                  |
| `Complemento`             | `VARCHAR(100)`   | Complemento do endereço (opcional).                                      |
| `Bairro`                  | `VARCHAR(100)`   | Bairro da operadora (não pode ser nulo).                                 |
| `Cidade`                  | `VARCHAR(100)`   | Cidade da operadora (não pode ser nulo).                                 |
| `UF`                      | `CHAR(2)`        | Estado da operadora (não pode ser nulo).                                 |
| `CEP`                     | `CHAR(8)`        | CEP da operadora (não pode ser nulo).                                    |
| `DDD`                     | `CHAR(2)`        | DDD do telefone da operadora (não pode ser nulo).                        |
| `Telefone`                | `VARCHAR(20)`    | Telefone da operadora (não pode ser nulo).                               |
| `Fax`                     | `VARCHAR(20)`    | Fax da operadora (opcional).                                             |
| `Endereco_eletronico`     | `VARCHAR(255)`   | Endereço eletrônico (e-mail) da operadora (não pode ser nulo).           |
| `Representante`           | `VARCHAR(255)`   | Nome do representante da operadora (não pode ser nulo).                  |
| `Cargo_Representante`     | `VARCHAR(100)`   | Cargo do representante da operadora (não pode ser nulo).                 |
| `Regiao_de_Comercializacao` | `INT`          | Região de comercialização da operadora (opcional).                       |
| `Data_Registro_ANS`       | `DATE`           | Data de registro na ANS (não pode ser nulo).                             |

- **Chave Primária**: O campo `Registro_ANS` é usado como chave primária para garantir a unicidade de cada operadora.

### 3.2. Configurações Adicionais
A tabela `operadoras` inclui configurações adicionais:

```sql
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4;
```

- **Motor de Armazenamento**: `InnoDB` é usado para suporte a transações e integridade referencial.
- **Conjunto de Caracteres**: `utf8mb4` permite o armazenamento de caracteres Unicode, incluindo emojis .

---

## 4. Como Executar o Código em Sua Máquina

### 4.1. Pré-requisitos
- **MySQL Server**: Certifique-se de ter o MySQL instalado em sua máquina. Você pode baixá-lo no site oficial: [https://dev.mysql.com/downloads/](https://dev.mysql.com/downloads/).
- **Cliente MySQL**: Use uma ferramenta como o MySQL Workbench ou o terminal MySQL para executar o código.

### 4.2. Passos para Execução
1. **Inicie o MySQL Server**:
   - Abra o terminal ou o MySQL Workbench e conecte-se ao servidor MySQL.

2. **Execute o Código SQL**:
   - Copie e cole o código SQL fornecido no cliente MySQL.
   - Execute o código para criar o banco de dados e as tabelas.

3. **Verifique a Criação**:
   - Use o comando `SHOW DATABASES;` para verificar se o banco de dados `demonstracoes_contabeis` foi criado.
   - Use o comando `USE demonstracoes_contabeis;` seguido de `SHOW TABLES;` para listar as tabelas criadas.

---

# Documentação do Código 02importando_dados.sql

Este documento descreve o código SQL fornecido, que realiza a carga de dados de arquivos CSV para tabelas no banco de dados MySQL. O código é dividido em várias etapas, cada uma responsável por carregar dados específicos em tabelas correspondentes a trimestres e operadoras de planos de saúde.

---

## **1. Estrutura Geral**

O código utiliza a instrução `LOAD DATA INFILE` do MySQL para importar dados de arquivos CSV localizados no sistema de arquivos para tabelas no banco de dados. Antes de cada carga, as tabelas são truncadas com o comando `TRUNCATE TABLE`, garantindo que os dados anteriores sejam removidos antes da inserção dos novos .

### **Principais características:**
- **Base de dados**: `demonstracoes_contabeis`.
- **Tabelas-alvo**: Representam demonstrações contábeis de diferentes trimestres (ex.: `1T2023`, `2T2024`) e uma tabela para operadoras de planos de saúde (`operadoras`).
- **Formato dos arquivos CSV**:
  - Delimitador de campos: `;` (ponto e vírgula).
  - Caracteres opcionais para campos: `"`.
  - Quebra de linha: `\r\n` (padrão Windows).

---

## **2. Passo a Passo da Execução**

### **2.1. Configurações Iniciais**
Antes de executar o código, certifique-se de que:
1. O servidor MySQL está configurado para permitir o uso do comando `LOAD DATA INFILE`:
   - Edite o arquivo de configuração do MySQL (`my.cnf` ou `my.ini`) e adicione a seguinte linha:
     ```ini
     [mysqld]
     secure_file_priv = "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/"
     ```
   - Reinicie o servidor MySQL após a alteração .
2. Os arquivos CSV estão localizados no diretório especificado no parâmetro `LOAD DATA INFILE`:
   - Exemplo: `C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/2023/`.

### **2.2. Comandos Principais**

#### **2.2.1. Truncamento das Tabelas**
O comando `TRUNCATE TABLE` remove todos os registros de uma tabela sem deletar a estrutura da tabela. Isso garante que os dados antigos não interfiram na nova carga:
```sql
TRUNCATE TABLE 1T2023;
```

#### **2.2.2. Carga de Dados**
A instrução `LOAD DATA INFILE` importa os dados do arquivo CSV para a tabela especificada. Abaixo está um exemplo detalhado:

```sql
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/demonstracoes_contabeis/2023/1T2023.csv"
INTO TABLE `1T2023`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'  -- Delimitador de campos
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' -- Quebra de linha para arquivos Windows
IGNORE 1 LINES
(
    @data, -- Variável temporária para tratamento
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
```

##### **Explicação dos Parâmetros:**
- **`CHARACTER SET utf8mb4`**: Define o conjunto de caracteres para suportar Unicode.
- **`FIELDS TERMINATED BY ';'`**: Especifica que os campos no arquivo CSV são separados por ponto e vírgula.
- **`OPTIONALLY ENCLOSED BY '"'`**: Indica que os campos podem estar envolvidos por aspas.
- **`LINES TERMINATED BY '\r\n'`**: Define a quebra de linha como `\r\n`, padrão para arquivos gerados no Windows.
- **`IGNORE 1 LINES`**: Ignora a primeira linha do arquivo CSV, geralmente o cabeçalho.
- **Variáveis temporárias (`@data`, `@vl_saldo_inicial`, etc.)**: Permitem realizar tratamentos nos dados antes de inseri-los na tabela.
- **Funções de tratamento**:
  - `STR_TO_DATE(@data, '%Y-%m-%d')`: Converte uma string no formato `YYYY-MM-DD` para um tipo de dado `DATE`.
  - `REPLACE(@vl_saldo_inicial, ',', '.')`: Substitui vírgulas por pontos para formatar números decimais.
  - `NULLIF(valor, '')`: Converte strings vazias em `NULL`.

#### **2.2.3. Tabela de Operadoras**
A tabela `operadoras` segue uma estrutura semelhante, mas inclui um campo adicional tratado com uma variável temporária:
```sql
SET Regiao_de_Comercializacao = NULLIF(@Regiao_de_Comercializacao, '');
```
Isso converte valores vazios no campo `Regiao_de_Comercializacao` para `NULL`.

---

## **3. Como Executar o Código**

### **3.1. Pré-requisitos**
- Instale o MySQL Server e configure-o conforme descrito na seção **Configurações Iniciais**.
- Certifique-se de que os arquivos CSV estão no diretório correto e seguem o formato esperado.

### **3.2. Passos para Execução**
1. **Conecte-se ao MySQL**:
   - Use o terminal ou uma ferramenta gráfica como MySQL Workbench.
   - Execute o comando para conectar-se ao banco de dados:
     ```bash
     mysql -u usuario -p
     ```
     Substitua `usuario` pelo seu nome de usuário.

2. **Selecione o banco de dados**:
   ```sql
   USE demonstracoes_contabeis;
   ```

3. **Execute o código completo**:
   - Copie e cole o código fornecido no terminal ou ferramenta gráfica.
   - Pressione Enter para executar.

4. **Verifique os resultados**:
   - Consulte as tabelas para confirmar que os dados foram carregados corretamente:
     ```sql
     SELECT * FROM 1T2023 LIMIT 10;
     ```

---

# Documentação do Código SQL 03primeira_query.sql

Este documento descreve o código SQL fornecido, explicando suas funções e como executá-lo em sua máquina. O objetivo principal do código é analisar dados financeiros de operadoras de saúde, identificando as 10 operadoras com maiores despesas no último trimestre disponível.

---

## **1. Estrutura do Código**

### **1.1. Contexto**
O código utiliza uma base de dados chamada `demonstracoes_contabeis`, que contém informações financeiras de operadoras de saúde divididas por trimestres (ex.: `1T2024`, `2T2024`, etc.). A análise foca em um tipo específico de despesa: "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR".

---

### **1.2. Funções Principais**

#### **1.2.1. Definição da CTE `todas_tabelas`**
```sql
WITH todas_tabelas AS (
    SELECT * FROM 1T2024
    UNION ALL
    SELECT * FROM 2T2024
    UNION ALL
    SELECT * FROM 3T2024
    UNION ALL
    SELECT * FROM 4T2024
)
```
- **Função**: Combina os dados de todas as tabelas trimestrais (`1T2024`, `2T2024`, etc.) em uma única tabela virtual chamada `todas_tabelas`.
- **Método**: Utiliza a cláusula `UNION ALL` para concatenar os registros de cada tabela sem remover duplicatas .
- **Propósito**: Centralizar os dados para facilitar consultas subsequentes.

---

#### **1.2.2. Definição da CTE `ultimo_trimestre`**
```sql
ultimo_trimestre AS (
    SELECT 
        MAX(YEAR(data)) AS ano,
        MAX(QUARTER(data)) AS trimestre
    FROM todas_tabelas
)
```
- **Função**: Identifica o último trimestre disponível nos dados.
- **Método**: Usa as funções `MAX(YEAR(data))` e `MAX(QUARTER(data))` para extrair o ano e o trimestre mais recentes da coluna `data` .
- **Propósito**: Filtrar os dados para incluir apenas registros do último trimestre.

---

#### **1.2.3. Consulta Principal**
```sql
SELECT 
    o.Razao_Social,
    o.Registro_ANS,
    SUM(f.vl_saldo_final) AS total_despesas
FROM todas_tabelas f
JOIN operadoras o ON f.reg_ans = o.Registro_ANS
JOIN ultimo_trimestre ut 
    ON YEAR(f.data) = ut.ano 
    AND QUARTER(f.data) = ut.trimestre
WHERE 
    f.descricao LIKE 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
GROUP BY 
    o.Razao_Social, o.Registro_ANS
ORDER BY 
    total_despesas DESC
LIMIT 10;
```
- **Função**: Calcula as despesas totais das operadoras no último trimestre e retorna as 10 operadoras com maiores despesas.
- **Detalhes**:
  - **Junção de Tabelas**: Combina `todas_tabelas` (dados financeiros) com `operadoras` (informações das operadoras) usando a coluna `reg_ans` e `Registro_ANS`.
  - **Filtro por Trimestre**: Garante que apenas registros do último trimestre sejam considerados, utilizando a CTE `ultimo_trimestre`.
  - **Filtro por Descrição**: Restringe a análise à descrição específica de despesas mencionada.
  - **Agregação**: Usa `SUM(f.vl_saldo_final)` para calcular o total de despesas por operadora.
  - **Ordenação e Limite**: Ordena os resultados por `total_despesas` em ordem decrescente e limita a saída a 10 registros .

---

## **2. Como Executar o Código**

### **2.1. Pré-requisitos**
- **SGBD**: Certifique-se de ter acesso a um sistema de gerenciamento de banco de dados (SGBD) compatível com SQL, como MySQL, PostgreSQL ou SQL Server.
- **Base de Dados**: A base de dados `demonstracoes_contabeis` deve estar configurada com as seguintes tabelas:
  - `1T2024`, `2T2024`, `3T2024`, `4T2024`: Contêm os dados financeiros trimestrais.
  - `operadoras`: Contém informações sobre as operadoras de saúde.
- **Colunas Necessárias**:
  - `data`: Data dos registros financeiros.
  - `vl_saldo_final`: Valor final do saldo financeiro.
  - `descricao`: Descrição da despesa.
  - `reg_ans`: Identificador da operadora nas tabelas trimestrais.
  - `Razao_Social` e `Registro_ANS`: Informações das operadoras.

---

### **2.2. Passos para Execução**
1. **Conecte-se ao SGBD**:
   - Use uma ferramenta como MySQL Workbench, pgAdmin ou o terminal do SQL Server para acessar sua instância do SGBD.

2. **Carregue a Base de Dados**:
   - Execute scripts SQL para criar as tabelas e inserir os dados necessários.

3. **Execute o Código**:
   - Copie e cole o código fornecido em sua ferramenta SQL.
   - Execute a consulta para obter os resultados.

---

## **3. Exemplo de Saída**

A consulta retornará uma tabela com as seguintes colunas:

| Razao_Social               | Registro_ANS | total_despesas |
|----------------------------|--------------|----------------|
| Operadora A                | 123456789    | 10.000.000,00  |
| Operadora B                | 987654321    | 9.500.000,00   |
| ...                        | ...          | ...            |

Os resultados estarão ordenados por `total_despesas` em ordem decrescente, exibindo as 10 operadoras com maiores despesas.

---

# Documentação do Código SQL 04segunda_query.sql

Este documento descreve o código SQL fornecido, explicando suas funcionalidades, como ele funciona e como executá-lo em sua máquina.

---

## **Visão Geral**

O código SQL realiza uma consulta que calcula o total de despesas por operadora de planos de saúde para o ano de 2024. Ele combina dados de múltiplas tabelas referentes a diferentes trimestres (1T2024, 2T2024, etc.), une esses dados com informações das operadoras e retorna as 10 operadoras com maiores despesas, ordenadas de forma decrescente.

---

## **Explicação Detalhada do Código**

### **1. Seleção do Banco de Dados**
```sql
USE demonstracoes_contabeis;
```
- **Função**: Define o banco de dados `demonstracoes_contabeis` como o contexto da consulta.
- **Importância**: Garante que todas as tabelas referenciadas no código (`1T2024`, `2T2024`, etc.) estejam no banco de dados correto.

---

### **2. Estrutura da Consulta Principal**
```sql
SELECT 
    o.Razao_Social,
    o.Registro_ANS,
    o.CNPJ,
    o.Cidade,
    o.UF,
    SUM(d.vl_saldo_final) AS total_despesas
```
- **Função**: Seleciona os campos relevantes para o relatório:
  - Informações da operadora (`Razao_Social`, `Registro_ANS`, `CNPJ`, `Cidade`, `UF`).
  - A soma dos valores finais de despesas (`vl_saldo_final`) agrupados por operadora.
- **Resultado**: Cada linha do resultado representa uma operadora com seu total de despesas.

---

### **3. União de Dados dos Trimestres**
```sql
FROM (
    SELECT * FROM 1T2024
    UNION ALL
    SELECT * FROM 2T2024
    UNION ALL
    SELECT * FROM 3T2024
    UNION ALL
    SELECT * FROM 4T2024
) AS d
```
- **Função**: Combina os dados de quatro tabelas correspondentes aos trimestres de 2024 (`1T2024`, `2T2024`, `3T2024`, `4T2024`) em um único conjunto de dados.
- **Método**: Usa `UNION ALL` para incluir todas as linhas sem remover duplicatas . Isso é apropriado porque cada tabela contém dados únicos de um período específico.

---

### **4. Junção com a Tabela de Operadoras**
```sql
JOIN operadoras o 
    ON d.reg_ans = o.Registro_ANS
```
- **Função**: Relaciona os dados consolidados dos trimestres (`d`) com a tabela `operadoras` usando a chave `reg_ans` (registro na ANS).
- **Resultado**: Enriquece os dados financeiros com informações cadastrais das operadoras.

---

### **5. Filtro por Ano**
```sql
WHERE 
   YEAR(d.data) = 2024
```
- **Função**: Filtra os registros para incluir apenas aqueles cuja data pertence ao ano de 2024.
- **Nota**: O uso da função `YEAR()` pode impactar o desempenho em grandes volumes de dados . Para otimização, considere indexar a coluna `data`.

---

### **6. Agrupamento e Ordenação**
```sql
GROUP BY 
    o.Razao_Social, o.Registro_ANS, o.CNPJ, o.Cidade, o.UF
ORDER BY 
    total_despesas DESC
LIMIT 10;
```
- **Agrupamento (`GROUP BY`)**: Agrupa os dados por operadora para calcular o total de despesas.
- **Ordenação (`ORDER BY`)**: Ordena os resultados pelo total de despesas em ordem decrescente.
- **Limite (`LIMIT`)**: Retorna apenas as 10 operadoras com maiores despesas.

---

## **Como Executar o Código**

### **Pré-requisitos**
1. **Banco de Dados**:
   - Certifique-se de ter acesso ao banco de dados `demonstracoes_contabeis`.
   - As tabelas `1T2024`, `2T2024`, `3T2024`, `4T2024` e `operadoras` devem existir e conter os dados necessários.

2. **Ferramentas**:
   - Use uma ferramenta SQL como MySQL Workbench, pgAdmin (PostgreSQL), ou DBeaver.
   - Alternativamente, execute o código diretamente no terminal ou prompt de comando.

### **Passos**
1. **Conexão ao Banco de Dados**:
   - Conecte-se ao servidor onde o banco de dados está hospedado.

2. **Execução do Código**:
   - Copie e cole o código SQL fornecido na ferramenta de consulta.
   - Execute a consulta para visualizar os resultados.

3. **Verificação dos Resultados**:
   - Certifique-se de que os resultados exibidos estão corretos e refletem as 10 operadoras com maiores despesas no ano de 2024.