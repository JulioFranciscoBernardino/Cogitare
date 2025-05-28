// controller/historicoController.js
const Historico = require('../model/historicoModel'); // Caminho para o seu historicoModel.js

const historicoController = {
    async getHistoricos(req, res) {
        try {
            const historicos = await Historico.listarTodosHistoricos();
            res.json({ sucesso: true, historicos: historicos });
        } catch (error) {
            console.error('Erro no controller ao buscar históricos:', error.message);
            res.status(500).json({ sucesso: false, mensagem: 'Erro interno do servidor ao buscar histórico.' });
        }
    },
    
};

module.exports = historicoController;