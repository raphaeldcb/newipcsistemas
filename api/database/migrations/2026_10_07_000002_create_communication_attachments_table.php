<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('communication_attachments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('comunicacao_id')->constrained('comunicacoes')->onDelete('cascade');

            $table->string('filename');
            $table->string('mime_type')->nullable();
            $table->bigInteger('size')->nullable()->comment('Tamanho em bytes');
            $table->string('path')->nullable()->comment('Caminho no storage');
            $table->string('microsoft_attachment_id')->nullable()->unique();

            $table->timestamps();
            $table->softDeletes();

            $table->index('comunicacao_id');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('communication_attachments');
    }
};
