<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tb_parcelas', function (Blueprint $table) {
            $table->integer('pro_cod');
            $table->integer('par_nparc')->nullable();
            $table->decimal('par_vlr', 14, 2)->nullable();
            $table->date('par_data')->nullable();
            $table->integer('par_sit')->nullable();
            $table->string('par_tppg', 30)->nullable();
            $table->integer('controle')->autoIncrement();
            $table->string('par_obs', 80)->nullable();
            $table->time('par_hora')->nullable();
            $table->string('par_onde', 20)->nullable();
            $table->date('par_dataprevista')->nullable();
            $table->string('par_nmfor', 100)->nullable();
            $table->primary(['pro_cod', 'controle']);

            $table->primary(['pro_cod', 'controle']);
            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tb_parcelas');
    }
};