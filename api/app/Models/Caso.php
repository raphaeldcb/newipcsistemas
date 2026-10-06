<?php

namespace App\Models;

class Caso extends BaseModel
{
    protected $table = 'tb_casos';
    protected $primaryKey = 'cas_contr';
    protected $guarded = [];

    public function historicos()
    {
        return $this->hasMany(Historico::class, 'pro_cod', 'pro_cod');
    }

    public function creditos()
    {
        return $this->hasMany(Credito::class, 'pro_cod', 'pro_cod');
    }

}
