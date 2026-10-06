<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tb_coleta_adicional', function (Blueprint $table) {
            $table->integer('coa_id')->autoIncrement();
            $table->integer('pro_cod');
            $table->date('coa_data')->nullable();
            $table->string('coa_hora', 5)->nullable();
            $table->string('coa_obs', 50)->nullable();
            $table->integer('lco_cod')->nullable();
            $table->date('coa_datrec')->nullable();
            $table->primary(['coa_id', 'pro_cod']);

            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tb_coleta_adicional');
    }
}
