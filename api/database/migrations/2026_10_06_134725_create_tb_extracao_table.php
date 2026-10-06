<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tb_extracao', function (Blueprint $table) {
            $table->id('ext_cod');
            $table->date('ext_data')->nullable();
            $table->integer('mpea_lote');
            $table->string('ext_resp', 20)->nullable();
            $table->string('ext_super', 20)->nullable();
            $table->date('seq_dtcorr')->nullable();
            $table->string('seq_resp', 20)->nullable();
            $table->string('seq_super', 20)->nullable();
            $table->string('seq_forlote', 20)->nullable();
            $table->string('seq_ilslote', 20)->nullable();
            $table->string('seq_ladlote', 20)->nullable();
            $table->integer('seq_pip10ul')->nullable();
            $table->integer('seq_pip200ul')->nullable();
            $table->integer('seq_pip1000ul')->nullable();
            $table->string('rea_ftalote', 20)->nullable();
            $table->string('rea_chelexlote', 20)->nullable();
            $table->string('rea_agualote', 20)->nullable();
            $table->string('ampl_resp', 20)->nullable();
            $table->string('ampl_super', 20)->nullable();
            $table->date('ampl_data')->nullable();
            $table->string('ampl_kitlote', 20)->nullable();
            $table->integer('ampl_term9700')->nullable();
            $table->integer('ampl_term2720')->nullable();
            $table->integer('ampl_pip10ul')->nullable();
            $table->integer('ampl_pip200ul')->nullable();
            $table->integer('ampl_pip1000ul')->nullable();
            $table->string('equ_outros', 20)->nullable();
            $table->integer('equ_blcter19')->nullable();
            $table->integer('equ_blcter20')->nullable();
            $table->integer('equ_vortex18')->nullable();
            $table->integer('equ_agimag25')->nullable();
            $table->integer('equ_bombva30')->nullable();
            $table->integer('equ_centr31')->nullable();
            $table->integer('equ_pip10ul')->nullable();
            $table->integer('equ_pip200ul')->nullable();
            $table->integer('equ_pip1000ul')->nullable();
            $table->integer('equ_pip10ulnum')->nullable();
            $table->integer('equ_pip200ulnum')->nullable();
            $table->integer('equ_pip1000ulnum')->nullable();

            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tb_extracao');
    }
}
