<?php

namespace App\Models;

class Vara extends BaseModel
{
    protected $table = 'tb_varas';
    protected $primaryKey = 'var_cod';
    protected $guarded = [];

    public function comarca()
    {
        return $this->belongsTo(Comarca::class, 'com_cod', 'com_cod');
    }

}
