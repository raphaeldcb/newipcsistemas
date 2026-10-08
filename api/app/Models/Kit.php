<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Kit extends Model {
    protected $table = 'tb_kits';
    protected $primaryKey = 'kit_cod';
    public $timestamps = false;
    protected $fillable = ['kit_num', 'col_cod'];
}
