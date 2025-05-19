require('dotenv').config(); 
const express = require('express');
const sql = require('mssql');
const path = require('path');
const session = require('express-session');

const app = express();
const PORT = process.env.PORT || 3000;

// Sessão (30 minutos de duração)
app.use(session({
    secret: process.env.KEY || 'f6517cf5b71f088613fdac5bcc3f5253d749720256b8d7bfb523a9f3a7cc708417b62d6efd3fbe73e96a310b3e6ba27219c5acf9c3685a3bc0dff286ee79a500',
    resave: false,
    saveUninitialized: true,
    cookie: {
        maxAge: 30 * 60 * 1000 // 30 minutos
    }
}));

// Middleware para analisar o corpo da requisição
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Serve arquivos estáticos da pasta 'view'
app.use(express.static(path.join(__dirname, 'view')));

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
        return res.redirect('/view/login.html');
    } else if (req.session.usuario) {
        req.session.ultimaAtividade = Date.now(); // Atualiza atividade
    }
    next();
});

// Rota raiz: redireciona para o login ou dashboard com base na sessão
app.get('/', (req, res) => {
    if (req.session.usuario) {
        res.redirect('/view/index.html');
    } else {
        res.redirect('/view/login.html');
    }
});

// Rota para exibir o formulário de login
app.get('/view/login.html', (req, res) => {
    res.sendFile(path.join(__dirname, 'view', 'login.html'));
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
