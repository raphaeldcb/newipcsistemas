<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tb_pessoas', function (Blueprint $table) {
            $table->integer('pro_cod');
            $table->integer('pes_cod')->autoIncrement();
            $table->string('pes_nome', 60)->nullable();
            $table->string('pes_iniciais', 10)->nullable();
            $table->integer('pes_sit')->nullable();
            $table->date('pes_dtnas')->nullable();
            $table->string('pes_lcnas', 50)->nullable();
            $table->char('pes_sexo', 1)->nullable();
            $table->string('pes_tdoc', 30)->nullable();
            $table->string('pes_ndoc', 200)->nullable();
            $table->primary(['pro_cod', 'pes_cod']);

            $table->primary(['pro_cod', 'pes_cod']);
            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tb_pessoas');
    }
};