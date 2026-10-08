<?php

namespace App\Models;

use App\Enums\CreditoStatus;

class Credito extends BaseModel
{
    protected $table = 'tb_creditos';
    protected $primaryKey = 'id_credito';
    protected $guarded = [];

    protected $casts = [
        'valor_base' => 'float',
        'fator_1' => 'float',
        'fator_2' => 'float',
        'fator_3' => 'float',
        'fator_4' => 'float',
        'fator_5' => 'float',
        'valor_calculado' => 'float',
        'valor_pago' => 'float',
        'num_parcelas' => 'integer',
        'status' => 'string',
        'data_pagamento' => 'datetime',
        'data_cancelamento' => 'datetime',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    /**
     * Relacionamento com Caso
     */
    public function caso()
    {
        return $this->belongsTo(Caso::class, 'caso_id', 'cas_contr');
    }

    /**
     * Relacionamento com Parcelas
     */
    public function parcelas()
    {
        return $this->hasMany(Parcela::class, 'id_credito', 'id_credito');
    }

    /**
     * Verify if credit is fully paid
     */
    public function isPago(): bool
    {
        return $this->status === CreditoStatus::PAGO->value;
    }

    /**
     * Verify if credit is pending
     */
    public function isPendente(): bool
    {
        return $this->status === CreditoStatus::PENDENTE->value;
    }

    /**
     * Get remaining amount to be paid
     */
    public function saldoPendente(): float
    {
        return max(0, ($this->valor_calculado ?? 0) - ($this->valor_pago ?? 0));
    }

    /**
     * Get payment percentage
     */
    public function percentualPago(): float
    {
        if (!$this->valor_calculado || $this->valor_calculado == 0) {
            return 0;
        }
        return min(100, round((($this->valor_pago ?? 0) / $this->valor_calculado) * 100, 2));
    }
}
