<?php

namespace App\Repositories;

use App\Models\ColetaAdicional;

class ColetaAdicionalRepository extends BaseRepository
{
    public function __construct(ColetaAdicional $model)
    {
        parent::__construct($model);
    }
}
