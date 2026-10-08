<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tb_creditos', function (Blueprint $table) {
            $table->id('id_credito');
            $table->integer('jui_cod')->nullable();
            $table->integer('pro_cod')->nullable();
            $table->string('cred_qdcre', 10)->nullable();
            $table->date('cre_data')->nullable();
            $table->date('pro_dtrec')->nullable();
            $table->integer('cred_inicial')->nullable();
            $table->integer('cred_final')->nullable();

            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tb_creditos');
    }
};