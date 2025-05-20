require('dotenv').config();
const express = require('express');
const path = require('path');
const session = require('express-session');
const usuarioRoute = require('./routes/usuarioRoute');
const dbConfig = require('./config/db');
const sql = require('mssql');


const app = express();
const PORT = process.env.PORT || 3000;

// Sessão 30 minutos
app.use(session({
    secret: process.env.KEY,
    resave: false,
    saveUninitialized: true,
    cookie: {
        maxAge: 30 * 60 * 1000
    }
}));

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Middleware para verificar sessão expirada
app.use((req, res, next) => {
    if (req.session.usuario && (Date.now() - req.session.usuario.loginTime > 30 * 60 * 1000)) {
        req.session.destroy();
        return res.status(401).json({ sucesso: false, mensagem: 'Sessão expirada' });
    }
    next();
});

// Rotas públicas (login, JS/CSS/imagens)
app.use('/view/login.html', express.static(path.join(__dirname, 'view', 'login.html')));
app.use('/css', express.static(path.join(__dirname, 'public', 'css')));
app.use('/js', express.static(path.join(__dirname, 'public', 'js')));
app.use('/imagens', express.static(path.join(__dirname, 'public', 'imagens')));
app.use('/view', express.static(path.join(__dirname, 'view')));



// Protege o index.html
app.get('/view/index.html', (req, res) => {
    if (!req.session.usuario) {
        return res.redirect('/view/login.html');
    }
    res.sendFile(path.join(__dirname, 'view', 'index.html'));
});

// Usar rota usuário
app.use('/', usuarioRoute);

// Redirecionamento da raiz
app.get('/', (req, res) => {
    if (req.session.usuario) {
        res.redirect('/view/index.html');
    } else {
        res.redirect('/view/login.html');
    }
});

async function migrarSenhas() {
    try {
        const pool = await sql.connect(dbConfig);
        const result = await pool.request()
            .query('SELECT IdAdministrador, Senha FROM Administrador');

        for (const usuario of result.recordset) {
            // Evita recriptografar senhas já com hash
            if (usuario.Senha.startsWith('$2b$')) continue;

            const senhaHash = await bcrypt.hash(usuario.Senha, 10);

            await pool.request()
                .input('Id', sql.Int, usuario.IdAdministrador)
                .input('SenhaHash', sql.VarChar, senhaHash)
                .query('UPDATE Administrador SET Senha = @SenhaHash WHERE IdAdministrador = @Id');

            console.log(`Senha criptografada para usuário ID ${usuario.IdAdministrador}`);
        }

        console.log('Todas as senhas foram criptografadas com sucesso.');
    } catch (err) {
        console.error('Erro ao criptografar senhas:', err);
    }
}

// Chamada automática na inicialização
migrarSenhas();


app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});
