<?php

namespace App\Repositories;

use App\Models\Extracao;

class ExtracaoRepository extends BaseRepository
{
    public function __construct(Extracao $model)
    {
        parent::__construct($model);
    }
}
