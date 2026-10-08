<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Alelo extends BaseModel
{
    protected $table = 'tb_alelos';
    protected $primaryKey = 'cod_ale';
    protected $guarded = [];
    protected $casts = [
        'data_analise' => 'datetime',
        'frequencia_alelo1' => 'float',
        'frequencia_alelo2' => 'float',
    ];

    public function extracao(): BelongsTo
    {
        return $this->belongsTo(Extracao::class, 'extracao_id', 'ext_cod');
    }
}

