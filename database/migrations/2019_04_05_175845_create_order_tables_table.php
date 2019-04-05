<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrderTablesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_tables', function (Blueprint $table) {
            $table->bigIncrements('id_order');
            $table->integer('id_user')->unsigned();
            $table->enum('user_approval',['0','1']);
            $table->enum('order_in_progress',['0','1']);
            $table->enum('user_complete',['0','1']);
            $table->integer('id_address_book')->unsigned();
            $table->enum('review_points',['1','2','3','4','5']);
            $table->string('review_comment',500);
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
        Schema::dropIfExists('order_tables');
    }
}
