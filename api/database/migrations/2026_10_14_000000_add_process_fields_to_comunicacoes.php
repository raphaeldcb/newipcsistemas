<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('comunicacoes', function (Blueprint $table) {
            $table->string('numero_processo', 30)->nullable()->after('classification');
            $table->string('estado', 2)->nullable()->after('numero_processo');
            $table->string('vara')->nullable()->after('estado');
            $table->string('comarca')->nullable()->after('vara');
        });
    }

    public function down(): void
    {
        Schema::table('comunicacoes', function (Blueprint $table) {
            $table->dropColumn(['numero_processo', 'estado', 'vara', 'comarca']);
        });
    }
};
