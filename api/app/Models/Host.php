<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Host extends Authenticatable
{
    use Notifiable;

    protected $table = 'tb_hosts';
    protected $primaryKey = 'hos_usua';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'hos_nome',
        'hos_usua',
        'hos_senha',
        'res_cod',
        'hos_maqui',
        'hos_situacao',
        'hos_dtultalt',
    ];

    protected $hidden = [
        'hos_senha',
    ];

    protected $casts = [
        'hos_dtultalt' => 'date',
    ];

    // Usar hos_usua como username e hos_senha como password
    public function getAuthPassword()
    {
        return $this->hos_senha;
    }
}
