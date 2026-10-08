<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Historico extends Model {
    protected $table = 'tb_historico';
    protected $primaryKey = 'his_contr';
    public $timestamps = false;

    protected $fillable = ['pro_cod', 'ite_cod', 'his_data', 'his_doc', 'his_obs'];

    public function item() {
        return $this->belongsTo(Item::class, 'ite_cod', 'ite_cod');
    }
}
