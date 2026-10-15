<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LaudoExportacao extends Model
{
    protected $table = 'tb_laudo_exportacao';
    protected $primaryKey = 'exp_cod';
    public $timestamps = true;

    protected $fillable = [
        'pro_cod',
        'exp_tipo',
        'exp_data',
        'exp_arquivo',
        'exp_status',
        'exp_obs'
    ];

    protected $casts = [
        'exp_data' => 'datetime',
        'created_at' => 'datetime',
        'updated_at' => 'datetime'
    ];

    public function processo()
    {
        return $this->belongsTo(Processo::class, 'pro_cod', 'pro_cod');
    }
}
