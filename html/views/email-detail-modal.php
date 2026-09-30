<?php
/**
 * Email Detail Modal
 * Displays email content and automatic response options
 */
?>

<div id="emailDetailModal">
    <div>

        <!-- Header -->
        <div>
            <h2 id="modalTitle">Detalhes do Email</h2>
            <button onclick="closeEmailModal()">&times;</button>
        </div>

        <!-- Email Content -->
        <div>

            <!-- From/To/Date Info -->
            <div>
                <div>
                    <div>
                        <strong>De</strong><br>
                        <span id="modalFrom"></span>
                    </div>
                    <div>
                        <strong>Data</strong><br>
                        <span id="modalDate"></span>
                    </div>
                    <div>
                        <strong>Assunto</strong><br>
                        <span id="modalSubject"></span>
                    </div>
                </div>
            </div>

            <!-- Email Body -->
            <div>
                <strong>Mensagem</strong>
                <div id="modalBody">
                    <!-- Email content will be loaded here -->
                </div>
            </div>

            <!-- Extracted Data -->
            <div>
                <strong>📋 Informações Extraídas</strong>
                <div>
                    <div>
                        <strong>Tribunal (Vara):</strong><br>
                        <span id="modalVara">-</span>
                    </div>
                    <div>
                        <strong>Região (Comarca):</strong><br>
                        <span id="modalComarca">-</span>
                    </div>
                    <div>
                        <strong>Número do Processo:</strong><br>
                        <span id="modalProcess">-</span>
                    </div>
                    <div>
                        <strong>Classificação:</strong><br>
                        <span id="modalClassification">-</span>
                    </div>
                </div>
            </div>

            <!-- Automatic Response Section -->
            <div>
                <strong>✉️ Resposta Automática</strong>

                <!-- Response Preview -->
                <div>
                    <div>
                        <strong>Para:</strong> <span id="responseToEmail"></span>
                    </div>
                    <div>
                        <strong>Assunto:</strong> <span id="responseSubject"></span>
                    </div>
                    <div>
                        <div id="responseBody"></div>
                    </div>
                </div>

                <!-- Schedule Info -->
                <div>
                    <div>
                        <label>Data de Envio</label>
                        <input type="date" id="responseDate">
                    </div>
                    <div>
                        <label>Hora de Envio</label>
                        <input type="time" id="responseTime" value="09:00">
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer with Actions -->
        <div>
            <button onclick="closeEmailModal()">Cancelar</button>
            <button onclick="markAsAnalyzed()">✓ Marcar como Analisado</button>
            <button onclick="scheduleResponse()">📧 Agendar Resposta</button>
        </div>
    </div>
</div>

<script>
function openEmailModal(commId) {
    // Fetch communication details via API
    // IMPORTANT: include credentials to send session cookie
    fetch(`/newipcsistemas/api.php?action=get_detail&id=${commId}`, {
        credentials: 'include'
    })
        .then(r => r.json())
        .then(data => {
            if (data.success) {
                const comm = data.communication;

                // Populate email info
                document.getElementById('modalTitle').textContent = comm.subject || 'Detalhes do Email';
                document.getElementById('modalFrom').textContent = comm.from_name + ' <' + comm.from_address + '>';
                document.getElementById('modalSubject').textContent = comm.subject;
                document.getElementById('modalDate').textContent = new Date(comm.received_datetime).toLocaleString('pt-BR');
                document.getElementById('modalBody').textContent = comm.body_preview || '(Sem conteúdo)';

                // Populate extracted data
                document.getElementById('modalVara').textContent = comm.vara || '-';
                document.getElementById('modalComarca').textContent = comm.comarca || '-';
                document.getElementById('modalProcess').textContent = comm.processo_numero || '-';
                document.getElementById('modalClassification').textContent = comm.classification || '-';

                // Populate response info
                const responseDate = new Date();
                responseDate.setDate(responseDate.getDate() + 1);
                document.getElementById('responseDate').value = responseDate.toISOString().split('T')[0];
                document.getElementById('responseToEmail').textContent = comm.from_address;
                document.getElementById('responseSubject').textContent = 'RE: ' + comm.subject;

                // Set response body
                const responseTemplate = `Prezados,

Acusamos o recebimento de sua comunicação e do(s) respectivo(s) anexo(s).

Para garantirmos a celeridade no processamento desta intimação e a rápida distribuição à nossa equipe técnica, solicitamos, por gentileza, que as próximas comunicações ou respostas a este e-mail incluam:

• O número dos Autos no formato padrão do CNJ (ex: 0000000-00.0000.0.00.0000).
• A confirmação de que o nosso CPF/CNPJ já se encontra devidamente cadastrado e habilitado no sistema do tribunal, garantindo nosso acesso à consulta integral dos autos, indispensável para casos que tramitam em Segredo de Justiça.

Aviso de Sistema: A ausência do número processual no formato CNJ ou a impossibilidade de acesso integral aos autos por falta de habilitação impede a triagem automática do nosso sistema de gestão, o que poderá impossibilitar o prosseguimento imediato e ocasionar atrasos no cumprimento dos prazos periciais.

Esta é uma mensagem automática. O e-mail original foi devidamente encaminhado para o nosso departamento administrativo.`;

                document.getElementById('responseBody').textContent = responseTemplate;

                // Store communication ID for later use
                document.getElementById('emailDetailModal').dataset.commId = commId;

                // Show modal
                document.getElementById('emailDetailModal').style.display = 'block';
            }
        })
        .catch(err => alert('Erro ao carregar detalhes do email: ' + err));
}

function closeEmailModal() {
    document.getElementById('emailDetailModal').style.display = 'none';
}

function markAsAnalyzed() {
    const commId = document.getElementById('emailDetailModal').dataset.commId;

    fetch(`/newipcsistemas/api.php?action=mark_analyzed&id=${commId}`, {
        method: 'POST',
        credentials: 'include'
    })
        .then(r => r.json())
        .then(data => {
            if (data.success) {
                alert('✅ Email marcado como analisado e categorizado no Outlook');
                closeEmailModal();
                location.reload();
            } else {
                alert('❌ Erro: ' + data.error);
            }
        })
        .catch(err => alert('Erro: ' + err));
}

function scheduleResponse() {
    const commId = document.getElementById('emailDetailModal').dataset.commId;
    const toEmail = document.getElementById('responseToEmail').textContent;
    const subject = document.getElementById('responseSubject').textContent;
    const body = document.getElementById('responseBody').textContent;
    const scheduledDate = document.getElementById('responseDate').value;
    const scheduledTime = document.getElementById('responseTime').value;

    const data = new FormData();
    data.append('action', 'schedule_response');
    data.append('communication_id', commId);
    data.append('to_email', toEmail);
    data.append('subject', subject);
    data.append('body', body);
    data.append('scheduled_date', scheduledDate);
    data.append('scheduled_time', scheduledTime);

    fetch('/newipcsistemas/api.php', {
        method: 'POST',
        body: data,
        credentials: 'include'
    })
        .then(r => r.json())
        .then(data => {
            if (data.success) {
                alert('✅ Resposta agendada para ' + scheduledDate + ' às ' + scheduledTime);
                closeEmailModal();
                location.reload();
            } else {
                alert('❌ Erro: ' + data.error);
            }
        })
        .catch(err => alert('Erro: ' + err));
}

// Close modal when clicking outside
document.addEventListener('click', function(event) {
    const modal = document.getElementById('emailDetailModal');
    if (event.target === modal) {
        closeEmailModal();
    }
});
</script>
