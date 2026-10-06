<?php

namespace App\Models;

class ExtracacaoCaso extends BaseModel
{
    protected $table = 'tb_extracao_casos';
    protected $primaryKey = 'extc_cod';
    protected $guarded = [];

    public function extracao()
    {
        return $this->belongsTo(Extracao::class, 'ext_cod', 'ext_cod');
    }

}
