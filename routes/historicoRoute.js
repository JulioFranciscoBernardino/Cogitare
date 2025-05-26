// routes/historicoRoute.js
const express = require('express');
const router = express.Router();
const historicoController = require('../controller/historicoController');


function autenticar(req, res, next) {
    if (req.session.usuario) {
        next();
    } else {
        res.status(401).json({ sucesso: false, mensagem: 'Não autorizado. Faça login para acessar esta funcionalidade.' });
    }
}

router.get('/historico-atendimentos', autenticar, historicoController.getHistoricos);



module.exports = router;