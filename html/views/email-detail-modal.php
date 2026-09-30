<?php
/**
 * Email Detail Modal
 * Displays email content and automatic response options
 */
?>

<div id="emailDetailModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.7); z-index: 10000;">
    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; border-radius: 12px; width: 90%; max-width: 900px; max-height: 90vh; overflow-y: auto; box-shadow: 0 10px 40px rgba(0,0,0,0.3);">

        <!-- Header -->
        <div style="padding: 20px; border-bottom: 1px solid #eee; display: flex; justify-content: space-between; align-items: center;">
            <h2 id="modalTitle" style="margin: 0; font-size: 20px; color: #333;">Email Details</h2>
            <button onclick="closeEmailModal()" style="background: none; border: none; font-size: 28px; cursor: pointer; color: #999;">&times;</button>
        </div>

        <!-- Email Content -->
        <div style="padding: 20px;">

            <!-- From/To/Date Info -->
            <div style="background: #f8f9fa; padding: 15px; border-radius: 6px; margin-bottom: 20px;">
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px; font-size: 13px;">
                    <div>
                        <strong style="color: #666; text-transform: uppercase;">From</strong><br>
                        <span id="modalFrom"></span>
                    </div>
                    <div>
                        <strong style="color: #666; text-transform: uppercase;">Date</strong><br>
                        <span id="modalDate"></span>
                    </div>
                    <div style="grid-column: 1 / -1;">
                        <strong style="color: #666; text-transform: uppercase;">Subject</strong><br>
                        <span id="modalSubject" style="font-size: 15px; color: #333;"></span>
                    </div>
                </div>
            </div>

            <!-- Email Body -->
            <div style="background: white; border: 1px solid #ddd; padding: 15px; border-radius: 6px; margin-bottom: 20px; min-height: 200px;">
                <strong style="color: #666; text-transform: uppercase; font-size: 12px; display: block; margin-bottom: 10px;">Message</strong>
                <div id="modalBody" style="font-size: 14px; line-height: 1.6; color: #333; word-break: break-word;">
                    <!-- Email content will be loaded here -->
                </div>
            </div>

            <!-- Extracted Data -->
            <div style="background: #e8f5e9; padding: 15px; border-radius: 6px; margin-bottom: 20px; border-left: 4px solid #2e7d32;">
                <strong style="color: #2e7d32; text-transform: uppercase; font-size: 12px; display: block; margin-bottom: 10px;">📋 Extracted Information</strong>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px; font-size: 13px;">
                    <div>
                        <strong>Court (Vara):</strong><br>
                        <span id="modalVara" style="color: #333;">-</span>
                    </div>
                    <div>
                        <strong>Region (Comarca):</strong><br>
                        <span id="modalComarca" style="color: #333;">-</span>
                    </div>
                    <div>
                        <strong>Process Number:</strong><br>
                        <span id="modalProcess" style="color: #333; font-family: monospace;">-</span>
                    </div>
                    <div>
                        <strong>Classification:</strong><br>
                        <span id="modalClassification" style="color: #333;">-</span>
                    </div>
                </div>
            </div>

            <!-- Automatic Response Section -->
            <div style="background: #fff3cd; padding: 15px; border-radius: 6px; margin-bottom: 20px; border-left: 4px solid #ffc107;">
                <strong style="color: #856404; text-transform: uppercase; font-size: 12px; display: block; margin-bottom: 15px;">✉️ Automatic Response</strong>

                <!-- Response Preview -->
                <div style="background: white; padding: 12px; border-radius: 4px; margin-bottom: 15px; border: 1px solid #ddd; font-size: 12px; line-height: 1.5;">
                    <div style="margin-bottom: 10px;">
                        <strong>To:</strong> <span id="responseToEmail"></span>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <strong>Subject:</strong> <span id="responseSubject"></span>
                    </div>
                    <div style="background: #f5f5f5; padding: 10px; border-radius: 3px; max-height: 150px; overflow-y: auto;">
                        <div id="responseBody" style="font-size: 11px; line-height: 1.4; white-space: pre-wrap;"></div>
                    </div>
                </div>

                <!-- Schedule Info -->
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px; margin-bottom: 15px;">
                    <div>
                        <label style="display: block; font-size: 12px; font-weight: 600; color: #666; margin-bottom: 5px;">Send Date</label>
                        <input type="date" id="responseDate" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px; font-size: 12px;">
                    </div>
                    <div>
                        <label style="display: block; font-size: 12px; font-weight: 600; color: #666; margin-bottom: 5px;">Send Time</label>
                        <input type="time" id="responseTime" value="09:00" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px; font-size: 12px;">
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer with Actions -->
        <div style="padding: 15px; border-top: 1px solid #eee; display: flex; gap: 10px; justify-content: flex-end; background: #f8f9fa;">
            <button onclick="closeEmailModal()" style="padding: 10px 20px; background: #ddd; color: #333; border: none; border-radius: 6px; cursor: pointer; font-weight: 500;">Cancel</button>
            <button onclick="markAsAnalyzed()" style="padding: 10px 20px; background: #2e7d32; color: white; border: none; border-radius: 6px; cursor: pointer; font-weight: 500;">✓ Mark as Analyzed</button>
            <button onclick="scheduleResponse()" style="padding: 10px 20px; background: #667eea; color: white; border: none; border-radius: 6px; cursor: pointer; font-weight: 500;">📧 Schedule Response</button>
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
                document.getElementById('modalTitle').textContent = comm.subject || 'Email Details';
                document.getElementById('modalFrom').textContent = comm.from_name + ' <' + comm.from_address + '>';
                document.getElementById('modalSubject').textContent = comm.subject;
                document.getElementById('modalDate').textContent = new Date(comm.received_datetime).toLocaleString('pt-BR');
                document.getElementById('modalBody').textContent = comm.body_preview || '(No content)';

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
        .catch(err => alert('Error loading email details: ' + err));
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
                alert('✅ Email marked as analyzed and categorized in Outlook');
                closeEmailModal();
                location.reload();
            } else {
                alert('❌ Error: ' + data.error);
            }
        })
        .catch(err => alert('Error: ' + err));
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
                alert('✅ Response scheduled for ' + scheduledDate + ' at ' + scheduledTime);
                closeEmailModal();
                location.reload();
            } else {
                alert('❌ Error: ' + data.error);
            }
        })
        .catch(err => alert('Error: ' + err));
}

// Close modal when clicking outside
document.addEventListener('click', function(event) {
    const modal = document.getElementById('emailDetailModal');
    if (event.target === modal) {
        closeEmailModal();
    }
});
</script>
