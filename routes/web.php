<?php

use App\Http\Controllers\UserController;
use App\Http\Controllers\MangaController;
use App\Http\Controllers\ChapterController;
use Illuminate\Support\Facades\Route;

Route::get('/', [UserController::class, 'index']);
Route::get('/profile', [UserController::class, 'showAuthors']);
Route::get('/authors', [UserController::class, 'showAuthors']);
Route::get('/author/{id}', [UserController::class, 'showAuthorUser']);
Route::get('/categorys/{id}', [UserController::class, 'showCategorys']);
Route::get('/create', [UserController::class, 'create'])->middleware('auth');
Route::get('/create/manga', [MangaController::class, 'create'])->middleware('auth');
Route::get('/create/chapter', [ChapterController::class, 'create'])->middleware('auth');

Route::post('/create/manga', [MangaController::class, 'store'])->middleware('auth')->name('create.manga');
Route::post('/create/chapter', [ChapterController::class, 'store'])->middleware('auth')->name('create.chapter');

Route::middleware(['auth:sanctum', config('jetstream.auth_session'), 'verified'])->group(function () {
  Route::get('/dashboard', function () {
    return view('dashboard');
  })->name('dashboard');
});