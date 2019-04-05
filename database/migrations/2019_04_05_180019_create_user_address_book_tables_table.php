<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUserAddressBookTablesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_address_book_tables', function (Blueprint $table) {
            $table->bigIncrements('id_address_book');
            $table->integer('id_user')->unsigned();
            $table->String('address',500)->nullable();
            $table->enum('setDefault_address',['0','1']);
            $table->String('phone_number',11)->nullable();
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
        Schema::dropIfExists('user_address_book_tables');
    }
}
