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
            const IdAdministrador = req.session.usuario?.id;

            if (!IdAdministrador) {
                return res.status(401).json({ erro: 'Administrador não autenticado' });
            }

            const dados = {
                ...req.body,
                IdAdministrador
            };

            await Idoso.criar(dados);
            res.status(201).json({ mensagem: 'Idoso criado com sucesso' });
        } catch (error) {
            console.error('Erro ao criar idoso:', error);
            res.status(500).json({ erro: 'Erro ao criar idoso' });
        }
    },


    async atualizar(req, res) {
        try {
            const IdAdministrador = req.session.usuario?.id;

            if (!IdAdministrador) {
                return res.status(401).json({ erro: 'Administrador não autenticado' });
            }

            const dados = {
                ...req.body,
                IdAdministrador
            };

            const id = parseInt(req.params.id);
            await Idoso.atualizar(id, dados);
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
    },

    async listarMobilidade(req, res) {
        try {
            const mobilidade = await Idoso.listarMobilidade();
            res.json(mobilidade);
        } catch (error) {
            console.error('Erro ao listar mobilidade:', error);
            res.status(500).json({ erro: 'Erro ao listar mobilidade' });
        }
    },

    async listarNivelAutonomia(req, res) {
        try {
            const niveis = await Idoso.listarNivelAutonomia();
            res.json(niveis);
        } catch (error) {
            console.error('Erro ao listar nível de autonomia:', error);
            res.status(500).json({ erro: 'Erro ao listar nível de autonomia' });
        }
    },

    async listarResponsavel(req, res) {
        try {
            const responsaveis = await Idoso.listarResponsavel();
            res.json(responsaveis);
        } catch (error) {
            console.error('Erro ao listar responsáveis:', error);
            res.status(500).json({ erro: 'Erro ao listar responsáveis' });
        }
    }
};

module.exports = idososController;
