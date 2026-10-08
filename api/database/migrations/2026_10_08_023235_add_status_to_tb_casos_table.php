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
        Schema::table('tb_casos', function (Blueprint $table) {
            $table->string('status', 20)->default('ABERTO')->after('cas_sig4');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('tb_casos', function (Blueprint $table) {
            $table->dropColumn('status');
        });
    }
};
