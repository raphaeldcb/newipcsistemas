<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::table('comunicacoes', function (Blueprint $table) {
            if (!Schema::hasColumn('comunicacoes', 'body')) {
                $table->longText('body')->nullable()->after('subject');
            }
            if (!Schema::hasColumn('comunicacoes', 'classification')) {
                $table->string('classification')->nullable()->default('Outro')->after('body');
            }
            if (!Schema::hasColumn('comunicacoes', 'suggested_response')) {
                $table->longText('suggested_response')->nullable()->after('classification');
            }
            if (!Schema::hasColumn('comunicacoes', 'final_response')) {
                $table->longText('final_response')->nullable()->after('suggested_response');
            }
            if (!Schema::hasColumn('comunicacoes', 'status')) {
                $table->string('status')->default('pending_response')->after('final_response');
            }
            if (!Schema::hasColumn('comunicacoes', 'response_sent_at')) {
                $table->timestamp('response_sent_at')->nullable()->after('status');
            }
        });
    }

    public function down(): void {
        Schema::table('comunicacoes', function (Blueprint $table) {
            $table->dropColumn(['body', 'classification', 'suggested_response', 'final_response', 'status', 'response_sent_at']);
        });
    }
};
