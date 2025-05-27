const sql = require('mssql');
const dbConfig = require('../config/db');

const Mobilidade = {
    async listar() {
        const pool = await sql.connect(dbConfig);
        const result = await pool.request().query('SELECT IdMobilidade, Descricao FROM Mobilidade');
        return result.recordset;
    }
};

module.exports = Mobilidade;
