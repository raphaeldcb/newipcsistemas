<?php

namespace App\Repositories;

use App\Models\Juiz;

class JuizRepository extends BaseRepository
{
    public function __construct(Juiz $model)
    {
        parent::__construct($model);
    }
}
