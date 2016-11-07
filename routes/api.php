<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

header('Access-Control-Allow-Origin: *');
header( 'Access-Control-Allow-Headers: Authorization, Content-Type' );

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:api');

Route::get('search', 'SearchController@search');
Route::get('model', 'ModelController@modelList');
Route::get('signal', 'SignalController@signalList');
Route::get('lane/{id}', 'LaneController@laneList');