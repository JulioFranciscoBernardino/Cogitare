require('dotenv').config();
const express = require('express');
const path = require('path');
const session = require('express-session');
const dbConfig = require('./config/db');
const sql = require('mssql');

// Importar rotas
const usuarioRoute = require('./routes/usuarioRoute');
const historicoRoute = require('./routes/historicoRoute');

const app = express();
const PORT = process.env.PORT || 3000;

// Configuração da sessão (30 minutos)
app.use(session({
    secret: process.env.KEY,
    resave: false,
    saveUninitialized: true,
    cookie: {
        maxAge: 30 * 60 * 1000 // 30 minutos
    }
}));

// Middlewares para parsing de requisições
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Middleware para verificar sessão expirada
app.use((req, res, next) => {
    // Verifica se a sessão existe e se o tempo de login excedeu 30 minutos
    if (req.session.usuario && (Date.now() - req.session.usuario.loginTime > 30 * 60 * 1000)) {
        req.session.destroy(err => {
            if (err) {
                console.error('Erro ao destruir sessão:', err);
            }
        });
        // Determina se a requisição é de API (XHR/fetch) ou navegação direta
        if (req.xhr || req.headers.accept.includes('json') || req.originalUrl.startsWith('/api/')) {
            // Se for requisição de API, retorna um erro JSON 401
            return res.status(401).json({ sucesso: false, mensagem: 'Sessão expirada. Por favor, faça login novamente.' });
        } else {
            // Se for navegação direta, redireciona para a página de login
            return res.redirect('/view/login.html?sessaoExpirada=true');
        }
    }
    next();
});

// Servir arquivos estáticos (CSS, JS, Imagens) e páginas de visualização
// As rotas de login e o diretório 'view' são servidos estaticamente
app.use('/view/login.html', express.static(path.join(__dirname, 'view', 'login.html')));
app.use('/css', express.static(path.join(__dirname, 'public', 'css')));
app.use('/js', express.static(path.join(__dirname, 'public', 'js')));
app.use('/imagens', express.static(path.join(__dirname, 'public', 'imagens')));
app.use('/view', express.static(path.join(__dirname, 'view'))); // Serve todo o diretório 'view' para acesso direto

// Protege o index.html, garantindo que o usuário esteja logado
app.get('/view/index.html', (req, res) => {
    if (!req.session.usuario) {
        return res.redirect('/view/login.html');
    }
    res.sendFile(path.join(__dirname, 'view', 'index.html'));
});

//rotas 
app.use('/', usuarioRoute);
app.use('/', historicoRoute);

// Redirecionamento da raiz do site
app.get('/', (req, res) => {
    if (req.session.usuario) {
        res.redirect('/view/index.html');
    } else {
        res.redirect('/view/login.html');
    }
});

// Bloco de código para migração de senhas (comentado, como no seu original)
// async function migrarSenhas() {
//     try {
//         const pool = await sql.connect(dbConfig);
//         const result = await pool.request()
//             .query('SELECT IdAdministrador, Senha FROM Administrador');
//
//         for (const usuario of result.recordset) {
//             if (usuario.Senha.startsWith('$2b$')) continue; // Evita recriptografar senhas já com hash
//
//             const senhaHash = await bcrypt.hash(usuario.Senha, 10);
//
//             await pool.request()
//                 .input('Id', sql.Int, usuario.IdAdministrador)
//                 .input('SenhaHash', sql.VarChar, senhaHash)
//                 .query('UPDATE Administrador SET Senha = @SenhaHash WHERE IdAdministrador = @Id');
//
//             console.log(`Senha criptografada para usuário ID ${usuario.IdAdministrador}`);
//         }
//
//         console.log('Todas as senhas foram criptografadas com sucesso.');
//     } catch (err) {
//         console.error('Erro ao criptografar senhas:', err);
//     }
// }

// Chamada automática na inicialização (comentada, como no seu original)
// migrarSenhas();

// Iniciar o servidor
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});