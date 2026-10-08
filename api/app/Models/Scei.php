<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class Scei extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'tb_scei';
    protected $primaryKey = 'scei_cod';

    protected $fillable = [
        'amostra_id',
        'exame_tipo',
        'resultado',
        'data_exame',
        'laboratorio_id',
        'caso_id',
        'scei_fase',
        'valor_exame',
        'data_coleta',
        'responsavel_id',
        'data_recebimento',
        'data_analise',
        'resultado_valor',
        'resultado_referencia',
        'resultado_unidade',
        'data_liberacao',
        'status_laudo',
        'data_laudo',
        'motivo_cancelamento',
        'observacoes',
    ];

    protected $casts = [
        'valor_exame' => 'decimal:2',
        'data_exame' => 'datetime',
        'data_coleta' => 'date',
        'data_recebimento' => 'datetime',
        'data_analise' => 'datetime',
        'data_liberacao' => 'datetime',
        'data_laudo' => 'datetime',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    // Relações
    public function caso(): BelongsTo
    {
        return $this->belongsTo(Caso::class, 'caso_id', 'id');
    }

    public function laboratorio(): BelongsTo
    {
        return $this->belongsTo(User::class, 'laboratorio_id', 'id');
    }

    public function responsavel(): BelongsTo
    {
        return $this->belongsTo(User::class, 'responsavel_id', 'id');
    }

    // Scopes
    public function scopePendente($query)
    {
        return $query->where('scei_fase', 1);
    }

    public function scopeEmAnalise($query)
    {
        return $query->where('scei_fase', 3);
    }

    public function scopeResultadoLiberado($query)
    {
        return $query->where('scei_fase', 4);
    }

    public function scopeCancelado($query)
    {
        return $query->where('scei_fase', 7);
    }

    // Métodos auxiliares
    public function getFaseLabel(): string
    {
        return match($this->scei_fase) {
            1 => 'Pendente',
            2 => 'Amostra Recebida',
            3 => 'Em Análise',
            4 => 'Resultado Liberado',
            5 => 'Laudo Emitido',
            6 => 'Laudo Finalizado',
            7 => 'Cancelado',
            default => 'Desconhecido',
        };
    }

    public function getProgresso(): int
    {
        return match($this->scei_fase) {
            1 => 14,
            2 => 28,
            3 => 42,
            4 => 57,
            5 => 71,
            6 => 86,
            7 => 100,
            default => 0,
        };
    }
}
