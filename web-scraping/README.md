# Documentação do Código: Program

Este código é uma aplicação Java que utiliza o Selenium WebDriver para automatizar a navegação em um site específico, baixar arquivos PDF e compactá-los em um arquivo ZIP. Abaixo, você encontrará uma explicação detalhada de cada parte do código, bem como instruções sobre como executá-lo em sua máquina.

---

## **Descrição Geral**

O programa realiza as seguintes tarefas:

1. Configura o navegador Chrome com opções personalizadas para facilitar o download de arquivos.
2. Acessa um site do governo brasileiro que disponibiliza anexos relacionados ao "Rol de Procedimentos".
3. Baixa dois arquivos PDF (Anexo I e Anexo II) disponíveis no site.
4. Compacta os arquivos baixados em um único arquivo ZIP.
5. Limpa o diretório de saída antes de iniciar o processo.

---

## **Estrutura do Código**

### **1. Importações**
O código importa bibliotecas necessárias para:
- Automatização do navegador (`org.openqa.selenium.*`).
- Manipulação de arquivos e diretórios (`java.io.File`, `java.nio.file.*`).
- Compactação de arquivos (`java.util.zip.*`).

### **2. Métodos Principais**

#### **`setupChromeOptions()`**
- **Descrição**: Configura preferências do navegador Chrome para evitar prompts de download e definir o diretório padrão para salvar os arquivos baixados.
- **Opções configuradas**:
    - `download.prompt_for_download`: Desativa prompts de download.
    - `download.default_directory`: Define o diretório onde os arquivos serão salvos.
    - `plugins.always_open_pdf_externally`: Garante que arquivos PDF sejam baixados em vez de abertos no navegador.

#### **`setupDriver()`**
- **Descrição**: Inicializa o WebDriver do Chrome com as opções configuradas.
- **Passos**:
    1. Define o caminho para o executável `chromedriver.exe`.
    2. Aplica as preferências configuradas em `setupChromeOptions()`.

#### **`compressFiles(Path outputFile, Path... files)`**
- **Descrição**: Compacta os arquivos especificados em um arquivo ZIP.
- **Funcionamento**:
    - Cria um fluxo de saída para o arquivo ZIP.
    - Itera sobre os arquivos fornecidos, adicionando-os ao ZIP com seus nomes originais.

#### **`mapFilesToPath()`**
- **Descrição**: Mapeia os arquivos baixados no diretório de saída para um array de objetos `Path`.
- **Funcionamento**:
    - Lista todos os arquivos no diretório de saída.
    - Converte cada arquivo em um objeto `Path`.

#### **`clearOutputDir()`**
- **Descrição**: Limpa o diretório de saída, removendo todos os arquivos existentes.
- **Importância**: Garante que não haja arquivos antigos no diretório antes de iniciar o processo.

#### **`main(String[] args)`**
- **Descrição**: Método principal que coordena todas as operações.
- **Passos**:
    1. Limpa o diretório de saída.
    2. Inicializa o WebDriver.
    3. Navega até o site alvo e fecha o banner de cookies.
    4. Localiza e clica nos links para baixar os arquivos Anexo I e Anexo II.
    5. Aguarda o download dos arquivos.
    6. Compacta os arquivos baixados em um arquivo ZIP.
    7. Encerra o WebDriver.

---

## **Instruções para Execução**

### **Pré-requisitos**
1. **Java Development Kit (JDK)**:
    - Certifique-se de ter o JDK instalado em sua máquina.
    - Verifique a instalação executando `java -version` no terminal.

2. **Maven ou Gradle** (opcional):
    - O código utiliza dependências externas, como o Selenium WebDriver. Se você estiver usando Maven ou Gradle, adicione as dependências abaixo ao seu projeto.

   **Dependência Maven para Selenium**:
   ```xml
   <dependency>
       <groupId>org.seleniumhq.selenium</groupId>
       <artifactId>selenium-java</artifactId>
       <version>4.10.0</version>
   </dependency>
   ```

3. **ChromeDriver**:
    - Faça o download do ChromeDriver compatível com sua versão do Google Chrome.
    - Extraia o executável e coloque-o no caminho especificado no código (`C:\\libs\\chromedriver-win64\\chromedriver.exe`).

4. **Diretório de Saída**:
    - Crie a pasta `src/output` na raiz do projeto para armazenar os arquivos baixados.

### **Executando o Código**
1. Clone ou copie o código para sua máquina.
2. Configure o caminho do ChromeDriver conforme necessário.
3. Compile e execute o programa:
    - Se estiver usando o terminal:
      ```bash
      javac Program.java
      java Program
      ```
    - Se estiver usando uma IDE (como IntelliJ IDEA ou Eclipse), basta executar o método `main`.

4. Após a execução, verifique o arquivo `output.zip` gerado na raiz do projeto.

---

# Documentação do Código: **ProgramTest**

Este código é uma suíte de testes JUnit para o programa `Program.java`. Ele valida as funcionalidades implementadas no código principal, garantindo que os métodos de automação e manipulação de arquivos funcionem conforme o esperado. Abaixo, você encontrará uma explicação detalhada de cada parte do código, bem como instruções sobre como executá-lo em sua máquina.

---

## **Descrição Geral**

A classe `ProgramTest` utiliza o framework **JUnit** para realizar testes unitários e de integração no código `Program.java`. Os testes validam as seguintes funcionalidades:

1. Inicialização e encerramento do WebDriver.
2. Navegação básica (ex.: acessar o Google).
3. Download de arquivos PDF a partir de um site específico.
4. Compactação de arquivos em um arquivo ZIP.
5. Limpeza do diretório de saída após a execução.

Os testes são divididos em métodos anotados com `@Before`, `@After` e `@Test`, garantindo que o ambiente seja configurado corretamente antes de cada teste e limpo após sua conclusão.

---

## **Estrutura do Código**

### **1. Importações**
O código importa bibliotecas necessárias para:
- Testes JUnit (`org.junit.*`).
- Automatização do navegador (`org.openqa.selenium.*`).
- Manipulação de arquivos (`java.io.File`).

### **2. Métodos Principais**

#### **`webdriverSetup()`**
- **Anotação**: `@Before`
- **Descrição**: Configura o WebDriver do Chrome chamando o método `setupDriver()` da classe `Program`.
- **Importância**: Garante que o WebDriver esteja inicializado antes de cada teste.

#### **`webdriverQuit()`**
- **Anotação**: `@After`
- **Descrição**: Encerra o WebDriver chamando o método `quit()` da instância `driver` da classe `Program`.
- **Importância**: Libera recursos e fecha o navegador após cada teste.

---

### **3. Testes Unitários**

#### **`openWebdriverTest()`**
- **Anotação**: `@Test`
- **Descrição**: Verifica se o WebDriver consegue abrir uma página simples (Google).
- **Funcionamento**:
    - Acessa o site "https://www.google.com".
    - Não há verificações explícitas neste teste, mas a ausência de exceções indica sucesso.

#### **`downloadFileTest()`**
- **Anotação**: `@Test`
- **Descrição**: Valida o download de arquivos PDF a partir do site do governo brasileiro.
- **Funcionamento**:
    1. Navega até o site alvo e fecha o banner de cookies.
    2. Localiza e clica no link para baixar o Anexo I.
    3. Aguarda 20 segundos para garantir que o download seja concluído.
    4. Verifica se o diretório de saída existe, é um diretório e contém pelo menos um arquivo.

#### **`compressFilesTest()`**
- **Anotação**: `@Test`
- **Descrição**: Valida a compactação de arquivos em um arquivo ZIP.
- **Funcionamento**:
    - Chama o método `compressFiles()` da classe `Program` para criar um arquivo ZIP vazio.
    - Verifica se o arquivo ZIP foi criado.

#### **`compressOutputFilesTest()`**
- **Anotação**: `@Test`
- **Descrição**: Valida a compactação dos arquivos baixados no diretório de saída.
- **Funcionamento**:
    - Chama o método `compressFiles()` com os arquivos mapeados no diretório de saída.
    - Verifica se o arquivo ZIP foi criado.

#### **`clearOutputDirTest()`**
- **Anotação**: `@Test`
- **Descrição**: Valida a limpeza do diretório de saída.
- **Funcionamento**:
    - Chama o método `clearOutputDir()` da classe `Program`.
    - Verifica se o diretório de saída existe e está vazio.

---

## **Relação com o Código `Program.java`**

Os testes implementados em `ProgramTest` estão diretamente relacionados aos métodos da classe `Program`. Cada teste valida uma funcionalidade específica:

| **Método em `ProgramTest`**       | **Método Correspondente em `Program`** |
|-----------------------------------|-----------------------------------------|
| `webdriverSetup()`               | `setupDriver()`                        |
| `openWebdriverTest()`            | Navegação básica com `driver.get()`    |
| `downloadFileTest()`             | Download de arquivos                   |
| `compressFilesTest()`            | `compressFiles()`                      |
| `compressOutputFilesTest()`      | `compressFiles()` com `mapFilesToPath()` |
| `clearOutputDirTest()`           | `clearOutputDir()`                     |

Essa relação garante que todas as funcionalidades principais de `Program.java` sejam testadas de forma isolada e integrada.

---

## **Instruções para Execução**

### **Pré-requisitos**
1. **Java Development Kit (JDK)**:
    - Certifique-se de ter o JDK instalado em sua máquina.
    - Verifique a instalação executando `java -version` no terminal.

2. **JUnit**:
    - Adicione a dependência do JUnit ao seu projeto. Se estiver usando Maven, adicione o seguinte ao `pom.xml`:
      ```xml
      <dependency>
          <groupId>junit</groupId>
          <artifactId>junit</artifactId>
          <version>4.13.2</version>
          <scope>test</scope>
      </dependency>
      ```

3. **Selenium WebDriver**:
    - Certifique-se de que as dependências do Selenium estejam configuradas, conforme descrito na documentação de `Program.java`.

4. **ChromeDriver**:
    - Configure o caminho para o executável `chromedriver.exe` no método `setupDriver()` da classe `Program`.

5. **Diretório de Saída**:
    - Crie a pasta `src/output` na raiz do projeto para armazenar os arquivos baixados.

### **Executando os Testes**
1. Clone ou copie os códigos `Program.java` e `ProgramTest.java` para sua máquina.
2. Compile os arquivos:
   ```bash
   javac -cp ".;path/to/junit.jar;path/to/selenium.jar" ProgramTest.java
   ```
   Substitua `path/to/junit.jar` e `path/to/selenium.jar` pelos caminhos reais das bibliotecas.

3. Execute os testes:
   ```bash
   java -cp ".;path/to/junit.jar;path/to/selenium.jar" org.junit.runner.JUnitCore ProgramTest
   ```

4. Verifique os resultados no terminal. Todos os testes devem passar sem erros.