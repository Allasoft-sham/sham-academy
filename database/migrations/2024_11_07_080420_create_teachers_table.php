<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('teachers', function (Blueprint $table) {
            $table->id();
            $table->string('t_name')->nullable();
            $table->string('t_email')->nullable();
            $table->string('t_mobile')->nullable();
            $table->string('t_address')->nullable();
            $table->string('t_image')->nullable();
            $table->string('t_password')->nullable();
            $table->string('t_majority')->nullable();
            $table->string('t_cv')->nullable();
            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('teachers');
    }
};
