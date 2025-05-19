const sql = require('mssql');
const bcrypt = require('bcrypt');
const dbConfig = require('../config/db');

const Usuario = {
    async validarLogin(usuario, senha) {
        try {
            const pool = await sql.connect(dbConfig);
            const result = await pool.request()
                .input('Usuario', sql.VarChar, usuario)
                .execute('sp_Login_Administrador');

            const admin = result.recordset[0];

            if (!admin) return null;

            const senhaValida = await bcrypt.compare(senha, admin.Senha);
            if (!senhaValida) return null;

            return {
                id: admin.IdAdministrador,
                nome: admin.Usuario,
                tipo: admin.Tipo,
                ultimoAcesso: admin.UltimoAcesso
            };
        } catch (err) {
            throw new Error('Erro ao validar login: ' + err.message);
        }
    }
};

module.exports = Usuario;
