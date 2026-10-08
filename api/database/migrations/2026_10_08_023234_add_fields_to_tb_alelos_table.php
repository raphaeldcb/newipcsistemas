<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('tb_alelos', function (Blueprint $table) {
            $table->unsignedBigInteger('extracao_id')->nullable()->after('cod_ale');
            $table->string('tipo_alelo', 50)->nullable()->after('extracao_id');
            $table->string('marcador', 100)->nullable()->after('tipo_alelo');
            $table->string('alelo1', 50)->nullable()->after('marcador');
            $table->string('alelo2', 50)->nullable()->after('alelo1');
            $table->string('genótipo', 100)->nullable()->after('alelo2');
            $table->decimal('frequencia_alelo1', 5, 4)->nullable()->after('genótipo');
            $table->decimal('frequencia_alelo2', 5, 4)->nullable()->after('frequencia_alelo1');
            $table->text('observacoes')->nullable()->after('frequencia_alelo2');
            $table->dateTime('data_analise')->nullable()->after('observacoes');

            // Add foreign key constraint
            $table->foreign('extracao_id')->references('ext_cod')->on('tb_extracao')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('tb_alelos', function (Blueprint $table) {
            $table->dropForeign(['extracao_id']);
            $table->dropColumn([
                'extracao_id',
                'tipo_alelo',
                'marcador',
                'alelo1',
                'alelo2',
                'genótipo',
                'frequencia_alelo1',
                'frequencia_alelo2',
                'observacoes',
                'data_analise',
            ]);
        });
    }
};
