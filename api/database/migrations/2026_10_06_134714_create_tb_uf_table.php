<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('tb_uf')) {
            Schema::create('tb_uf', function (Blueprint $table) {
                $table->char('uf_sigla', 2)->primary();
                $table->string('uf_desc', 20)->nullable();

                $table->softDeletes();
                $table->timestamps();
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('tb_uf');
    }
};
