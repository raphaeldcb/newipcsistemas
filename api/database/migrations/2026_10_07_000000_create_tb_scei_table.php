<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tb_scei', function (Blueprint $table) {
            $table->id('scei_cod');
            $table->unsignedBigInteger('amostra_id')->nullable();
            $table->string('exame_tipo', 100);
            $table->string('resultado', 255)->nullable();
            $table->dateTime('data_exame')->nullable();
            $table->unsignedBigInteger('laboratorio_id')->nullable();
            $table->unsignedBigInteger('caso_id')->nullable();
            $table->integer('scei_fase')->default(1);
            $table->decimal('valor_exame', 10, 2)->nullable();
            $table->date('data_coleta')->nullable();
            $table->unsignedBigInteger('responsavel_id')->nullable();
            $table->dateTime('data_recebimento')->nullable();
            $table->dateTime('data_analise')->nullable();
            $table->string('resultado_valor', 100)->nullable();
            $table->string('resultado_referencia', 100)->nullable();
            $table->string('resultado_unidade', 20)->nullable();
            $table->dateTime('data_liberacao')->nullable();
            $table->string('status_laudo', 50)->nullable();
            $table->dateTime('data_laudo')->nullable();
            $table->text('motivo_cancelamento')->nullable();
            $table->text('observacoes')->nullable();
            $table->softDeletes();
            $table->timestamps();

            $table->foreign('caso_id')->references('id')->on('tb_casos')->onDelete('set null');
            $table->foreign('laboratorio_id')->references('id')->on('usuarios')->onDelete('set null');
            $table->foreign('responsavel_id')->references('id')->on('users')->onDelete('set null');

            $table->index('exame_tipo');
            $table->index('data_exame');
            $table->index('scei_fase');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tb_scei');
    }
};
