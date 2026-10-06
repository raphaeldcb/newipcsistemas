<?php

namespace App\Repositories;

use App\Models\Comarca;

class ComarcaRepository extends BaseRepository
{
    public function __construct(Comarca $model)
    {
        parent::__construct($model);
    }
}
