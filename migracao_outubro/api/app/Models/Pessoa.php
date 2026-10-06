<?php

namespace App\Models;

class Pessoa extends BaseModel
{
    protected $table = 'tb_pessoas';
    protected $primaryKey = 'pes_cod';
    protected $guarded = [];

}
