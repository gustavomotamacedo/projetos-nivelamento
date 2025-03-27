# Documentação do Código: **Program**

Este código é uma implementação Java que utiliza as bibliotecas **Apache PDFBox** e **Tabula** para extrair dados de tabelas de um arquivo PDF, transformá-los em um arquivo CSV estruturado, substituir abreviações por descrições completas e compactar o resultado em um arquivo ZIP. Abaixo, você encontrará uma explicação detalhada de cada parte do código, bem como instruções sobre como executá-lo em sua máquina.

---

## **Descrição Geral**

O programa realiza as seguintes tarefas:

1. **Extração de Tabelas de um PDF**:
    - Utiliza a biblioteca **Tabula** para extrair tabelas de um arquivo PDF (`anexoI.pdf`).
    - Itera sobre as páginas e tabelas do PDF, processando os dados linha por linha.

2. **Transformação dos Dados**:
    - Substitui abreviações nas colunas (`OD` e `AMB`) pelas descrições completas (`Seg. Odontológica` e `Seg. Ambulatorial`).

3. **Salvamento em CSV**:
    - Salva os dados extraídos e transformados em um arquivo CSV estruturado (`anexoI.csv`).

4. **Compactação em ZIP**:
    - Compacta o arquivo CSV gerado em um arquivo ZIP denominado `Teste_GustavoMotaMacedo.zip`.

---

## **Estrutura do Código**

### **1. Importações**
O código importa bibliotecas necessárias para:
- Manipulação de arquivos PDF (`org.apache.pdfbox.pdmodel.PDDocument`).
- Extração de tabelas de PDFs (`technology.tabula.*`).
- Manipulação de arquivos e diretórios (`java.io.*`, `java.nio.file.*`).
- Compactação de arquivos (`java.util.zip.*`).

---

### **2. Métodos Principais**

#### **`compressZIP(Path outputFile, Path... filesToZip)`**
- **Descrição**: Compacta os arquivos especificados em um arquivo ZIP.
- **Funcionamento**:
    - Cria um fluxo de saída para o arquivo ZIP.
    - Itera sobre os arquivos fornecidos, adicionando-os ao ZIP com seus nomes originais.
    - Fecha o fluxo de saída após a compactação.

---

### **3. Método Principal (`main`)**

#### **Passos Executados no Método `main`:**

1. **Carregamento do PDF**:
    - O arquivo PDF (`anexoI.pdf`) é carregado usando a biblioteca **Apache PDFBox**.
    - O caminho do arquivo é definido como `src/input/anexoI.pdf`.

2. **Preparação do Arquivo CSV**:
    - Um arquivo CSV (`anexoI.csv`) é criado no diretório `src/output`.
    - Um `FileWriter` e um `PrintWriter` são usados para escrever os dados extraídos no arquivo CSV.

3. **Extração das Tabelas**:
    - A biblioteca **Tabula** é utilizada para extrair tabelas do PDF.
    - Um iterador de páginas (`PageIterator`) percorre todas as páginas do PDF.
    - As duas primeiras páginas são ignoradas (`pi.next()` chamado duas vezes).

4. **Processamento das Tabelas**:
    - Para cada página, as tabelas são extraídas usando o algoritmo `SpreadsheetExtractionAlgorithm`.
    - Os dados das tabelas são iterados linha por linha e célula por célula.
    - As abreviações `OD` e `AMB` são substituídas por suas descrições completas (`Seg. Odontológica` e `Seg. Ambulatorial`).

5. **Escrita no CSV**:
    - Os dados processados são escritos no arquivo CSV, separados por vírgulas.
    - Cada linha da tabela é escrita como uma nova linha no CSV.

6. **Compactação do CSV**:
    - O arquivo CSV gerado é compactado em um arquivo ZIP chamado `Teste_GustavoMotaMacedo.zip`.

7. **Tratamento de Exceções**:
    - Qualquer erro durante a execução é capturado e lançado como uma exceção runtime.

---

## **Instruções para Execução**

### **Pré-requisitos**
1. **Java Development Kit (JDK)**:
    - Certifique-se de ter o JDK instalado em sua máquina.
    - Verifique a instalação executando `java -version` no terminal.

2. **Dependências**:
    - Adicione as seguintes dependências ao seu projeto:
        - **Apache PDFBox**:
          ```xml
          <dependency>
              <groupId>org.apache.pdfbox</groupId>
              <artifactId>pdfbox</artifactId>
              <version>2.0.27</version>
          </dependency>
          ```
        - **Tabula**:
          ```xml
          <dependency>
              <groupId>technology.tabula</groupId>
              <artifactId>tabula</artifactId>
              <version>1.0.5</version>
          </dependency>
          ```

3. **Diretórios**:
    - Crie os diretórios `src/input` e `src/output` na raiz do projeto.
    - Coloque o arquivo PDF (`anexoI.pdf`) no diretório `src/input`.

4. **Arquivo PDF**:
    - Certifique-se de que o arquivo PDF contém tabelas em um formato estruturado que possa ser extraído pela biblioteca Tabula.

---

### **Executando o Código**
1. Clone ou copie o código para sua máquina.
2. Configure as dependências no seu projeto (usando Maven ou Gradle).
3. Compile o código:
   ```bash
   javac -cp ".;path/to/pdfbox.jar;path/to/tabula.jar" Program.java
   ```
   Substitua `path/to/pdfbox.jar` e `path/to/tabula.jar` pelos caminhos reais das bibliotecas.

4. Execute o programa:
   ```bash
   java -cp ".;path/to/pdfbox.jar;path/to/tabula.jar" application.Program
   ```

5. Após a execução, verifique:
    - O arquivo CSV gerado (`src/output/anexoI.csv`).
    - O arquivo ZIP compactado (`src/Teste_GustavoMotaMacedo.zip`).

---