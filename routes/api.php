<?php

use App\Http\Controllers\CourseCon;
use App\Http\Controllers\EnrollmentCon;
use App\Http\Controllers\lesson_status_con;
use App\Http\Controllers\lessonCon;
use App\Http\Controllers\note_con;
use App\Http\Controllers\StudentCon;
use App\Http\Controllers\TeacherCon;
use App\Http\Controllers\UserCon;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::controller(UserCon::class)->group(
    function(){
        Route::put("user/update/{id}","update");
        Route::delete("user/delete/{id}","delete");
        Route::post("sign-up","register");
        Route::post("sign-in","login");
        Route::get("logout","logout");
        Route::get("user/get-notes/{id}","get_notes");
    }
);
Route::controller(note_con::class)->group(
    function()  {
        Route::post("note/create","create");
        Route::post("note/update/{id}","update");
        Route::post("note/delete/{id}","delete");
        Route::get("note/get/{id}","get");
        Route::get("note/add-to-favorite/{id}","add_to_favorite");
    }
);

