<?php

namespace App\Repositories;

use App\Models\Vara;

class VaraRepository extends BaseRepository
{
    public function __construct(Vara $model)
    {
        parent::__construct($model);
    }
}
