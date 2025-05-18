function verificaUsuario() {
    const usuarioInput = document.getElementById('usuario');
    const senhaInput = document.getElementById('senha');
    const usuario = usuarioInput.value.trim();
    const senha = senhaInput.value.trim();

    // Resetar estilos anteriores
    usuarioInput.style.border = '';
    senhaInput.style.border = '';

    // Validação do campo "Usuário"
    if (!usuario) {
        alert('Por favor, preencha o campo "Usuário".');
        usuarioInput.style.border = '2px solid red';
        usuarioInput.focus();
        return;
    }

    if (!isNaN(usuario)) {
        alert('O campo "Usuário" deve conter letras ou um nome válido.');
        usuarioInput.style.border = '2px solid red';
        usuarioInput.focus();
        return;
    }

    // Validação do campo "Senha"
    if (!senha) {
        alert('Por favor, preencha o campo "Senha".');
        senhaInput.style.border = '2px solid red';
        senhaInput.focus();
        return;
    }

    if (senha.length < 4) {
        alert('A senha deve ter pelo menos 4 caracteres.');
        senhaInput.style.border = '2px solid red';
        senhaInput.focus();
        return;
    }
}
