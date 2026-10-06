<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Comunicacao extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'comunicacoes';

    protected $fillable = [
        'caso_id',
        'microsoft_message_id',
        'email_from',
        'email_to',
        'subject',
        'body',
        'body_text',
        'classification',
        'confidence',
        'reasoning',
        'extracted_fields',
        'sync_status',
        'sync_error',
        'received_at',
        'classified_at',
    ];

    protected $casts = [
        'confidence' => 'float',
        'extracted_fields' => 'json',
        'received_at' => 'datetime',
        'classified_at' => 'datetime',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    // Relações
    public function caso(): BelongsTo
    {
        return $this->belongsTo(Caso::class);
    }

    public function attachments(): HasMany
    {
        return $this->hasMany(ComunicacaoAttachment::class);
    }

    public function responses(): HasMany
    {
        return $this->hasMany(ComunicacaoResposta::class);
    }

    public function logs(): HasMany
    {
        return $this->hasMany(ProcessingLog::class);
    }

    // Scopes
    public function scopeJudicial($query)
    {
        return $query->where('classification', 'JUDICIAL');
    }

    public function scopeNonJudicial($query)
    {
        return $query->where('classification', 'NON_JUDICIAL');
    }

    public function scopeSynced($query)
    {
        return $query->where('sync_status', 'SYNCED');
    }

    public function scopeHighConfidence($query)
    {
        return $query->where('confidence', '>=', 0.8);
    }
}
