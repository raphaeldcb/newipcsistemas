<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tb_kits', function (Blueprint $table) {
            $table->id('kit_cod');
            $table->integer('kit_tip')->nullable();
            $table->integer('kit_num');
            $table->integer('col_cod');
            $table->date('kit_denv')->nullable();
            $table->date('kit_dret')->nullable();
            $table->integer('kit_cexa')->nullable();
            $table->char('kit_status', 1)->nullable();
            $table->string('kit_rastrear', 20)->nullable();

            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tb_kits');
    }
};