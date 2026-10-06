<?php

namespace App\Models;

class Credito extends BaseModel
{
    protected $table = 'tb_creditos';
    protected $primaryKey = 'id_credito';
    protected $guarded = [];

    public function parcelas()
    {
        return $this->hasMany(Parcela::class, 'pro_cod', 'pro_cod');
    }

}
