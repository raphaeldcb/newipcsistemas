<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Caso extends Model
{
    protected $table = 'tb_casos';
    protected $primaryKey = 'cas_contr';
    public $timestamps = false;
    
    protected $fillable = ['cas_codigo', 'cas_desc', 'cas_vlr'];
}
