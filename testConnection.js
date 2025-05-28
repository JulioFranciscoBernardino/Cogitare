
require('dotenv').config();
const sql = require('mssql');

const dbConfig = {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    server: process.env.DB_SERVER,
    port: parseInt(process.env.DB_PORT),
    database: process.env.DB_DATABASE,
    options: {
        encrypt: true,
        trustServerCertificate: true
    }
};

async function testarConexao() {
  try {
    let pool = await sql.connect(dbConfig);
    console.log('Conexão ao banco realizada com sucesso!');
    await pool.close();
  } catch (error) {
    console.error('Erro na conexão:', error);
  }
}

testarConexao();