#!/bin/bash
# Script de Backup dos Bancos (Etapa 1 — Preparação)
# Execute este script ANTES de prosseguir com a unificação

set -e

BACKUP_DIR="$HOME/.backups-scpg"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "🔄 Criando diretório de backup: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

echo "📦 Fazendo backup de novos_sistemas_ipc..."
mysqldump -u root novos_sistemas_ipc > "$BACKUP_DIR/backup_novos_sistemas_ipc_$TIMESTAMP.sql"
if [ $? -eq 0 ]; then
    echo "✅ Backup novos_sistemas_ipc criado"
else
    echo "❌ Erro ao fazer backup de novos_sistemas_ipc"
    exit 1
fi

echo "📦 Fazendo backup de sgbd_scpg..."
mysqldump -u root sgbd_scpg > "$BACKUP_DIR/backup_sgbd_scpg_$TIMESTAMP.sql"
if [ $? -eq 0 ]; then
    echo "✅ Backup sgbd_scpg criado"
else
    echo "❌ Erro ao fazer backup de sgbd_scpg"
    exit 1
fi

echo "---"
echo "📋 Backups criados:"
ls -lh "$BACKUP_DIR"/backup_*.sql | tail -5
echo ""
echo "✅ Backup concluído com sucesso!"
echo "Local: $BACKUP_DIR"
