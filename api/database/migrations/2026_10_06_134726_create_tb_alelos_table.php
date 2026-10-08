<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tb_alelos', function (Blueprint $table) {
            $table->id('cod_ale');
            $table->string('nm1_ale', 100)->nullable();
            $table->string('nm2_ale', 100)->nullable();
            $table->string('nm3_ale', 100)->nullable();
            $table->string('nm4_ale', 100)->nullable();
            $table->string('mar_ale', 200)->nullable();
            $table->string('al1_ale', 30)->nullable();
            $table->string('al2_ale', 30)->nullable();
            $table->integer('ord_ale')->nullable();

            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tb_alelos');
    }
};