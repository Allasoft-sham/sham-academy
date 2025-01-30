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
        Schema::create('homework', function (Blueprint $table) {
            $table->id();
            $table->string('h_title')->nullable();
            $table->string('h_desc')->nullable();
            $table->string('h_pdf')->nullable();
            $table->string('h_image')->nullable();
            $table->string('h_start_date')->nullable();
            $table->string('h_end_date')->nullable();
            $table->string('course_id')->nullable();
            $table->string('teacher_id')->nullable();
            $table->string('user_id')->nullable();
            

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
        Schema::dropIfExists('homework');
    }
};
