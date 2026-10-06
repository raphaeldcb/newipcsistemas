<?php

namespace App\Repositories;

use App\Models\Kit;

class KitRepository extends BaseRepository
{
    public function __construct(Kit $model)
    {
        parent::__construct($model);
    }
}
