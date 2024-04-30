<?php

use App\Http\Controllers\UserController;
use App\Http\Controllers\MangaController;
use App\Http\Controllers\ChapterController;
use Illuminate\Support\Facades\Route;

/* USUÁRIO */

Route::get('/', [UserController::class, 'index']);
Route::get('/help', [UserController::class, 'showHelper']);
Route::get('/profile', [UserController::class, 'showAuthors']);
Route::get('/authors', [UserController::class, 'showAuthors']);
Route::get('/author/{id}', [UserController::class, 'showAuthorUser']);
Route::get('/categorys/{id}', [UserController::class, 'showCategorys']);
Route::get('/create', [UserController::class, 'create'])->middleware('auth');

Route::middleware(['auth:sanctum', config('jetstream.auth_session'), 'verified'])->group(function () {
  Route::get('/dashboard', [UserController::class, 'dashboard'])->name('dashboard');
});

/* MANGÁ */

Route::get('/manga/{id}', [MangaController::class, 'show'])->name('show.manga');
Route::get('/create/manga', [MangaController::class, 'create'])->middleware('auth');
Route::get('/manga/edit/{id}', [MangaController::class, 'edit'])->middleware('auth')->name('edit.manga');

Route::post('/create/manga', [MangaController::class, 'store'])->middleware('auth')->name('create.manga');
Route::post('/manga/edit/{id}', [MangaController::class, 'update'])->middleware('auth')->name('update.manga');

/* CAPÍTULO */

Route::get('/chapter/{id}', [ChapterController::class, 'show']);
Route::get('/create/chapter', [ChapterController::class, 'create'])->middleware('auth');
Route::get('/chapter/edit/{id}', [ChapterController::class, 'edit'])->middleware('auth');

Route::post('/save-as-draft', [ChapterController::class, 'saveAsDraft'])->middleware('auth')->name('save.as.draft');
Route::post('/create/chapter', [ChapterController::class, 'store'])->middleware('auth')->name('create.chapter');
Route::post('/chapter/edit/{id}', [ChapterController::class, 'update'])->middleware('auth')->name('update.chapter');
