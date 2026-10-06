<?php

namespace App\Repositories;

use App\Models\UF;

class UFRepository extends BaseRepository
{
    public function __construct(UF $model)
    {
        parent::__construct($model);
    }
}
