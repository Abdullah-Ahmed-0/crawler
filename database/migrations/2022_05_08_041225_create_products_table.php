<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('brand', 250)->nullable(0)->default('NA');
            $table->string('name', 250)->nullable()->default('NA');
            $table->string('added_by', 6)->nullable(false)->default('admin');
            $table->integer('user_id')->unsigned()->nullable(0)->default(9);
            $table->integer('category_id')->unsigned()->nullable()->default(1);
            $table->longText('photos')->nullable(0);
            $table->text('thumbnail_img')->nullable();
            $table->longText('description')->nullable();
            $table->double('unit_price', 20, 2)->nullable()->default(0);
            $table->double('purchase_price', 20, 2)->nullable()->default(0);
            $table->integer('variant_product')->unsigned()->nullable(0)->default(0);
            $table->text('attributes')->nullable();
            $table->integer('published')->unsigned()->nullable(0)->default(1);
            $table->integer('approved')->unsigned()->nullable(0)->default(1);
            $table->tinyInteger('cash_on_delivery')->default(1);
            $table->integer('current_stock')->unsigned()->nullable(0)->default(1000);
            $table->string('unit', 20)->nullable()->default('item');
            $table->string('meta_title', 250)->nullable();
            $table->mediumText('meta_description')->nullable();
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
        Schema::dropIfExists('products');
    }
}
