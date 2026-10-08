<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('tb_creditos', function (Blueprint $table) {
            // Add new fields for 5-factor calculation
            if (!Schema::hasColumn('tb_creditos', 'valor_base')) {
                $table->decimal('valor_base', 12, 2)->default(1000.00)->after('pro_dtrec');
            }
            if (!Schema::hasColumn('tb_creditos', 'fator_1')) {
                $table->decimal('fator_1', 5, 4)->default(1.0)->after('valor_base');
            }
            if (!Schema::hasColumn('tb_creditos', 'fator_2')) {
                $table->decimal('fator_2', 5, 4)->default(1.0)->after('fator_1');
            }
            if (!Schema::hasColumn('tb_creditos', 'fator_3')) {
                $table->decimal('fator_3', 5, 4)->default(1.0)->after('fator_2');
            }
            if (!Schema::hasColumn('tb_creditos', 'fator_4')) {
                $table->decimal('fator_4', 5, 4)->default(1.0)->after('fator_3');
            }
            if (!Schema::hasColumn('tb_creditos', 'fator_5')) {
                $table->decimal('fator_5', 5, 4)->default(1.0)->after('fator_4');
            }
            if (!Schema::hasColumn('tb_creditos', 'valor_calculado')) {
                $table->decimal('valor_calculado', 12, 2)->nullable()->after('fator_5');
            }
            if (!Schema::hasColumn('tb_creditos', 'num_parcelas')) {
                $table->integer('num_parcelas')->default(3)->after('valor_calculado');
            }
            if (!Schema::hasColumn('tb_creditos', 'status')) {
                $table->string('status', 50)->default('pendente')->after('num_parcelas');
            }
            if (!Schema::hasColumn('tb_creditos', 'valor_pago')) {
                $table->decimal('valor_pago', 12, 2)->default(0)->after('status');
            }
            if (!Schema::hasColumn('tb_creditos', 'data_pagamento')) {
                $table->timestamp('data_pagamento')->nullable()->after('valor_pago');
            }
            if (!Schema::hasColumn('tb_creditos', 'data_cancelamento')) {
                $table->timestamp('data_cancelamento')->nullable()->after('data_pagamento');
            }
            if (!Schema::hasColumn('tb_creditos', 'motivo_cancelamento')) {
                $table->text('motivo_cancelamento')->nullable()->after('data_cancelamento');
            }
        });
    }

    public function down(): void
    {
        Schema::table('tb_creditos', function (Blueprint $table) {
            $columns = ['valor_base', 'fator_1', 'fator_2', 'fator_3', 'fator_4', 'fator_5',
                       'valor_calculado', 'num_parcelas', 'status', 'valor_pago',
                       'data_pagamento', 'data_cancelamento', 'motivo_cancelamento'];

            foreach ($columns as $column) {
                if (Schema::hasColumn('tb_creditos', $column)) {
                    $table->dropColumn($column);
                }
            }
        });
    }
};
