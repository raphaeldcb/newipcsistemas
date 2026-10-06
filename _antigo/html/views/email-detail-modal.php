<?php
/**
 * Email Detail Modal
 * Displays email content and automatic response options
 */
?>

<style>
#emailDetailModal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    z-index: 9999;
    align-items: center;
    justify-content: center;
}

#emailDetailModal.active {
    display: flex;
}

#emailDetailModal > div {
    background: white;
    border-radius: 12px;
    width: 90%;
    max-width: 700px;
    max-height: 85vh;
    overflow-y: auto;
    box-shadow: 0 20px 25px rgba(0, 0, 0, 0.15);
}

.modal-header {
    background: linear-gradient(135deg, #132F4A 0%, #1A4A6F 100%);
    color: white;
    padding: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-radius: 12px 12px 0 0;
    position: sticky;
    top: 0;
}

.modal-header h2 {
    margin: 0;
    font-size: 20px;
    color: white;
}

.modal-header button {
    background: none;
    border: none;
    color: white;
    font-size: 28px;
    cursor: pointer;
    padding: 0;
    width: 30px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.modal-body {
    padding: 20px;
}

.info-section {
    margin-bottom: 20px;
}

.info-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 15px;
    margin-bottom: 20px;
}

.info-item {
    background: #F9FAFB;
    padding: 15px;
    border-radius: 8px;
    border-left: 3px solid #132F4A;
}

.info-item strong {
    display: block;
    margin-bottom: 5px;
    color: #132F4A;
    font-size: 12px;
}

.info-item span {
    color: #1F2937;
    font-size: 14px;
    word-break: break-word;
}

.message-box {
    background: #F3F4F6;
    padding: 15px;
    border-radius: 8px;
    border-left: 3px solid #3B82F6;
    margin-bottom: 20px;
    max-height: 200px;
    overflow-y: auto;
}

.response-box {
    background: #FFFBEB;
    padding: 15px;
    border-radius: 8px;
    border-left: 3px solid #F59E0B;
    margin-bottom: 20px;
}

.response-preview {
    background: white;
    padding: 12px;
    border-radius: 6px;
    margin: 10px 0;
    max-height: 150px;
    overflow-y: auto;
    font-size: 13px;
    line-height: 1.5;
    color: #4B5563;
    border: 1px solid #E5E7EB;
}

.response-inputs {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 10px;
    margin-top: 10px;
}

.response-inputs input {
    padding: 8px;
    border: 1px solid #E5E7EB;
    border-radius: 6px;
    font-size: 13px;
}

.modal-footer {
    display: flex;
    gap: 10px;
    justify-content: flex-end;
    padding: 15px 20px;
    border-top: 1px solid #E5E7EB;
    background: white;
    position: sticky;
    bottom: 0;
}

.modal-footer button {
    padding: 10px 16px;
    border-radius: 6px;
    border: none;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s;
    font-size: 14px;
}

.btn-cancel {
    background: #E5E7EB;
    color: #1F2937;
}

.btn-cancel:hover {
    background: #D1D5DB;
}

.btn-action {
    background: linear-gradient(135deg, #132F4A 0%, #1A4A6F 100%);
    color: white;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.07);
}

.btn-action:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
}
</style>

<div id="emailDetailModal">
    <div>
        <!-- Header -->
        <div class="modal-header">
            <h2 id="modalTitle">Detalhes do Email</h2>
            <button onclick="closeEmailModal()">&times;</button>
        </div>

        <!-- Body -->
        <div class="modal-body">
            <!-- From/To/Date Info -->
            <div class="info-grid">
                <div class="info-item">
                    <strong>De</strong>
                    <span id="modalFrom">-</span>
                </div>
                <div class="info-item">
                    <strong>Data</strong>
                    <span id="modalDate">-</span>
                </div>
                <div class="info-item">
                    <strong>Assunto</strong>
                    <span id="modalSubject">-</span>
                </div>
            </div>

            <!-- Email Body -->
            <div class="info-section">
                <strong style="display: block; margin-bottom: 10px;">📨 Mensagem</strong>
                <div class="message-box" id="modalBody">
                    <!-- Email content will be loaded here -->
                </div>
            </div>

            <!-- Extracted Data -->
            <div class="info-section">
                <strong style="display: block; margin-bottom: 10px;">📋 Informações Extraídas</strong>
                <div class="info-grid">
                    <div class="info-item">
                        <strong>Tribunal (Vara)</strong>
                        <span id="modalVara">-</span>
                    </div>
                    <div class="info-item">
                        <strong>Região (Comarca)</strong>
                        <span id="modalComarca">-</span>
                    </div>
                    <div class="info-item">
                        <strong>Número do Processo</strong>
                        <span id="modalProcess">-</span>
                    </div>
                </div>
            </div>

            <!-- Automatic Response Section -->
            <div class="info-section">
                <strong style="display: block; margin-bottom: 10px;">✉️ Resposta Automática</strong>
                <div class="response-box">
                    <div>
                        <strong style="font-size: 12px; display: block; margin-bottom: 5px;">Para:</strong> 
                        <span id="responseToEmail" style="color: #1F2937;">-</span>
                    </div>
                    <div style="margin-top: 8px;">
                        <strong style="font-size: 12px; display: block; margin-bottom: 5px;">Assunto:</strong> 
                        <span id="responseSubject" style="color: #1F2937;">-</span>
                    </div>
                    <strong style="font-size: 12px; display: block; margin-top: 12px; margin-bottom: 5px;">Corpo da Resposta:</strong>
                    <div class="response-preview" id="responseBody">
                        <!-- Response body will be loaded here -->
                    </div>

                    <!-- Schedule Info -->
                    <div class="response-inputs">
                        <input type="date" id="responseDate" placeholder="Data de Envio">
                        <input type="time" id="responseTime" value="09:00" placeholder="Hora de Envio">
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer with Actions -->
        <div class="modal-footer">
            <button class="modal-footer button btn-cancel" onclick="closeEmailModal()">Cancelar</button>
            <button class="modal-footer button btn-action" onclick="classifyEmail()">🤖 Classificar</button>
            <button class="modal-footer button btn-action" id="autoResponseBtn" style="display:none;" onclick="generateAutoResponse()">⚡ Gerar Resposta</button>
            <button class="modal-footer button btn-action" onclick="markAsAnalyzed()">✓ Marcar como Analisado</button>
            <button class="modal-footer button btn-action" onclick="scheduleResponse()">📧 Agendar Resposta</button>
        </div>
    </div>
</div>

<script>
function openEmailModal(commId) {
    console.log('🔍 openEmailModal called with ID:', commId);

    if (!commId) {
        alert('❌ Erro: No communication ID provided');
        return;
    }

    // Fetch communication details via API
    fetch(`/newipcsistemas/api.php?action=get_detail&id=${commId}`, {
        credentials: 'include'
    })
        .then(r => r.json())
        .then(data => {
            console.log('📦 API Response:', data);
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

                // Populate response info
                const responseDate = new Date();
                responseDate.setDate(responseDate.getDate() + 1);
                document.getElementById('responseDate').value = responseDate.toISOString().split('T')[0];
                document.getElementById('responseToEmail').textContent = comm.from_address;
                document.getElementById('responseSubject').textContent = 'RE: ' + comm.subject;

                // Set response body based on classification and completeness
                let responseTemplate;

                if (comm.classification === 'JUDICIAL' && comm.has_complete_data) {
                    // Full template for judicial emails with all required data
                    responseTemplate = `Prezados,

Acusamos o recebimento de sua comunicação e do(s) respectivo(s) anexo(s).

Para garantirmos a celeridade no processamento desta intimação e a rápida distribuição à nossa equipe técnica, solicitamos, por gentileza, que as próximas comunicações ou respostas a este e-mail incluam:

• O número dos Autos no formato padrão do CNJ (ex: 0000000-00.0000.0.00.0000).
• A confirmação de que o nosso CPF/CNPJ já se encontra devidamente cadastrado e habilitado no sistema do tribunal, garantindo nosso acesso à consulta integral dos autos.

Aviso de Sistema: A ausência do número processual no formato CNJ impede a triagem automática do nosso sistema de gestão.

Esta é uma mensagem automática. O e-mail original foi devidamente encaminhado para o nosso departamento administrativo.`;
                } else {
                    // Generic template for non-judicial or incomplete judicial emails
                    responseTemplate = `Prezados,

Acusamos o recebimento de sua comunicação e do(s) respectivo(s) anexo(s).`;
                }

                document.getElementById('responseBody').textContent = responseTemplate;

                // Store communication ID for later use
                document.getElementById('emailDetailModal').dataset.commId = commId;

                // Show modal
                document.getElementById('emailDetailModal').classList.add('active');
            }
        })
        .catch(err => alert('Erro ao carregar detalhes do email: ' + err));
}

function closeEmailModal() {
    document.getElementById('emailDetailModal').classList.remove('active');
}

function classifyEmail() {
    const commId = document.getElementById('emailDetailModal').dataset.commId;

    console.log('🤖 classifyEmail - ID:', commId);

    if (!commId) {
        alert('❌ Erro: Communication ID missing');
        return;
    }

    fetch(`/newipcsistemas/api.php?action=classify_email&id=${commId}`, {
        credentials: 'include'
    })
        .then(r => r.json())
        .then(data => {
            console.log('📊 Classification result:', data);
            if (data.success) {
                const classification = data.classification;
                const cnj = data.cnj_number || '-';
                const vara = data.vara || '-';
                const comarca = data.comarca || '-';
                const hasData = data.has_complete_data;

                alert(`✅ Classificado como: ${classification}\n\nCNJ: ${cnj}\nVara: ${vara}\nComarca: ${comarca}\n\nDados completos: ${hasData ? 'SIM ✓' : 'NÃO ✗'}`);

                // Show auto-response button if judicial and has complete data
                if (classification === 'JUDICIAL' && hasData) {
                    document.getElementById('autoResponseBtn').style.display = 'inline-block';
                } else {
                    document.getElementById('autoResponseBtn').style.display = 'none';
                }
            } else {
                alert('❌ Erro: ' + (data.error || 'Desconhecido'));
            }
        })
        .catch(err => alert('❌ Erro: ' + err));
}

function generateAutoResponse() {
    const commId = document.getElementById('emailDetailModal').dataset.commId;
    const vara = document.getElementById('modalVara').textContent;
    const comarca = document.getElementById('modalComarca').textContent;
    const processo = document.getElementById('modalProcess').textContent;
    const subject = document.getElementById('modalSubject').textContent;
    const fromAddress = document.getElementById('responseToEmail').textContent;

    console.log('⚡ Gerando resposta automática...');
    console.log('   Vara:', vara);
    console.log('   Comarca:', comarca);
    console.log('   Processo:', processo);

    // Construir template de resposta judicial completo
    const responseTemplate = `Prezados Senhores,

Acusamos o recebimento de sua comunicação referente ao PROCESSO Nº ${processo}.

DADOS DO PROCESSO:
• Número: ${processo}
• Vara: ${vara}
• Comarca: ${comarca}

CONFIRMAÇÃO DE RECEBIMENTO:
✓ A intimação foi devidamente recebida e registrada em nosso sistema.
✓ O número do processo encontra-se registrado em nossa base de dados judicial.
✓ A documentação foi encaminhada para análise técnica e administrativa.

PRÓXIMOS PASSOS:
1. Nosso departamento administrativo analisará a documentação recebida.
2. Caso necessário, entraremos em contato para complementações.
3. Respeitaremos todos os prazos processuais estabelecidos.

Esta é uma mensagem automática gerada pelo Sistema de Comunicações Judiciais.

Atenciosamente,

IPC - PERÍCIAS E CONSULTORIA
Sistema de Comunicações Judiciais
${new Date().toLocaleDateString('pt-BR')}`;

    // Preencher resposta
    document.getElementById('responseBody').textContent = responseTemplate;

    // Preencher data (próximo dia útil)
    const responseDate = new Date();
    responseDate.setDate(responseDate.getDate() + 1);
    document.getElementById('responseDate').value = responseDate.toISOString().split('T')[0];
    document.getElementById('responseTime').value = '09:00';

    alert('✅ Resposta automática gerada!\n\nAgora clique em "📧 Agendar Resposta" para confirmar o envio.');
}

function markAsAnalyzed() {
    const modal = document.getElementById('emailDetailModal');
    const commId = modal ? modal.dataset.commId : null;

    console.log('🔍 markAsAnalyzed - modal:', modal);
    console.log('🔍 markAsAnalyzed - commId:', commId);
    console.log('🔍 markAsAnalyzed - dataset:', modal ? modal.dataset : 'N/A');

    if (!commId) {
        alert('❌ Erro: Missing communication ID');
        return;
    }

    console.log('✅ markAsAnalyzed - proceeding with ID:', commId);
    fetch(`/newipcsistemas/api.php?action=mark_analyzed&id=${commId}`, {
        method: 'POST',
        credentials: 'include'
    })
        .then(r => r.json())
        .then(data => {
            console.log('📋 markAsAnalyzed API Response:', data);
            console.log('   - success:', data.success);
            console.log('   - message:', data.message);
            console.log('   - error:', data.error);

            if (data.success) {
                alert('✅ Email marcado como analisado\n\n📧 Categoria adicionada no Outlook');
                closeEmailModal();
                location.reload();
            } else {
                alert('❌ Erro: ' + (data.error || 'Desconhecido'));
            }
        })
        .catch(err => {
            console.error('❌ Fetch error:', err);
            alert('❌ Erro ao conectar com servidor: ' + err);
        });
}

function scheduleResponse() {
    const commId = document.getElementById('emailDetailModal').dataset.commId;
    const responseDate = document.getElementById('responseDate').value;
    const responseTime = document.getElementById('responseTime').value;
    const responseBody = document.getElementById('responseBody').textContent;
    const responseSubject = document.getElementById('responseSubject').textContent;
    const responseToEmail = document.getElementById('responseToEmail').textContent;

    console.log('📋 scheduleResponse - Sending:');
    console.log('  - commId:', commId);
    console.log('  - responseDate:', responseDate);
    console.log('  - responseTime:', responseTime);
    console.log('  - responseToEmail:', responseToEmail);
    console.log('  - responseSubject:', responseSubject);
    console.log('  - responseBody length:', responseBody.length);

    const payload = {
        id: commId,
        date: responseDate,
        time: responseTime,
        to: responseToEmail,
        subject: responseSubject,
        body: responseBody
    };

    console.log('📦 Payload:', payload);

    fetch(`/newipcsistemas/api.php?action=schedule_response`, {
        method: 'POST',
        credentials: 'include',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
    })
        .then(r => r.json())
        .then(data => {
            if (data.success) {
                alert('✅ Resposta agendada para ' + responseDate + ' às ' + responseTime);
                closeEmailModal();
                location.reload();
            } else {
                alert('❌ Erro: ' + (data.error || 'Desconhecido'));
            }
        })
        .catch(err => alert('❌ Erro: ' + err));
}

// Close modal when clicking outside
document.getElementById('emailDetailModal')?.addEventListener('click', function(event) {
    if (event.target === this) {
        closeEmailModal();
    }
});
</script>
