require('dotenv').config(); 
const express = require('express');
const sql = require('mssql');
const path = require('path');
const session = require('express-session');

const app = express(); // 👉 Isso vem antes de usar app.use
const PORT = process.env.PORT || 3000;

// Sessão (30 minutos de duração)
app.use(session({
    secret: process.env.KEY || 'chave-secreta-cogitare',
    resave: false,
    saveUninitialized: true,
    cookie: {
        maxAge: 30 * 60 * 1000 // 30 minutos
    }
}));

// Middleware para analisar o corpo da requisição
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Serve arquivos estáticos da pasta 'public'
app.use(express.static(path.join(__dirname, 'public')));

// Configuração do banco de dados
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

// Middleware para verificar se a sessão expirou
app.use((req, res, next) => {
    if (req.session.usuario && (Date.now() - req.session.ultimaAtividade > 30 * 60 * 1000)) {
        req.session.destroy(); // Expirou
        return res.redirect('/public/html/LoginForm');
    } else if (req.session.usuario) {
        req.session.ultimaAtividade = Date.now(); // Atualiza atividade
    }
    next();
});

// Rota raiz: redireciona para o login ou dashboard com base na sessão
app.get('/', (req, res) => {
    if (req.session.usuario) {
        res.redirect('/public/html/dashboard.html');
    } else {
        res.redirect('/public/html/LoginForm');
    }
});

// Rota para exibir o formulário de login
app.get('/public/html/LoginForm', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'html', 'login.html'));
});

// Conexão com o banco
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
