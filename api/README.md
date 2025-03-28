# Documentação do Projeto: API de Consulta de Operadoras de Saúde

Este projeto consiste em uma aplicação completa para consultar operadoras de planos de saúde. Ele inclui um backend (API Flask), um frontend (Vue.js) e scripts SQL para configuração do banco de dados. Abaixo, você encontrará uma explicação detalhada de cada arquivo e instruções sobre como configurar e utilizar o projeto.

---

## Estrutura do Projeto


projeto/
├── app.py                # Backend da API Flask
├── Search.vue            # Frontend Vue.js para pesquisa
├── setup_db_and_table.sql # Script SQL para configuração do banco de dados
└── README.md             # Documentação do projeto

---

## Descrição dos Arquivos

### 1. `setup_db_and_table.sql`
**Descrição**: Script SQL para configurar o banco de dados MySQL e carregar os dados iniciais.

#### Funcionalidades:
- Cria o banco de dados `python_api` (se não existir).
- Define a tabela `operadoras` com todos os campos necessários.
- Importa dados de um arquivo CSV (`Relatorio_cadop.csv`) para a tabela `operadoras`.

#### Como Usar:
1. **Pré-requisitos**:
   - Instale o MySQL Server e configure um usuário com permissões de criação de banco de dados e tabelas.
   - Certifique-se de que o arquivo `Relatorio_cadop.csv` esteja no diretório especificado no script (`C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/...`).

2. **Execução**:
   - Abra o terminal MySQL ou use uma ferramenta como MySQL Workbench.
   - Execute o script:
     bash
     mysql -u root -p < setup_db_and_table.sql
     
   - Insira a senha do usuário MySQL quando solicitado.

3. **Resultado**:
   - O banco de dados `python_api` será criado.
   - A tabela `operadoras` será populada com os dados do arquivo CSV.

---

### 2. `app.py`
**Descrição**: Backend da API Flask para consulta de operadoras.

#### Funcionalidades:
- Fornece um endpoint (`GET /operadoras/{text}`) para buscar operadoras por termo de pesquisa.
- Conecta-se ao banco de dados MySQL usando SQLAlchemy.
- Retorna os resultados no formato JSON.

#### Como Usar:
1. **Pré-requisitos**:
   - Instale as dependências Python necessárias:
     bash
     pip install flask flask-sqlalchemy flask-cors pymysql
     
   - Certifique-se de que o MySQL está rodando e o banco de dados `python_api` foi configurado corretamente.

2. **Configuração**:
   - Altere a URI do banco de dados no arquivo `app.py` se necessário:
     python
     app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://usuario:senha@localhost/python_api'
     

3. **Execução**:
   - Inicie a API:
     bash
     python app.py
     
   - A API estará disponível em `http://localhost:8080`.

4. **Teste**:
   - Use uma ferramenta como Postman ou o navegador para testar o endpoint:
     
     GET http://localhost:8080/operadoras/hapvida
     

---

### 3. `Search.vue`
**Descrição**: Frontend Vue.js para pesquisa de operadoras.

#### Funcionalidades:
- Permite ao usuário inserir um termo de pesquisa e exibir os resultados.
- Faz requisições à API backend (`GET /operadoras/{text}`).
- Exibe os dados das operadoras em cards formatados.

#### Como Usar:
1. **Pré-requisitos**:
   - Instale Node.js e npm.
   - Certifique-se de que a API backend está rodando.

2. **Configuração**:
   - Altere a URL da API no método `fetchOperadoraData()` se necessário:
     javascript
     const apiUrl = `http://127.0.0.1:5000/operadoras/${this.searchInput.toLowerCase()}`;
     

3. **Execução**:
   - Adicione o componente `Search.vue` ao seu projeto Vue.js.
   - Execute o projeto Vue:
     bash
     npm install
     npm run serve
     
   - Acesse a interface no navegador em `http://localhost:8080` (ou outra porta configurada).

4. **Uso**:
   - Insira um termo de pesquisa (ex: "hapvida") no campo de texto.
   - Clique no botão "Pesquisar" ou pressione Enter.
   - Os resultados serão exibidos em cards abaixo do campo de pesquisa.

---

## Fluxo Completo do Projeto

1. **Configuração Inicial**:
   - Execute o script SQL (`setup_db_and_table.sql`) para criar o banco de dados e carregar os dados.
   - Configure e inicie a API Flask (`app.py`).

2. **Frontend**:
   - Configure e execute o frontend Vue.js (`Search.vue`).

3. **Testes**:
   - Acesse a interface do frontend no navegador.
   - Realize pesquisas e verifique os resultados.

---

## Observações Importantes

### 1. Problemas Comuns
- **Erro de Conexão ao Banco de Dados**:
  - Verifique as credenciais no arquivo `app.py`.
  - Certifique-se de que o MySQL está rodando.

- **Arquivo CSV Não Encontrado**:
  - Verifique o caminho do arquivo no script SQL.
  - Certifique-se de que o MySQL tem permissão para acessar o diretório.

- **CORS**:
  - Se o frontend e o backend estiverem em domínios diferentes, ajuste as configurações de CORS no `app.py`.

### 2. Melhorias Recomendadas
- Adicionar autenticação na API.
- Implementar paginação nos resultados.
- Criar testes unitários para o backend e frontend.
- Mover variáveis sensíveis (como credenciais) para arquivos de ambiente.

---

## Conclusão

Este projeto fornece uma solução completa para consultar operadoras de planos de saúde. Ao seguir as instruções acima, você poderá configurar e utilizar o sistema de forma eficiente. Caso tenha dúvidas ou encontre problemas, consulte a documentação oficial das tecnologias utilizadas ou entre em contato com o desenvolvedor responsável.
