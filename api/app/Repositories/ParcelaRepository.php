<?php

namespace App\Repositories;

use App\Models\Parcela;

class ParcelaRepository extends BaseRepository
{
    public function __construct(Parcela $model)
    {
        parent::__construct($model);
    }
}
