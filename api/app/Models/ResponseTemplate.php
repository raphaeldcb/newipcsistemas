<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class ResponseTemplate extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'response_templates';

    protected $fillable = [
        'nome',
        'subject_template',
        'body_template',
        'tags',
        'descricao',
        'created_by',
        'active',
    ];

    protected $casts = [
        'tags' => 'json',
        'active' => 'boolean',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function responses(): HasMany
    {
        return $this->hasMany(ComunicacaoResposta::class, 'template_id');
    }

    public function scopeActive($query)
    {
        return $query->where('active', true);
    }
}
