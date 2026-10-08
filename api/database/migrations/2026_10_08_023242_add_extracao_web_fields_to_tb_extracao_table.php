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
        Schema::table('tb_extracao', function (Blueprint $table) {
            $table->unsignedBigInteger('amostra_id')->nullable()->after('ext_cod');
            $table->enum('fase', ['QUANTIFICACAO', 'QUALIFICACAO', 'INTERPRETACAO'])->default('QUANTIFICACAO')->after('amostra_id');
            $table->string('status', 50)->default('PENDENTE')->after('fase');
            $table->text('resultado')->nullable()->after('status');
            $table->dateTime('data_fase')->nullable()->after('resultado');
            $table->text('observacoes')->nullable()->after('data_fase');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('tb_extracao', function (Blueprint $table) {
            $table->dropColumn(['amostra_id', 'fase', 'status', 'resultado', 'data_fase', 'observacoes']);
        });
    }
};
