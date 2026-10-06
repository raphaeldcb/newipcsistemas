<?php

namespace App\Repositories;

use App\Models\Caso;

class CasoRepository extends BaseRepository
{
    public function __construct(Caso $model)
    {
        parent::__construct($model);
    }
}
