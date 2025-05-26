const express = require('express');
const router = express.Router();
const usuarioController = require('../controller/usuarioController');

// Middleware para proteger a rota - só permite acesso se estiver logado
function autenticar(req, res, next) {
  if (req.session.usuario) {
    next();
  } else {
    res.status(401).json({ mensagem: 'Não autorizado' });
  }
}

router.get('/usuario', autenticar, (req, res) => {
  res.json({ nome: req.session.usuario.nome });
});

// Rota de login (via POST)
router.post('/login', usuarioController.login);

// Rota de logout (se quiser usar)
router.get('/logout', usuarioController.logout);

module.exports = router;
