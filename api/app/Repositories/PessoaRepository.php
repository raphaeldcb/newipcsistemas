<?php

namespace App\Repositories;

use App\Models\Pessoa;

class PessoaRepository extends BaseRepository
{
    public function __construct(Pessoa $model)
    {
        parent::__construct($model);
    }
}
