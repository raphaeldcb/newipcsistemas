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
        Schema::create('comunicacoes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('caso_id')->nullable()->constrained('tb_casos')->onDelete('set null');
            $table->string('microsoft_message_id')->nullable()->unique();

            $table->string('email_from');
            $table->string('email_to');
            $table->string('subject');
            $table->longText('body');
            $table->text('body_text')->nullable();

            // Classificação por IA
            $table->enum('classification', ['JUDICIAL', 'NON_JUDICIAL', 'UNKNOWN'])->default('UNKNOWN');
            $table->decimal('confidence', 3, 2)->nullable()->comment('0.0-1.0');
            $table->text('reasoning')->nullable()->comment('Explicação da classificação');
            $table->json('extracted_fields')->nullable()->comment('CNJ, Vara, Comarca, Tribunal, Pedido');

            // Status
            $table->enum('sync_status', ['SYNCED', 'PENDING', 'ERROR'])->default('SYNCED');
            $table->text('sync_error')->nullable();

            // Metadata
            $table->dateTime('received_at')->nullable();
            $table->dateTime('classified_at')->nullable();
            $table->timestamps();
            $table->softDeletes();

            // Índices
            $table->index('microsoft_message_id');
            $table->index('caso_id');
            $table->index('sync_status');
            $table->index('classification');
            $table->index('created_at');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('comunicacoes');
    }
};
