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

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::get('transaction/get_info/{id}','TransactionController@get_transaction');

Route::post('location/create','LocationController@create_location');

Route::post('event/create','EventController@create_event');

Route::post('event/ticket/create','EventController@create_ticket');

Route::post('user/create','UserController@create_user');

Route::post('transaction/purchase','TransactionController@purchase');

Route::get('event/get_info/{id}','EventController@get_info');

Route::get('location/{id}','LocationController@get_location');