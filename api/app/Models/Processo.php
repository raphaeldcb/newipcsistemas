<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Processo extends Model {
    protected $table = 'tb_processo';
    protected $primaryKey = 'pro_cod';
    public $timestamps = false;
    
    protected $fillable = [
        'pro_ano', 'pro_nperc', 'pro_tipo', 'pro_auto',
        'uf_sigla', 'cas_codigo', 'pro_dcad', 'pro_drec'
    ];
}
