<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('response_templates', function (Blueprint $table) {
            $table->id();

            $table->string('nome');
            $table->text('subject_template');
            $table->longText('body_template');
            $table->json('tags')->nullable()->comment('Tags/placeholders disponíveis');
            $table->text('descricao')->nullable();

            $table->foreignId('created_by')->constrained('users')->onDelete('restrict');
            $table->boolean('active')->default(true);

            $table->timestamps();
            $table->softDeletes();

            $table->index('active');
            $table->index('created_by');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('response_templates');
    }
};
