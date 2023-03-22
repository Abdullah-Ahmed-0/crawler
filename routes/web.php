<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CrawlerController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/getCategories', 'App\Http\Controllers\CrawlerController@getCategories')->name('getCategories');
Route::get('/getSubCategories', 'App\Http\Controllers\CrawlerController@getSubCategories')->name('getSubCategories');
Route::get('/getProducts', 'App\Http\Controllers\CrawlerController@getProducts')->name('getProducts');
Route::get('/spinneys-products', 'App\Http\Controllers\CrawlerController@getspinneysProducts')->name('getspinneysProducts');
Route::get('/aloha', 'App\Http\Controllers\CrawlerController@aloha')->name('aloha');
Route::get('/alo', 'App\Http\Controllers\CrawlerController@alo')->name('alo');


Route::get('/spinneys-categoires', 'App\Http\Controllers\CrawlerController@getspinneysParentCategories')->name('getspinneysParentCategories');



