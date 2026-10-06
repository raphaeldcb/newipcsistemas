<?php

namespace App\Repositories;

use App\Models\Historico;

class HistoricoRepository extends BaseRepository
{
    public function __construct(Historico $model)
    {
        parent::__construct($model);
    }
}
