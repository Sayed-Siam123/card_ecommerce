<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateItemTablesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('item_tables', function (Blueprint $table) {
            $table->bigIncrements('id_item');
            $table->integer('id_product')->unique();
            $table->integer('id_order')->unique();
            $table->enum('quantity_no',['100','250','300']);
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
        Schema::dropIfExists('item_tables');
    }
}
