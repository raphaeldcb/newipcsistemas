<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tb_varas', function (Blueprint $table) {
            $table->string('uf_sigla', 2);
            $table->integer('com_cod');
            $table->integer('var_cod');
            $table->string('var_desc', 40)->nullable();
            $table->integer('jui_cod')->nullable();
            $table->string('var_sigla', 3)->nullable();
            $table->string('var_end', 80)->nullable();
            $table->string('var_bairro', 40)->nullable();
            $table->string('var_cid', 40)->nullable();
            $table->string('var_cep', 12)->nullable();
            $table->primary(['uf_sigla', 'com_cod', 'var_cod']);

            $table->primary(['uf_sigla', 'com_cod', 'var_cod']);
            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tb_varas');
    }
}
