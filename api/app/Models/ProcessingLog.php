<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ProcessingLog extends Model
{
    protected $table = 'processing_log';
    public $timestamps = false;

    protected $fillable = [
        'comunicacao_id',
        'action',
        'status',
        'result',
        'duration_ms',
        'user_agent',
        'ip_address',
        'created_at',
    ];

    protected $casts = [
        'result' => 'json',
        'duration_ms' => 'integer',
        'created_at' => 'datetime',
    ];

    public function comunicacao(): BelongsTo
    {
        return $this->belongsTo(Comunicacao::class);
    }

    public function scopeAction($query, $action)
    {
        return $query->where('action', $action);
    }

    public function scopeSuccess($query)
    {
        return $query->where('status', 'SUCCESS');
    }

    public function scopeFailure($query)
    {
        return $query->where('status', 'FAILURE');
    }

    public static function log($action, $status, $result = null, $comunicacao_id = null, $duration_ms = null)
    {
        return self::create([
            'action' => $action,
            'status' => $status,
            'result' => $result,
            'comunicacao_id' => $comunicacao_id,
            'duration_ms' => $duration_ms,
            'user_agent' => request()->header('User-Agent'),
            'ip_address' => request()->ip(),
            'created_at' => now(),
        ]);
    }
}
