<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('communication_responses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('comunicacao_id')->constrained('comunicacoes')->onDelete('cascade');
            $table->foreignId('template_id')->nullable()->constrained('response_templates')->onDelete('set null');

            $table->string('subject');
            $table->longText('body');
            $table->enum('status', ['DRAFT', 'SCHEDULED', 'SENT', 'FAILED'])->default('DRAFT');
            $table->text('error_message')->nullable();

            $table->dateTime('sent_at')->nullable();
            $table->foreignId('sent_by')->nullable()->constrained('users')->onDelete('set null');

            $table->timestamps();
            $table->softDeletes();

            $table->index('comunicacao_id');
            $table->index('status');
            $table->index('sent_at');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('communication_responses');
    }
};
