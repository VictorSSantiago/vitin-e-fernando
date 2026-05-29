// Objeto que armazena o estado da nossa cidade sustentável
const cidade = {
    dia: 0,
    energiaSolar: 0,
    energiaEolica: 0,
    aguaPoupada: 0,
    co2Evitado: 0,

    // Função que gera números aleatórios entre um mínimo e um máximo
    gerarDadosAleatorios(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    },

    // Lógica para avançar o dia e acumular os valores
    simularDia() {
        this.dia += 1;

        const novoSolar = this.gerarDadosAleatorios(100, 500);
        const novoEolico = this.gerarDadosAleatorios(200, 600);
        const novaAgua = this.gerarDadosAleatorios(1000, 5000);

        this.energiaSolar += novoSolar;
        this.energiaEolica += novoEolico;
        this.aguaPoupada += novaAgua;

        // Cada kWh de energia limpa evita aproximadamente 0.4kg de CO₂
        const co2DoDia = (novoSolar + novoEolico) * 0.4;
        this.co2Evitado += co2DoDia;

        // Atualiza a interface gráfica
        this.atualizarInterface();
    },

    // Função que injeta os novos valores direto no HTML
    atualizarInterface() {
        document.getElementById('dia').innerText = this.dia;
        document.getElementById('solar').innerText = this.energiaSolar;
        document.getElementById('eolica').innerText = this.energiaEolica;
        document.getElementById('agua').innerText = this.aguaPoupada;
        document.getElementById('co2').innerText = this.co2Evitado.toFixed(2);
    }
};

// Vincula o clique do botão à função de simulação
document.getElementById('btn-simular').addEventListener('click', () => {
    cidade.simularDia();
});
