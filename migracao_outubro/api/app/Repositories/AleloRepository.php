<?php

namespace App\Repositories;

use App\Models\Alelo;

class AleloRepository extends BaseRepository
{
    public function __construct(Alelo $model)
    {
        parent::__construct($model);
    }
}
