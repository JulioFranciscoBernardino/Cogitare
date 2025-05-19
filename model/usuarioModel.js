const sql = require('mssql');
const dbConfig = require('../config/db');

const Usuario = {
    async validarLogin(email, senha) {
        try {
            let pool = await sql.connect(dbConfig);
            const result = await pool.request()
                .input('email', sql.VarChar, email)
                .input('senha', sql.VarChar, senha)
                .query('SELECT * FROM Usuarios WHERE email = @email AND senha = @senha');
            return result.recordset[0];
        } catch (err) {
            throw new Error('Erro ao validar login: ' + err.message);
        }
    }
};

module.exports = Usuario;
