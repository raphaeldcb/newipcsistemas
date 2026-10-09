<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comunicacao extends Model
{
    protected $table = 'comunicacoes';
    public $timestamps = true;
    
    protected $fillable = [
        'email_from',
        'email_to',
        'subject',
        'body',
        'classification',
        'confidence',
        'caso_id',
        'suggested_response',
        'final_response',
        'status',
        'response_sent_at',
    ];
}
