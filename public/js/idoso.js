document.addEventListener('DOMContentLoaded', () => {
  const cardGrid = document.querySelector('.card-grid');
  const btnToggleForm = document.getElementById('btnToggleForm');
  const modal = document.getElementById('modalOverlay');
  const btnClose = document.getElementById('btnCloseModal');

  // Função para calcular idade a partir da data de nascimento
  function calcularIdade(dataNascimento) {
    const nascimento = new Date(dataNascimento);
    const hoje = new Date();
    let idade = hoje.getFullYear() - nascimento.getFullYear();
    const m = hoje.getMonth() - nascimento.getMonth();
    if (m < 0 || (m === 0 && hoje.getDate() < nascimento.getDate())) {
      idade--;
    }
    return idade;
  }

  // Função para carregar e exibir idosos
  function carregarIdosos() {
    fetch('/api/idosos')
      .then(response => {
        if (!response.ok) throw new Error('Erro ao buscar idosos: ' + response.statusText);
        return response.json();
      })
      .then(idosos => {
        cardGrid.innerHTML = '';

        if (!idosos.length) {
          cardGrid.innerHTML = '<p>Nenhum idoso cadastrado.</p>';
          return;
        }

        idosos.forEach(idoso => {
          const idade = calcularIdade(idoso.DataNascimento);
          const condicoes = idoso.CuidadosMedicos || 'Não informado';

          const card = document.createElement('div');
          card.classList.add('card');

          card.innerHTML = `
            <img src="${idoso.FotoUrl || '/images/default-idoso.jpg'}" alt="Foto de ${idoso.Nome}" />
            <div class="card-info">
              <h3>${idoso.Nome}</h3>
              <p>Idade: ${idade} anos</p>
              <p>Condições: ${condicoes}</p>
              <a href="/view/responsavel.html?id=${idoso.IdIdoso}" class="link-responsavel">Ver Responsável</a>
            </div>
          `;

          cardGrid.appendChild(card);
        });
      })
      .catch(error => {
        cardGrid.innerHTML = `<p>Erro ao carregar os dados dos idosos.</p>`;
        console.error(error);
      });
  }

  carregarIdosos();

  // Abrir modal
  btnToggleForm.addEventListener('click', () => {
    modal.classList.add('active');
    modal.setAttribute('aria-hidden', 'false');
  });

  // Fechar modal
  btnClose.addEventListener('click', () => {
    modal.classList.remove('active');
    modal.setAttribute('aria-hidden', 'true');
  });

  window.addEventListener('click', (e) => {
    if (e.target === modal) {
      modal.classList.remove('active');
      modal.setAttribute('aria-hidden', 'true');
    }
  });

  // Selecionar selects pelos IDs corretos do seu HTML
  const selectMobilidade = document.getElementById('idMobilidade');
  const selectNivelAutonomia = document.getElementById('idNivelAutonomia');
  const selectResponsavel = document.getElementById('idResponsavel');

  fetch('/api/mobilidades')
  .then(res => res.json())
  .then(data => {
    const select = document.getElementById('idMobilidade'); // corrigido
    data.forEach(item => {
      const option = document.createElement('option');
      option.value = item.IdMobilidade;
      option.textContent = item.Descricao;
      select.appendChild(option);
    });
  })
  .catch(error => console.error('Erro ao carregar mobilidades:', error));

fetch('/api/niveis-autonomia')
  .then(res => res.json())
  .then(data => {
    const select = document.getElementById('idNivelAutonomia'); // corrigido
    data.forEach(item => {
      const option = document.createElement('option');
      option.value = item.IdNivelAutonomia;
      option.textContent = item.Descricao;
      select.appendChild(option);
    });
  })
  .catch(error => console.error('Erro ao carregar níveis de autonomia:', error));

fetch('/api/responsaveis')
  .then(res => res.json())
  .then(data => {
    const select = document.getElementById('idResponsavel'); // corrigido
    data.forEach(item => {
      const option = document.createElement('option');
      option.value = item.IdResponsavel;
      option.textContent = item.Nome;
      select.appendChild(option);
    });
  })
  .catch(error => console.error('Erro ao carregar responsáveis:', error));

});
