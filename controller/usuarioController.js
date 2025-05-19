const Usuario = require('../model/usuarioModel');

const usuarioController = {
    async login(req, res) {
        const { usuario, senha } = req.body;

        try {
            const usuarioLogado = await Usuario.validarLogin(usuario, senha);
            if (usuarioLogado) {
                req.session.usuario = {
                    id: usuarioLogado.id,
                    nome: usuarioLogado.nome,
                    tipo: usuarioLogado.tipo,
                    loginTime: Date.now()
                };
                res.json({ sucesso: true });
            } else {
                res.json({ sucesso: false, mensagem: 'Usuário ou senha inválidos.' });
            }
        } catch (error) {
            res.status(500).json({ sucesso: false, mensagem: 'Erro interno no servidor.' });
        }
    },

    logout(req, res) {
        req.session.destroy(() => {
            res.redirect('/view/login.html?logout=true');
        });
    }
};

module.exports = usuarioController;
