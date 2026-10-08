<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Credito extends Model {
    protected $table = 'tb_creditos';
    protected $primaryKey = 'id_credito';
    public $timestamps = false;
    protected $fillable = ['jui_cod', 'pro_cod'];
}
