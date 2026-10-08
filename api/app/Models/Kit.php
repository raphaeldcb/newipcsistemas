<?php

namespace App\Models;

class Kit extends BaseModel
{
    protected $table = 'tb_kits';
    protected $primaryKey = 'kit_cod';
    protected $guarded = [];

    protected $casts = [
        'kit_denv' => 'date',
        'kit_dret' => 'date',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];
}
