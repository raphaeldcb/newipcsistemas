<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class ComunicacaoResposta extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'communication_responses';

    protected $fillable = [
        'comunicacao_id',
        'template_id',
        'subject',
        'body',
        'status',
        'error_message',
        'sent_at',
        'sent_by',
    ];

    protected $casts = [
        'sent_at' => 'datetime',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    public function comunicacao(): BelongsTo
    {
        return $this->belongsTo(Comunicacao::class);
    }

    public function template(): BelongsTo
    {
        return $this->belongsTo(ResponseTemplate::class, 'template_id');
    }

    public function sentBy(): BelongsTo
    {
        return $this->belongsTo(User::class, 'sent_by');
    }

    public function scopeSent($query)
    {
        return $query->where('status', 'SENT');
    }

    public function scopeDraft($query)
    {
        return $query->where('status', 'DRAFT');
    }
}
