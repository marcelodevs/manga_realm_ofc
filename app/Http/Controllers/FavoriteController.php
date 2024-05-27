<?php

namespace App\Http\Controllers;

use App\Models\Favorite;
use Illuminate\Http\Request;

class FavoriteController extends Controller
{
  static function index(int $user_id)
  {
    return Favorite::where('user_id', $user_id)->get();
  }

  public function store()
  {
    $favorite = new Favorite;
    $manga_id = request('id');
    $user_id = auth()->user();

    $favorite->manga_id = $manga_id;
    $favorite->user_id = $user_id->id;

    try {
      $favorite->save();
      return redirect('/manga/' . $favorite->manga_id);
    } catch (\Exception $e) {
      return redirect('/manga/' . $favorite->manga_id)->with('error', 'Erro: ' . $e->getMessage());
    }
  }
}
