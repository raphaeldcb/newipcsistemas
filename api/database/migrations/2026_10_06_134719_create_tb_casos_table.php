<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tb_casos', function (Blueprint $table) {
            $table->integer('cas_contr');
            $table->string('cas_codigo', 6)->nullable();
            $table->string('cas_desc', 60)->nullable();
            $table->decimal('cas_vlr', 14, 2)->nullable();
            $table->string('cas_nome0', 3)->nullable();
            $table->string('cas_nome1', 15)->nullable();
            $table->string('cas_nome2', 15)->nullable();
            $table->string('cas_nome3', 15)->nullable();
            $table->string('cas_nome4', 15)->nullable();
            $table->string('cas_sig1', 5)->nullable();
            $table->string('cas_sig2', 5)->nullable();
            $table->string('cas_sig3', 5)->nullable();
            $table->string('cas_sig4', 5)->nullable();

            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tb_casos');
    }
};