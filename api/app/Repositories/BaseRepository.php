<?php

namespace App\Repositories;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Collection;

abstract class BaseRepository
{
    protected Model $model;

    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    public function getAll(): Collection
    {
        return $this->model->all();
    }

    public function findById($id): ?Model
    {
        return $this->model->find($id);
    }

    public function findOrFail($id): Model
    {
        return $this->model->findOrFail($id);
    }

    public function create(array $data): Model
    {
        return $this->model->create($data);
    }

    public function update(Model $model, array $data): bool
    {
        return $model->update($data);
    }

    public function delete(Model $model): ?bool
    {
        return $model->delete();
    }

    public function forceDelete(Model $model): ?bool
    {
        return $model->forceDelete();
    }

    public function restore(Model $model): bool
    {
        return $model->restore();
    }

    public function paginate($perPage = 15)
    {
        return $this->model->paginate($perPage);
    }

    public function search(array $filters)
    {
        $query = $this->model;

        foreach ($filters as $key => $value) {
            if ($value !== null) {
                $query = $query->where($key, 'LIKE', "%{$value}%");
            }
        }

        return $query->paginate(15);
    }
}
