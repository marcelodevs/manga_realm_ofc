<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Chapter;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;

class UserController extends Controller
{
  public function index(): View
  {
    $generos = Category::all();
    $mangas = MangaController::index();
    $user = auth()->user();
    $rascunhos = [];

    if (auth()->check()) {
      $rascunhos = Chapter::where('sketch', true)
        ->where('user_id', $user->id)
        ->get();
    }

    return view('user.home.index', [
      'user'         => $user,
      'mangas'       => $mangas,
      'rascunhos'    => $rascunhos,
      'genero_manga' => $generos,
    ]);
  }

  public function showAuthors(): View
  {
    $authors = (User::whereHas('mangas')->get());
    $user = auth()->user();
    $generos = Category::all();
    $mangas = MangaController::byAuthors($user->id);
    return view(
      'user.home.authors',
      [
        'user'         => $user,
        'mangas'       => $mangas,
        'authors'      => $authors,
        'genero_manga' => $generos,
      ]
    );
  }

  /**
   * Método para pegar os Mangás de acordo com a categoria selecionado
   * 
   * @param string $categorie
   * @return View
   */

  public function showCategorys(): View
  {
    $user = auth()->user();
    $generos = Category::all();
    $category_name = request('id');
    $category = MangaCategoryController::show($category_name);
    $mangaIds = [];
    $rascunhos = [];

    if (auth()->check()) {
      $rascunhos = Chapter::where('sketch', true)
        ->where('user_id', $user->id)
        ->get();
    }

    foreach ($category as $mangaCategory) {
      $mangaIds[] = $mangaCategory;
    }

    foreach ($mangaIds as $id) {
      $mangas = MangaController::byId($id);
    }

    return view(
      'user.home.categorys',
      [
        'user'         => $user,
        'mangas'       => $mangas,
        'rascunhos'    => $rascunhos,
        'genero_manga' => $generos,
        'category'     => $category_name,
      ]
    );
  }

  public function create(): View
  {
    $user = auth()->user();
    return view('user.create.index', ['user' => $user]);
  }

  public function dashboard()
  {
    $user = auth()->user();
    $rascunhos = DB::table('chapters')
      ->where('sketch', true)
      ->get();
    $mangas = DB::table('mangas')
      ->where('user_id', $user->id)
      ->get();
    $favorite = array();

    if (FavoriteController::byUser($user->id)->count() > 0) {
      $manga = FavoriteController::byUser($user->id);
      foreach ($manga as $item) {
        $favorite[] = MangaController::byId($item->manga_id);
      }
    }

    return view(
      'dashboard',
      [
        'mangas'    => $mangas,
        'favorites' => $favorite,
        'rascunhos' => $rascunhos,
      ]
    );
  }
}
