<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('tb_pessoas', function (Blueprint $table) {
            // Rename legacy columns to new names for clarity
            if (!Schema::hasColumn('tb_pessoas', 'nome')) {
                $table->string('nome', 255)->nullable()->after('pes_nome');
            }
            if (!Schema::hasColumn('tb_pessoas', 'tipo')) {
                $table->enum('tipo', ['FISICA', 'JURIDICA'])->default('FISICA')->after('nome');
            }
            if (!Schema::hasColumn('tb_pessoas', 'documento')) {
                $table->string('documento', 20)->nullable()->unique()->after('tipo');
            }
            if (!Schema::hasColumn('tb_pessoas', 'email')) {
                $table->string('email', 255)->nullable()->after('documento');
            }
            if (!Schema::hasColumn('tb_pessoas', 'telefone')) {
                $table->string('telefone', 20)->nullable()->after('email');
            }
        });
    }

    public function down(): void
    {
        Schema::table('tb_pessoas', function (Blueprint $table) {
            $columns = ['nome', 'tipo', 'documento', 'email', 'telefone'];

            foreach ($columns as $column) {
                if (Schema::hasColumn('tb_pessoas', $column)) {
                    $table->dropColumn($column);
                }
            }
        });
    }
};
