function verificaUsuario(event) {
    event.preventDefault(); // impede envio padrão do formulário

    const usuarioInput = document.getElementById('usuario');
    const senhaInput = document.getElementById('senha');
    const usuario = usuarioInput.value.trim();
    const senha = senhaInput.value.trim();

    // Validações simples
    if (!usuario) {
        alert('Preencha o campo Usuário.');
        usuarioInput.focus();
        return;
    }
    if (!senha) {
        alert('Preencha o campo Senha.');
        senhaInput.focus();
        return;
    }
    if (senha.length < 4) {
        alert('A senha deve ter pelo menos 4 caracteres.');
        senhaInput.focus();
        return;
    }

    // Envia dados para o backend
    fetch('/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ usuario, senha })
    })
    .then(res => res.json())
    .then(data => {
        if (data.sucesso) {
            window.location.href = '/view/index.html';
        } else {
            alert(data.mensagem || 'Usuário ou senha inválidos.');
        }
    })
    .catch(err => {
        alert('Erro ao tentar logar.');
        console.error(err);
    });
}
