const express = require('express');
const router = express.Router();
const idososController = require('../controller/idososController');

// Middleware de autenticação (opcional)
function autenticar(req, res, next) {
    if (req.session.usuario) {
        return next();
    }
    res.status(401).json({ mensagem: 'Não autorizado' });
}

router.get('/idosos', autenticar, idososController.listar);
router.post('/idosos', autenticar, idososController.criar);
router.put('/idosos/:id', autenticar, idososController.atualizar);
router.delete('/idosos/:id', autenticar, idososController.excluir);

module.exports = router;
