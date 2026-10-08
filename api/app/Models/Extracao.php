<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;

class Extracao extends BaseModel
{
    use SoftDeletes;

    protected $table = 'tb_extracao';
    protected $primaryKey = 'ext_cod';
    protected $guarded = [];

    protected $fillable = [
        'amostra_id',
        'fase',
        'status',
        'resultado',
        'data_fase',
        'observacoes',
    ];

    protected $casts = [
        'data_fase' => 'datetime',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    public function extracacaocasos()
    {
        return $this->hasMany(ExtracacaoCaso::class, 'ext_cod', 'ext_cod');
    }
}
