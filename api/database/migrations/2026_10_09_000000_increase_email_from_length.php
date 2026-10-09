<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('comunicacoes', function (Blueprint $table) {
            $table->string('email_from', 500)->nullable()->change();
            $table->string('email_to', 500)->nullable()->change();
        });
    }

    public function down(): void
    {
        Schema::table('comunicacoes', function (Blueprint $table) {
            $table->string('email_from')->nullable()->change();
            $table->string('email_to')->nullable()->change();
        });
    }
};
