<?php

namespace Tests\Unit\Repositories;

use Tests\TestCase;
use App\Models\Pessoa;
use App\Repositories\PessoaRepository;
use Illuminate\Foundation\Testing\RefreshDatabase;

class PessoaRepositoryTest extends TestCase
{
    use RefreshDatabase;

    protected PessoaRepository $repository;

    protected function setUp(): void
    {
        parent::setUp();
        $this->repository = app(PessoaRepository::class);
    }

    public function test_create_pessoa(): void
    {
        $data = [
            'pes_nome' => 'João Silva',
            'pes_ndoc' => '12345678901',
            'pes_sexo' => 'M',
        ];

        $pessoa = $this->repository->create($data);

        $this->assertInstanceOf(Pessoa::class, $pessoa);
        $this->assertEquals('João Silva', $pessoa->pes_nome);
        $this->assertEquals('12345678901', $pessoa->pes_ndoc);
    }

    public function test_find_by_id(): void
    {
        $pessoa = Pessoa::factory()->create();

        $found = $this->repository->findById($pessoa->pes_cod);

        $this->assertNotNull($found);
        $this->assertEquals($pessoa->pes_cod, $found->pes_cod);
    }

    public function test_update_pessoa(): void
    {
        $pessoa = Pessoa::factory()->create(['pes_nome' => 'João']);

        $this->repository->update($pessoa, ['pes_nome' => 'Maria']);

        $this->assertEquals('Maria', $pessoa->pes_nome);
    }

    public function test_delete_pessoa(): void
    {
        $pessoa = Pessoa::factory()->create();

        $this->repository->delete($pessoa);

        $this->assertSoftDeleted('tb_pessoas', ['pes_cod' => $pessoa->pes_cod]);
    }

    public function test_restore_pessoa(): void
    {
        $pessoa = Pessoa::factory()->create();
        $pessoa->delete();

        $this->repository->restore($pessoa);

        $this->assertNotSoftDeleted('tb_pessoas', ['pes_cod' => $pessoa->pes_cod]);
    }

    public function test_paginate(): void
    {
        Pessoa::factory()->count(20)->create();

        $paginated = $this->repository->paginate(10);

        $this->assertCount(10, $paginated->items());
        $this->assertEquals(20, $paginated->total());
    }

    public function test_search(): void
    {
        Pessoa::factory()->create(['pes_nome' => 'João Silva']);
        Pessoa::factory()->create(['pes_nome' => 'Maria Santos']);
        Pessoa::factory()->create(['pes_nome' => 'João Pedro']);

        $results = $this->repository->search(['pes_nome' => 'João']);

        $this->assertGreaterThanOrEqual(2, $results->total());
    }

    public function test_get_all(): void
    {
        Pessoa::factory()->count(5)->create();

        $all = $this->repository->getAll();

        $this->assertCount(5, $all);
    }
}
