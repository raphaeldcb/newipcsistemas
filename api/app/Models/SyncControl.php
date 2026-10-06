<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SyncControl extends Model
{
    protected $table = 'sync_control';
    public $timestamps = true;

    protected $fillable = [
        'service',
        'last_sync',
        'next_sync',
        'status',
        'error_message',
        'items_synced',
    ];

    protected $casts = [
        'last_sync' => 'datetime',
        'next_sync' => 'datetime',
        'items_synced' => 'integer',
    ];

    public function scopeService($query, $service)
    {
        return $query->where('service', $service);
    }

    public function scopeError($query)
    {
        return $query->where('status', 'ERROR');
    }

    public static function microsoft()
    {
        return self::firstOrCreate(
            ['service' => 'microsoft_graph'],
            ['status' => 'IDLE']
        );
    }
}
