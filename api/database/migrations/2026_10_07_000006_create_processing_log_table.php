<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('processing_log', function (Blueprint $table) {
            $table->id();
            $table->foreignId('comunicacao_id')->nullable()->constrained('comunicacoes')->onDelete('cascade');

            $table->string('action')->comment('sync, classify, respond, extract, etc.');
            $table->enum('status', ['STARTED', 'SUCCESS', 'FAILURE', 'SKIPPED'])->default('STARTED');
            $table->json('result')->nullable()->comment('Resultado detalhado ou erro');
            $table->integer('duration_ms')->nullable()->comment('Duração em milissegundos');

            $table->string('user_agent')->nullable();
            $table->string('ip_address')->nullable();

            $table->timestamp('created_at')->index();

            // Sem updated_at (log imutável)
            $table->index('comunicacao_id');
            $table->index('status');
            $table->index('action');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('processing_log');
    }
};
