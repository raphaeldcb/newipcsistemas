<?php

namespace App\Repositories;

use App\Models\Credito;

class CreditoRepository extends BaseRepository
{
    public function __construct(Credito $model)
    {
        parent::__construct($model);
    }
}
