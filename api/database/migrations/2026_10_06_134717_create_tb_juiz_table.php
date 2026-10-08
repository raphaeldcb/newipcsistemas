<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tb_juiz', function (Blueprint $table) {
            $table->integer('jui_cod');
            $table->string('jui_desc', 50)->nullable();
            $table->char('jui_sexo', 1)->nullable();
            $table->char('jui_credito', 1)->nullable();

            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tb_juiz');
    }
};