const sql = require('mssql');
const dbConfig = require('../config/db');

const Responsavel = {
    async listar() {
        const pool = await sql.connect(dbConfig);
        const result = await pool.request().query('SELECT IdResponsavel, Nome FROM Responsavel');
        return result.recordset;
    }
};

module.exports = Responsavel;
