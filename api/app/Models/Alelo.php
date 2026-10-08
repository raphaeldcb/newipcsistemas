<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Alelo extends Model {
    protected $table = 'tb_alelos';
    protected $primaryKey = 'cod_ale';
    public $timestamps = false;
    protected $fillable = ['nm1_ale', 'nm2_ale'];
}
