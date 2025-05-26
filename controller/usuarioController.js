const sql = require('mssql');
const dbConfig = require('../config/db');
const Usuario = require('../model/usuarioModel');

const usuarioController = {
    async login(req, res) {
        const { usuario, senha } = req.body;

        try {
            const usuarioLogado = await Usuario.validarLogin(usuario, senha);
            if (usuarioLogado) {
                req.session.usuario = {
                    id: usuarioLogado.IdAdministrador || usuarioLogado.id,
                    nome: usuarioLogado.nome || usuarioLogado.Usuario,
                    tipo: usuarioLogado.tipo || usuarioLogado.Tipo,
                    loginTime: Date.now()
                };
                // *** MUDANÇA AQUI ***
                res.json({ sucesso: true, redirectUrl: '/view/index.html' }); // Envia a URL para o frontend
            } else {
                res.json({ sucesso: false, mensagem: 'Usuário ou senha inválidos.' });
            }
        } catch (error) {
            console.error('Erro no login:', error);
            res.status(500).json({ sucesso: false, mensagem: 'Erro interno no servidor.' });
        }
    },

    async logout(req, res) {
        try {
            const idAdm = req.session.usuario?.id;
            if (idAdm) {
                const pool = await sql.connect(dbConfig);
                await pool.request()
                    .input('IdAdministrador', sql.Int, idAdm)
                    .execute('sp_Logout_Administrador');
            }

            req.session.destroy(err => {
                if (err) {
                    console.error('Erro ao destruir sessão:', err);
                    return res.status(500).json({ sucesso: false, mensagem: 'Erro ao encerrar sessão' });
                }   
                res.redirect('/view/login.html?logout=true');
            });
        } catch (error) {
            console.error('Erro no logout:', error);
            res.status(500).json({ sucesso: false, mensagem: 'Erro no logout' });
        }
    }
};

module.exports = usuarioController;