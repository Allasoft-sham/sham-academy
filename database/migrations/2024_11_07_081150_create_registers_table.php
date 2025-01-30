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
        Schema::create('registers', function (Blueprint $table) {
            $table->id();
            $table->string('course_id')->nullable();
            $table->string('user_id')->nullable();
            $table->string('pay_type')->nullable();
            $table->string('pay_status')->nullable();
            $table->string('course_enabled')->nullable();
            $table->string('pay_amount')->nullable();
           



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
        Schema::dropIfExists('registers');
    }
};
