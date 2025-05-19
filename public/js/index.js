// index.js (rodar no browser)

document.addEventListener('DOMContentLoaded', () => {
  fetch('/api/usuario')
    .then(res => {
      if (!res.ok) throw new Error('Usuário não autenticado');
      return res.json();
    })
    .then(data => {
      const saudacao = document.querySelector('header h1');
      saudacao.textContent = `Olá, ${data.nome} 👋`;
    })
    .catch(err => {
      console.error(err);
      // Se não estiver logado, redireciona para login
      window.location.href = '/view/login.html';
    });
});
