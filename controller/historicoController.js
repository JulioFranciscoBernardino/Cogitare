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

    // Você pode remover este método se não for usá-lo por agora,
    // ou mantê-lo para futura expansão, mas ele requer uma SP com parâmetro.
    // async getHistoricoPorId(req, res) {
    //     const idAtendimento = req.params.id;
    //     if (!idAtendimento) {
    //         return res.status(400).json({ sucesso: false, mensagem: 'ID do atendimento é obrigatório.' });
    //     }
    //     try {
    //         const historico = await Historico.listarHistoricoPorIdAtendimento(idAtendimento);
    //         if (historico.length === 0) {
    //             return res.status(404).json({ sucesso: false, mensagem: 'Histórico não encontrado para o ID fornecido.' });
    //         }
    //         res.json({ sucesso: true, historico: historico });
    //     } catch (error) {
    //         console.error('Erro no controller ao buscar histórico por ID:', error.message);
    //         res.status(500).json({ sucesso: false, mensagem: 'Erro interno do servidor ao buscar histórico por ID.' });
    //     }
    // }
};

module.exports = historicoController;