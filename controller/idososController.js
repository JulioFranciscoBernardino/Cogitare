const Idoso = require('../model/idosoModel');

const idososController = {
    async listar(req, res) {
        try {
            const idosos = await Idoso.listar();
            res.json(idosos);
        } catch (error) {
            console.error('Erro ao listar idosos:', error);
            res.status(500).json({ erro: 'Erro ao listar idosos' });
        }
    },

    async criar(req, res) {
        try {
            await Idoso.criar(req.body);
            res.status(201).json({ mensagem: 'Idoso criado com sucesso' });
        } catch (error) {
            console.error('Erro ao criar idoso:', error);
            res.status(500).json({ erro: 'Erro ao criar idoso' });
        }
    },

    async atualizar(req, res) {
        try {
            const id = parseInt(req.params.id);
            await Idoso.atualizar(id, req.body);
            res.json({ mensagem: 'Idoso atualizado com sucesso' });
        } catch (error) {
            console.error('Erro ao atualizar idoso:', error);
            res.status(500).json({ erro: 'Erro ao atualizar idoso' });
        }
    },

    async excluir(req, res) {
        try {
            const id = parseInt(req.params.id);
            await Idoso.excluir(id);
            res.json({ mensagem: 'Idoso excluído com sucesso' });
        } catch (error) {
            console.error('Erro ao excluir idoso:', error);
            res.status(500).json({ erro: 'Erro ao excluir idoso' });
        }
    }
};

module.exports = idososController;
