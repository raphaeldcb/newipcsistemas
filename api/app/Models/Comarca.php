<?php

namespace App\Models;

class Comarca extends BaseModel
{
    protected $table = 'tb_comarca';
    protected $primaryKey = 'com_cod';
    protected $guarded = [];

    public function uf()
    {
        return $this->belongsTo(UF::class, 'uf_sigla', 'uf_sigla');
    }

}
