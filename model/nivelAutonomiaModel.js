const sql = require('mssql');
const dbConfig = require('../config/db');

const NivelAutonomia = {
    async listar() {
        const pool = await sql.connect(dbConfig);
        const result = await pool.request().query('SELECT IdNivelAutonomia, Descricao FROM NivelAutonomia');
        return result.recordset;
    }
};

module.exports = NivelAutonomia;
