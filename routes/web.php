<?php

use App\Http\Controllers\ChapterCommentController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\MangaController;
use App\Http\Controllers\ChapterController;
use App\Http\Controllers\FavoriteController;
use App\Http\Controllers\HelpController;
use App\Http\Controllers\MangaCommentController;
use Illuminate\Support\Facades\Route;

/* USUÁRIO */

Route::get('/', [UserController::class, 'index']);
Route::get('/profile', [UserController::class, 'showAuthors']);
Route::get('/authors', [UserController::class, 'showAuthors']);
Route::get('/categorys/{id}', [UserController::class, 'showCategorys']);
Route::get('/create', [UserController::class, 'create'])->middleware('auth');

Route::middleware(['auth:sanctum', config('jetstream.auth_session'), 'verified'])->group(function () {
  Route::get('/dashboard', [UserController::class, 'dashboard'])->name('dashboard');
});

/* MANGÁ */

Route::get('/manga/{id}', [MangaController::class, 'show'])->name('show.manga');
Route::get('/create/manga', [MangaController::class, 'create'])->middleware('auth');
Route::get('/manga/edit/{id}', [MangaController::class, 'edit'])->middleware('auth')->name('edit.manga');
Route::get('/search/manga', [MangaController::class, 'search'])->name('search.manga');
Route::get('/manga/favorite/{id}', [FavoriteController::class, 'store'])->middleware('auth')->name('favorite.manga');

Route::post('/create/manga', [MangaController::class, 'store'])->middleware('auth')->name('create.manga');
Route::post('/manga/edit/{id}', [MangaController::class, 'update'])->middleware('auth')->name('update.manga');
Route::post('/manga/{id}', [MangaCommentController::class, 'store'])->middleware('auth')->name('comment.manga');
// Route::post('/manga/{id}', [FavoriteController::class, 'store'])->middleware('auth')->name('manga.favorite');

/* CAPÍTULO */

Route::get('/chapter/{id}', [ChapterController::class, 'show']);
Route::get('/create/chapter', [ChapterController::class, 'create'])->middleware('auth');
Route::get('/chapter/edit/{id}', [ChapterController::class, 'edit'])->middleware('auth');

Route::post('/create/chapter', [ChapterController::class, 'store'])->middleware('auth')->name('create.chapter');
Route::post('/chapter/save_sketch', [ChapterController::class, 'storeSketch'])->middleware('auth')->name('save.chapter.sketch');
Route::post('/chapter/edit/{id}', [ChapterController::class, 'update'])->middleware('auth')->name('update.chapter');
Route::post('/chapter/{id}', [ChapterCommentController::class, 'store'])->middleware('auth')->name('comment.chapter');

/* AJUDA */

Route::get('/help', [HelpController::class, 'show']);
Route::get('/help/navigation', [HelpController::class, 'navigation'])->name('help.navigation');
Route::get('/help/create', [HelpController::class, 'create'])->name('help.create');
