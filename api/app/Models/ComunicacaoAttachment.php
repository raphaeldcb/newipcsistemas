<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class ComunicacaoAttachment extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'communication_attachments';

    protected $fillable = [
        'comunicacao_id',
        'filename',
        'mime_type',
        'size',
        'path',
        'microsoft_attachment_id',
    ];

    protected $casts = [
        'size' => 'integer',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    public function comunicacao(): BelongsTo
    {
        return $this->belongsTo(Comunicacao::class);
    }
}
