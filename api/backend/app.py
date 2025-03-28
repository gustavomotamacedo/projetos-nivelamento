# Api de busca de operadoras
# Endpoints : 
#   GET localhost:5000/operadoras/{text}

import pandas as pd
from flask_sqlalchemy import SQLAlchemy
from flask import Flask, jsonify, request
from flask_cors import CORS

# Inicializa a aplicação Flask
app = Flask(__name__)

# Habilita a CORS para todas as origens
CORS(app)

app.config['JSON_SORT_KEYS'] = False

# Configuração do banco de dados (ajuste para MySQL)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:root@localhost/python_api'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Inicializa o SQLAlchemy com a instância do Flask
db = SQLAlchemy(app)

# Modelo de dados
class Operadora(db.Model):
    __tablename__ = 'operadoras'

    Registro_ANS = db.Column(db.Integer, primary_key=True, nullable=False)
    CNPJ = db.Column(db.CHAR(14), nullable=False)
    Razao_Social = db.Column(db.Text, nullable=False)
    Nome_Fantasia = db.Column(db.String(255), nullable=True)
    Modalidade = db.Column(db.String(50), nullable=False)
    Logradouro = db.Column(db.String(255), nullable=False)
    Numero = db.Column(db.String(20), nullable=False)
    Complemento = db.Column(db.String(100), nullable=True)
    Bairro = db.Column(db.String(100), nullable=False)
    Cidade = db.Column(db.String(100), nullable=False)
    UF = db.Column(db.CHAR(2), nullable=False)
    CEP = db.Column(db.CHAR(8), nullable=False)
    DDD = db.Column(db.CHAR(2), nullable=False)
    Telefone = db.Column(db.String(20), nullable=False)
    Fax = db.Column(db.String(20), nullable=True)
    Endereco_eletronico = db.Column(db.String(255), nullable=False)
    Representante = db.Column(db.String(255), nullable=False)
    Cargo_Representante = db.Column(db.String(100), nullable=False)
    Regiao_de_Comercializacao = db.Column(db.Integer, nullable=True)
    Data_Registro_ANS = db.Column(db.Date, nullable=False)

@app.route('/operadoras/<string:text>', methods=['GET'])
def get_operadoras(text):
    import math
    # Consulta o banco de dados para buscar operadoras com base no texto
    operadoras = Operadora.query.filter(
        (Operadora.Razao_Social.ilike(f'%{text}%')) |
        (Operadora.Nome_Fantasia.ilike(f'%{text}%')) |
        (Operadora.Modalidade.ilike(f'%{text}%')) |
        (Operadora.Logradouro.ilike(f'%{text}%')) |
        (Operadora.Bairro.ilike(f'%{text}%')) |
        (Operadora.Cidade.ilike(f'%{text}%')) |
        (Operadora.UF.ilike(f'%{text}%')) |
        (Operadora.Representante.ilike(f'%{text}%'))
    ).all()
    # Converte os resultados em um DataFrame
    result = []
    for op in operadoras:
        regiao = op.Regiao_de_Comercializacao
        data_registro = op.Data_Registro_ANS
        
        # Substitui NaN por None (que será serializado como null em JSON)
        if regiao is not None and (isinstance(regiao, float) or isinstance(regiao, int)) and math.isnan(regiao):
            regiao = None

        result.append({
            "Registro_ANS": op.Registro_ANS,
            "CNPJ": op.CNPJ,
            "Razao_Social": op.Razao_Social,
            "Nome_Fantasia": op.Nome_Fantasia,
            "Modalidade": op.Modalidade,
            "Logradouro": op.Logradouro,
            "Numero": op.Numero,
            "Complemento": op.Complemento,
            "Bairro": op.Bairro,
            "Cidade": op.Cidade,
            "UF": op.UF,
            "CEP": op.CEP,
            "DDD": op.DDD,
            "Telefone": op.Telefone,
            "Fax": op.Fax,
            "Endereco_eletronico": op.Endereco_eletronico,
            "Representante": op.Representante,
            "Cargo_Representante": op.Cargo_Representante,
            "Regiao_de_Comercializacao": regiao,
            "Data_Registro_ANS": data_registro,
        })

    return jsonify(result)
if __name__ == '__main__':
    app.run(port=8080)  # Substitua 5001 pela porta desejada