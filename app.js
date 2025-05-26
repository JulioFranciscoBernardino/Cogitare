require('dotenv').config();
const express = require('express');
const path = require('path');
const session = require('express-session');
// As variáveis dbConfig e sql não são estritamente necessárias aqui se você só as usa no model/controller
// Mas mantê-las não causa dano.
const dbConfig = require('./config/db');
const sql = require('mssql');

// Importar rotas
const usuarioRoute = require('./routes/usuarioRoute');
const historicoRoute = require('./routes/historicoRoute');

const app = express();
const PORT = process.env.PORT || 3000;

// =====================================================================
// ORDEM DOS MIDDLEWARES É CRÍTICA!
// =====================================================================

// 1. Configuração da sessão (DEVE VIR PRIMEIRO, antes de qualquer rota ou outro middleware que precise da sessão)
app.use(session({
    secret: process.env.KEY,
    resave: false,
    saveUninitialized: false, // ESSENCIAL: Muda para 'false' para evitar sessões vazias
    cookie: {
        maxAge: 30 * 60 * 1000, // 30 minutos
        httpOnly: true, // Boa prática de segurança
        secure: process.env.NODE_ENV === 'production' // Usar cookies seguros em produção (HTTPS)
    }
}));

// 2. Middlewares para parsing de requisições (express.urlencoded e express.json)
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// 3. Servir arquivos estáticos (DEVE VIR ANTES do middleware de autenticação/sessão global)
// Isso garante que arquivos CSS, JS, Imagens, e a própria página de login sejam carregados sem serem barrados.
// Não precisa listar cada subpasta aqui, basta o diretório pai.
app.use('/css', express.static(path.join(__dirname, 'public', 'css')));
app.use('/js', express.static(path.join(__dirname, 'public', 'js')));
app.use('/imagens', express.static(path.join(__dirname, 'public', 'imagens')));
app.use('/view', express.static(path.join(__dirname, 'view'))); // Serve todo o diretório 'view'

// 4. Middleware de Autenticação/Sessão (APÓS config da sessão e arquivos estáticos)
// Este middleware verifica a sessão e protege as rotas.
app.use((req, res, next) => {
    // Lista de rotas que NÃO PRECISAM DE AUTENTICAÇÃO/SESSÃO
    const publicPaths = [
        '/',                       // Rota raiz que redireciona
        '/login',                  // Rota POST de login (chamada do JS)
        '/view/login.html'         // Página de login
    ];

    // Verifica se o caminho da requisição é público (incluindo subcaminhos de estáticos e favicon)
    const isPublicPath = publicPaths.some(publicPath => req.path === publicPath || (publicPath !== '/' && req.path.startsWith(publicPath + '/'))) ||
                         req.path.startsWith('/css/') ||
                         req.path.startsWith('/js/') ||
                         req.path.startsWith('/imagens/') ||
                         req.path === '/favicon.ico';

    // Se a rota for pública, continua sem verificar a sessão.
    if (isPublicPath) {
        return next();
    }

    // Se a rota NÃO é pública e não há sessão ativa, redireciona ou retorna 401
    if (!req.session.usuario) {
        // *** CORREÇÃO DO TypeError AQUI: Garante que req.headers.accept existe ***
        if (req.xhr || (req.headers.accept && req.headers.accept.includes('json')) || req.originalUrl.startsWith('/api/')) {
            return res.status(401).json({ sucesso: false, mensagem: 'Não autorizado. Faça login para acessar esta funcionalidade.' });
        } else {
            return res.redirect('/view/login.html?naoAutorizado=true');
        }
    }

    // Se a sessão existe, verifica se expirou
    if (Date.now() - req.session.usuario.loginTime > 30 * 60 * 1000) {
        req.session.destroy(err => {
            if (err) {
                console.error('Erro ao destruir sessão:', err);
            }
            // *** CORREÇÃO DO TypeError AQUI: Garante que req.headers.accept existe ***
            if (req.xhr || (req.headers.accept && req.headers.accept.includes('json')) || req.originalUrl.startsWith('/api/')) {
                return res.status(401).json({ sucesso: false, mensagem: 'Sessão expirada. Por favor, faça login novamente.' });
            } else {
                return res.redirect('/view/login.html?sessaoExpirada=true');
            }
        });
    } else {
        // Se a sessão está OK e não expirou, continua
        next();
    }
});


// 5. Definição das Rotas do Aplicativo (APÓS o middleware de autenticação)

// Rota para o index.html (agora protegida pelo middleware)
app.get('/view/index.html', (req, res) => {
    res.sendFile(path.join(__dirname, 'view', 'index.html'));
});

// Montagem das Rotas (CORRIGIDO: REMOVIDA A LINHA DUPLICADA DE LOGIN)
app.use('/', usuarioRoute); // Esta linha já inclui o router.post('/login', ...) e o router.get('/logout', ...)
app.use('/api', historicoRoute); // Rotas de histórico serão /api/historico-atendimentos

// Redirecionamento da raiz do site
app.get('/', (req, res) => {
    if (req.session.usuario) {
        res.redirect('/view/index.html');
    } else {
        res.redirect('/view/login.html');
    }
});

// Bloco de código para migração de senhas (comentado, como no seu original)
// ...

// Iniciar o servidor
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});