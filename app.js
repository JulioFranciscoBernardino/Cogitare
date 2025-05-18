
require('dotenv').config(); 
const express = require('express');
const sql = require('mssql');
const path = require('path');
const session = require('express-session');

app.use(session({
    secret: process.env.KEY,
    resave: false,
    saveUninitialized: true,
    cookie: {
        maxAge: 30 * 60 * 1000 // 30 minutos
    }
}));


const dbConfig = {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    server: process.env.DB_SERVER,
    port: parseInt(process.env.DB_PORT, 10),
    database: process.env.DB_DATABASE,
    options: {
        encrypt: true,
        trustServerCertificate: true
    }
};

const app = express();
const PORT = process.env.PORT || 3000;

// Serve arquivos estáticos da pasta 'public'
app.use(express.static(path.join(__dirname, 'public')));

// Defina a rota para a página de login
app.get('/public/html/LoginForm', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'html', 'login.html'));
});


// Testa a conexão e inicia o servidor
sql.connect(dbConfig)
    .then(pool => {
        if (pool.connected) {
            console.log('Conectado ao SQL Server com sucesso.');
            app.listen(PORT, () => {
                console.log(`Servidor rodando na porta ${PORT}`);
            });
        }
    })
    .catch(err => {
        console.error('Erro ao conectar ao SQL Server:', err);
    });

// Rota simples para teste
app.get('/', (req, res) => {
    res.send('API Cogitare conectada ao SQL Server!');
});
