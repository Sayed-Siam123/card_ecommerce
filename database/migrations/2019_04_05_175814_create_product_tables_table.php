<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductTablesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_tables', function (Blueprint $table) {
            $table->bigIncrements('id_product');
            $table->integer('id_user')->unique();
            $table->string('product_name');
            $table->string('product_file');
            $table->integer('id_catagories');
            $table->integer('id_sub_catagories');
            $table->enum('quantity_no',['100','250','300']);
            $table->float('rate',8,2);
            $table->float('discount_rate',3,2);
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
        Schema::dropIfExists('product_tables');
    }
}
