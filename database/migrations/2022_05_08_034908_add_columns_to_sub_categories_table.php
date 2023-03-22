<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnsToSubCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('jumia_sub_categories', function (Blueprint $table) {
            $table->integer('crawled')->unsigned()->nullable()->default(0);
            $table->integer('is_active')->unsigned()->nullable()->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('jumia_sub_categories', function (Blueprint $table) {
            $table->dropColumn('crawled');
            $table->dropColumn('is_active');
        });
    }
}
