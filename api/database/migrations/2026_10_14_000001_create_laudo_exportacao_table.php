<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tb_laudo_exportacao', function (Blueprint $table) {
            $table->id('exp_cod');
            $table->unsignedInteger('pro_cod')->nullable();
            $table->string('exp_tipo', 20)->comment('DNA, HIV, SCEI, etc');
            $table->dateTime('exp_data');
            $table->string('exp_arquivo', 255)->nullable()->comment('Nome do arquivo gerado');
            $table->string('exp_status', 20)->default('pendente')->comment('processado, pendente, erro');
            $table->text('exp_obs')->nullable()->comment('Observações/erros');
            $table->timestamps();

            $table->index('pro_cod');
            $table->index('exp_status');
            $table->index('exp_tipo');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tb_laudo_exportacao');
    }
};
