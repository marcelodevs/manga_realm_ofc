<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Manga;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\View\View;

class UserController extends Controller
{
  public function index(): View
  {
    $generos = Category::all();
    $manga = MangaController::index();
    $user = auth()->user();
    // var_dump(json_encode($manga[0]));
    return view('user.home.index', ['genero_manga' => $generos, 'mangas' => $manga, 'user' => $user]);
  }

  public function showAuthors(): View
  {
    $authors = (User::whereHas('mangas')->get());
    $user = auth()->user();
    $generos = Category::all();
    $mangas = MangaController::byAuthors($user->id);
    return view('user.home.authors', ['authors' => $authors, 'user' => $user, 'genero_manga' => $generos, 'mangas' => $mangas]);
  }

  /**
   * Método para pegar os Mangás de acordo com a categoria selecionado
   * 
   * @param string $categorie
   * @return View
   */

  public function showCategorys($categore): View
  {
    $user = auth()->user();
    $generos = Category::all();
    $categore = Category::where('category_name', $categore);
    // $mangas = 
    // var_dump($authors[0]->name);
    return view('user.home.categorys', ['user' => $user, 'genero_manga' => $generos, 'categore' => $categore]);
  }

  public function showAuthorUser($id): View
  {
    $user = User::findOrFail($id);
    return view('user.profile.show', ['user' => $user]);
  }

  public function create(): View
  {
    $user = auth()->user();
    return view('user.create.index', ['user' => $user]);
  }
}
