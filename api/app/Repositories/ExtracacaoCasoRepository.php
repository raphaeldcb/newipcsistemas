<?php

namespace App\Repositories;

use App\Models\ExtracacaoCaso;

class ExtracacaoCasoRepository extends BaseRepository
{
    public function __construct(ExtracacaoCaso $model)
    {
        parent::__construct($model);
    }
}
