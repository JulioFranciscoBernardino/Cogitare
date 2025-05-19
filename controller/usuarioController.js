const Usuario = require('../model/usuarioModel');

const usuarioController = {
    async login(req, res) {
        const { email, senha } = req.body;

        try {
            const usuario = await Usuario.validarLogin(email, senha);
            if (usuario) {
                req.session.usuario = {
                    id: usuario.id,
                    nome: usuario.nome,
                    email: usuario.email,
                    loginTime: Date.now()
                };
                res.redirect('/view/index.html');
            } else {
                res.redirect('/view/login.html?erro=credenciais');
            }
        } catch (error) {
            res.status(500).send('Erro interno no servidor.');
        }
    },

    logout(req, res) {
        req.session.destroy(() => {
            res.redirect('/view/login.html?logout=true');
        });
    }
};

module.exports = usuarioController;
