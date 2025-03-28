<template>
    <div class="centered-div">
        <!-- Input para pesquisar -->
        <div class="mb-3">
            <label for="searchInput" class="form-label">
                <h1>Consulte a Operadora</h1>
            </label>
            <input type="text" v-model="searchInput" placeholder="Consulte a Operadora"
                @keyup.enter="fetchOperadoraData" class="form-control" />
            <button class="btn btn-primary" @click="fetchOperadoraData">Pesquisar</button>
        </div>

        <!-- Exibição dos dados -->
        <div class="card-list" v-if="operadorasArray.length > 0">
            <div v-for="(operadora, index) in operadorasArray" :key="index" class="card mb-3" style="width: 28rem;">
                <div class="card-body">
                    <h5 class="card-title">{{ operadora.nome }}</h5>
                    <p class="card-text" v-for="(value, key) in operadora" :key="key">
                        <span v-if="typeof value !== 'object'">
                            {{ formatKey(key) }}: {{ value }}
                        </span>
                        <span v-else>
                            {{ formatKey(key) }}:
                            <ul>
                                <li v-for="(subValue, subKey) in value" :key="subKey">
                                    {{ formatKey(subKey) }}: {{ subValue }}
                                </li>
                            </ul>
                        </span>
                    </p>
                </div>
            </div>
        </div>

        <!-- Mensagens de erro ou aviso -->
        <div v-else-if="errorMessage" class="alert alert-danger" role="alert">
            {{ errorMessage }}
        </div>
        <div v-else class="alert alert-info" role="alert">
            Nenhuma operadora encontrada.
        </div>
    </div>
</template>

<script>
export default {
    name: 'SearchResult',
    data() {
        return {
            searchInput: "",
            operadoraData: null,
            errorMessage: null,
            operadorasArray: [], // ✅ Adicione esta linha
        };
    },
    methods: {
        formatKey(key) {
            const translations = {
                Registro_ANS: "Registro ANS",
                CNPJ: "CNPJ",
                Razao_Social: "Razão Social",
                Nome_Fantasia: "Nome Fantasia",
                Modalidade: "Modalidade",
                Logradouro: "Logradouro",
                Numero: "Número",
                Complemento: "Complemento",
                Bairro: "Bairro",
                Cidade: "Cidade",
                UF: "UF",
                CEP: "CEP",
                DDD: "DDD",
                Telefone: "Telefone",
                Fax: "Fax",
                Endereco_eletronico: "E-mail",
                Representante: "Representante",
                Cargo_Representante: "Cargo do Representante",
                Regiao_de_Comercializacao: "Região de Comercialização",
                Data_Registro_ANS: "Data de Registro ANS",
            };
            return translations[key] || key.replace(/_/g, ' ');
        },
        async fetchOperadoraData() {
            this.operadoraData = null;
            this.errorMessage = null;
            this.operadorasArray = []; // Limpa o array antes de buscar novos dados

            const apiUrl = `http://127.0.0.1:5000/operadoras/${this.searchInput.toLowerCase()}`;

            try {
                const response = await fetch(apiUrl);

                if (!response.ok) {
                    throw new Error("Operadora não encontrada");
                }

                const dataList = await response.json();

                // Preenche o array com os dados formatados
                dataList.forEach((data) => {
                    this.operadorasArray.push({
                        nome: data.Razao_Social,
                        cnpj: data.CNPJ,
                        modalidade: data.Modalidade,
                        endereco: {
                            logradouro: data.Logradouro,
                            numero: data.Numero,
                            complemento: data.Complemento,
                            bairro: data.Bairro,
                            cidade: data.Cidade,
                            uf: data.UF,
                            cep: data.CEP,
                        },
                        contato: {
                            ddd: data.DDD,
                            telefone: data.Telefone,
                            fax: data.Fax || null, // Transforma string vazia em null
                            email: data.Endereco_eletronico,
                        },
                        representante: {
                            nome: data.Representante,
                            cargo: data.Cargo_Representante,
                        },
                        registroAns: data.Registro_ANS,
                        regiaoComercializacao: data.Regiao_de_Comercializacao || null,
                        dataRegistroAns: new Date(data.Data_Registro_ANS).toISOString().split('T')[0],
                    });
                });

            } catch (error) {
                this.errorMessage = error.message || "Ocorreu um erro ao buscar a Operadora.";
            }
        },
    },
};
</script>

<style scoped>
.centered-div {
    display: flex;
    flex-direction: column;
    height: 100%;
    max-width: 100vw;
    margin: auto;
    padding: 5rem;

    flex-wrap: wrap;
    align-items: center;
    justify-content: center;
}

.card-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-evenly;
}

.card {
    box-shadow: 2px 2px 5cap 1px rgba(0, 0, 0, 0.1);
}
.btn {
    margin-top: 1rem;
}
</style>