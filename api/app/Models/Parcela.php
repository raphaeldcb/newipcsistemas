<?php

namespace App\Models;

class Parcela extends BaseModel
{
    protected $table = 'tb_parcelas';
    protected $primaryKey = 'controle';
    protected $guarded = [];

    public function credito()
    {
        return $this->belongsTo(Credito::class, 'pro_cod', 'pro_cod');
    }

}
