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
        Schema::create('lessons', function (Blueprint $table) {
            $table->id();
            $table->string('course_id')->nullable();
            $table->string('l_title')->nullable();
            $table->string('l_desc')->nullable();
            $table->string('l_image')->nullable();
            $table->string('l_video')->nullable();
            $table->string('l_pdf')->nullable();
            $table->string('l_audio')->nullable();
            $table->string('l_text')->nullable();   
        



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
        Schema::dropIfExists('lessons');
    }
};
