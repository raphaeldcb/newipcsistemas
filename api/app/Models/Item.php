<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Item extends Model {
    protected $table = 'tb_item';
    protected $primaryKey = 'ite_cod';
    public $timestamps = false;
    
    protected $fillable = ['ite_desc', 'ite_org'];
}
