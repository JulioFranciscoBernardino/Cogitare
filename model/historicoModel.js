// model/historicoModel.js
const sql = require('mssql');
const dbConfig = require('../config/db');

const Historico = {
    async listarTodosHistoricos() {
        try {
            const pool = await sql.connect(dbConfig);
            const result = await pool.request().execute('sp_ListarHistoricoAtendimentos'); // <--- AQUI
            await pool.close();
            return result.recordset;
        } catch (err) {
            console.error('Erro ao listar históricos de atendimento no model:', err.message);
            throw new Error('Erro ao buscar históricos de atendimento.');
        }
    }
};

module.exports = Historico;