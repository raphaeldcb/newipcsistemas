<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Pessoa extends Model {
    protected $table = 'tb_pessoas';
    protected $primaryKey = 'pes_cod';
    public $timestamps = false;
    protected $fillable = ['pro_cod', 'pes_nome', 'pes_iniciais'];
}
