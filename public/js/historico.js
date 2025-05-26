
document.addEventListener('DOMContentLoaded', async () => {
            const historicoCardsContainer = document.getElementById('historicoCardsContainer');

            try {
                // Faz a requisição para a rota de API que busca os históricos
                const response = await fetch('/api/historico-atendimentos');

                // Verifica se a resposta não foi bem-sucedida (ex: 401 Unauthorized, 500 Internal Server Error)
                if (!response.ok) {
                    if (response.status === 401) {
                        // Se a sessão expirou ou não está autorizado, redireciona para a página de login
                        const errorData = await response.json(); // Tenta ler a mensagem de erro do backend
                        alert(errorData.mensagem || 'Sessão expirada ou não autorizado. Redirecionando para o login...');
                        window.location.href = '/view/login.html?sessaoExpirada=true';
                        return; // Sai da função para evitar processamento adicional
                    }
                    // Para outros erros HTTP, lança uma exceção
                    throw new Error(`Erro HTTP: ${response.status} ${response.statusText}`);
                }

                // Converte a resposta para JSON
                const data = await response.json();

                // Verifica se a operação no backend foi bem-sucedida
                if (data.sucesso) {
                    // Verifica se há dados de histórico para exibir
                    if (data.historicos && data.historicos.length > 0) {
                        historicoCardsContainer.innerHTML = ''; // Limpa qualquer conteúdo estático ou placeholder

                        // Itera sobre cada item do histórico e cria um card HTML
                        data.historicos.forEach(historico => {
                            const cardDiv = document.createElement('div');
                            cardDiv.classList.add('card'); // Adiciona a classe CSS 'card'

                            // Formata a DataRegistro para exibição no formato brasileiro
                            const dataObj = new Date(historico.DataRegistro);
                            const dataFormatada = dataObj instanceof Date && !isNaN(dataObj.getTime())
                                ? dataObj.toLocaleDateString('pt-BR')
                                : 'Data inválida';

                            // Converte o status para uma classe CSS (ex: "Finalizado" -> "finalizado")
                            const statusClass = historico.StatusFinal ? historico.StatusFinal.toLowerCase().replace(/\s/g, '') : '';

                            // Popula o HTML interno do card com os dados do histórico
                            cardDiv.innerHTML = `
                                <h2>Idoso: ${historico.NomeIdoso || 'N/A'}</h2>
                                <p>Data: ${dataFormatada}</p>
                                <p>Status: <span class="status ${statusClass}">${historico.StatusFinal || 'N/A'}</span></p>
                                ${historico.Observacoes ? `<p>Observações: ${historico.Observacoes}</p>` : ''}
                            `;
                            historicoCardsContainer.appendChild(cardDiv); // Adiciona o card ao container
                        });
                    } else {
                        // Exibe uma mensagem se nenhum histórico for encontrado
                        historicoCardsContainer.innerHTML = '<p>Nenhum histórico de atendimento encontrado.</p>';
                    }
                } else {
                    // Exibe uma mensagem de erro se o backend indicar falha
                    console.error('Erro ao carregar histórico (resposta do servidor):', data.mensagem);
                    historicoCardsContainer.innerHTML = `<p>Ocorreu um erro ao carregar o histórico: ${data.mensagem}</p>`;
                }
            } catch (error) {
                // Captura e exibe erros de rede ou processamento
                console.error('Erro de rede ou ao processar resposta:', error);
                historicoCardsContainer.innerHTML = '<p>Não foi possível conectar ao servidor ou processar os dados do histórico.</p>';
            }
        });