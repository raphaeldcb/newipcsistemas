<?php

namespace App\Models;

class Extracao extends BaseModel
{
    protected $table = 'tb_extracao';
    protected $primaryKey = 'ext_cod';
    protected $guarded = [];

    public function extracacaocasos()
    {
        return $this->hasMany(ExtracacaoCaso::class, 'ext_cod', 'ext_cod');
    }

}
