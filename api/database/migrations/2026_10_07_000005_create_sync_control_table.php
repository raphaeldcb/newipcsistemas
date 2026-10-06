<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('sync_control', function (Blueprint $table) {
            $table->id();

            $table->string('service')->unique()->comment('Ex: microsoft_graph');
            $table->dateTime('last_sync')->nullable();
            $table->dateTime('next_sync')->nullable();
            $table->enum('status', ['IDLE', 'RUNNING', 'ERROR'])->default('IDLE');
            $table->text('error_message')->nullable();
            $table->integer('items_synced')->default(0);

            $table->timestamps();

            $table->index('status');
            $table->index('last_sync');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('sync_control');
    }
};
