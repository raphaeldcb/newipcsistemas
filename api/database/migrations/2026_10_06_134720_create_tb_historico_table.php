<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tb_historico', function (Blueprint $table) {
            $table->integer('his_contr')->autoIncrement();
            $table->integer('pro_cod');
            $table->integer('ite_cod');
            $table->date('his_data')->nullable();
            $table->string('his_doc', 50)->nullable();
            $table->string('his_obs', 50)->nullable();
            $table->primary(['his_contr', 'pro_cod']);

            $table->primary(['his_contr', 'pro_cod']);
            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tb_historico');
    }
}
