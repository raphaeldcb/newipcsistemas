<?php

namespace App\Models;

class Historico extends BaseModel
{
    protected $table = 'tb_historico';
    protected $primaryKey = 'his_contr';
    protected $guarded = [];

    public function caso()
    {
        return $this->belongsTo(Caso::class, 'pro_cod', 'pro_cod');
    }

}
