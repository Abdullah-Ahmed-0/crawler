<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJumiaSubCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jumia_sub_categories', function (Blueprint $table) {
            $table->id();
            $table->integer('category_id')->unsigned()->nullable(false);
            $table->string('name_ar', 200)->nullable()->default('NA');
            $table->string('name_en', 200)->nullable()->default('NA');
            $table->integer('products_count')->nullable();
            $table->text('url')->nullable(false);
            $table->text('image_url')->nullable();
            $table->text('image_location')->nullable();
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
        Schema::dropIfExists('jumia_sub_categories');
    }
}
