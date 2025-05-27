const Mobilidade = require('../model/mobilidadeModel');
const NivelAutonomia = require('../model/nivelAutonomiaModel');
const Responsavel = require('../model/responsavelModel');

const dadosAuxiliaresController = {
    async listarMobilidades(req, res) {
        try {
            const dados = await Mobilidade.listar();
            res.json(dados);
        } catch (error) {
            console.error('Erro ao listar mobilidades:', error);
            res.status(500).json({ erro: 'Erro ao listar mobilidades' });
        }
    },

    async listarNiveis(req, res) {
        try {
            const dados = await NivelAutonomia.listar();
            res.json(dados);
        } catch (error) {
            console.error('Erro ao listar níveis de autonomia:', error);
            res.status(500).json({ erro: 'Erro ao listar níveis de autonomia' });
        }
    },

    async listarResponsaveis(req, res) {
        try {
            const dados = await Responsavel.listar();
            res.json(dados);
        } catch (error) {
            console.error('Erro ao listar responsáveis:', error);
            res.status(500).json({ erro: 'Erro ao listar responsáveis' });
        }
    }
};

module.exports = dadosAuxiliaresController;
