<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tb_comarca', function (Blueprint $table) {
            $table->string('uf_sigla', 2);
            $table->integer('com_cod');
            $table->string('com_desc', 40)->nullable();
            $table->string('com_sigla', 2)->nullable();
            $table->primary(['uf_sigla', 'com_cod']);

            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tb_comarca');
    }
};
