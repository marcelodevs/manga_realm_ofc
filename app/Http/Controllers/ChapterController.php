<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ChapterController extends Controller
{
  public static function listAll()
  {
    return;
  }

  public function create()
  {
    $user = auth()->user();
    $mangas = MangaController::byAuthors($user->id)->get();
    return view("user.create.chapter.index", ['user' => $user, 'mangas' => $mangas]);
  }

  public function store(Request $request)
  {
    var_dump($request->request);
  }
}
