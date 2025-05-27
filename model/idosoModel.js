const sql = require('mssql');
const dbConfig = require('../config/db');

const Idoso = {
    async listar() {
        const pool = await sql.connect(dbConfig);
        const result = await pool.request().execute('sp_ListarIdosos');
        return result.recordset;
    },

    async criar(dados) {
        const pool = await sql.connect(dbConfig);
        await pool.request()
            .input('IdResponsavel', sql.Int, dados.IdResponsavel)
            .input('IdMobilidade', sql.Int, dados.IdMobilidade)
            .input('IdNivelAutonomia', sql.Int, dados.IdNivelAutonomia)
            .input('Nome', sql.NVarChar, dados.Nome)
            .input('DataNascimento', sql.Date, dados.DataNascimento)
            .input('Sexo', sql.NVarChar, dados.Sexo)
            .input('CuidadosMedicos', sql.NVarChar, dados.CuidadosMedicos)
            .input('DescricaoExtra', sql.NVarChar, dados.DescricaoExtra)
            .input('FotoUrl', sql.NVarChar, dados.FotoUrl)
            .execute('sp_CriarIdoso');
    },

    async atualizar(id, dados) {
        const pool = await sql.connect(dbConfig);
        await pool.request()
            .input('IdIdoso', sql.Int, id)
            .input('IdResponsavel', sql.Int, dados.IdResponsavel)
            .input('IdMobilidade', sql.Int, dados.IdMobilidade)
            .input('IdNivelAutonomia', sql.Int, dados.IdNivelAutonomia)
            .input('Nome', sql.NVarChar, dados.Nome)
            .input('DataNascimento', sql.Date, dados.DataNascimento)
            .input('Sexo', sql.NVarChar, dados.Sexo)
            .input('CuidadosMedicos', sql.NVarChar, dados.CuidadosMedicos)
            .input('DescricaoExtra', sql.NVarChar, dados.DescricaoExtra)
            .input('FotoUrl', sql.NVarChar, dados.FotoUrl)
            .execute('sp_AtualizarIdoso');
    },

    async excluir(id) {
        const pool = await sql.connect(dbConfig);
        await pool.request()
            .input('IdIdoso', sql.Int, id)
            .execute('sp_ExcluirIdoso');
    }
};

module.exports = Idoso;
