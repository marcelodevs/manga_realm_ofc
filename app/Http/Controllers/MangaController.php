<?php

namespace App\Http\Controllers;

use App\Models\Chapter;
use App\Models\Manga;
use App\Models\MangaCategory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class MangaController extends Controller
{

  static function index(): array
  {
    $manga = Manga::all()
      ->sortByDesc('updated_at')
      ->values()
      ->all();

    return $manga;
  }

  public function show(): View
  {
    $id = request('id');
    $manga = Manga::find($id);
    $chapters = Chapter::where('manga_id', $id)
      ->where('sketch', '!=', 1)
      ->orderBy('index')
      ->get();

    $categories_id = MangaCategoryController::byManga($id);
    $categories = CategorysController::byId($categories_id);
    $user = auth()->user();

    $rascunhos = array();
    $favoritos = array();

    $comments = MangaCommentController::index($id);

    $views = [];
    if ($user) {
      foreach ($chapters as $chapter) {
        $views[$chapter->id] = ViewChapterController::validation($user->id, $chapter->id);
      }
    }

    if (FavoriteController::byManga($manga->id)->count() == 1) {
      $favorite = true;
    } else {
      $favorite = false;
    }

    if (auth()->check()) {
      $rascunhos = Chapter::where('sketch', true)
        ->where('user_id', $user->id)
        ->get();

      if (FavoriteController::byUser($user->id)->count() > 0) {
        $mangaFavorite = FavoriteController::byUser($user->id);
        foreach ($mangaFavorite as $item) {
          $favoritos[] = MangaController::byId($item->manga_id);
        }
      }
    }

    return view('user.manga.index', [
      'user'       => $user,
      'views'      => $views,
      'manga'      => $manga,
      'comments'   => $comments,
      'favorite'   => $favorite,
      'chapters'   => $chapters,
      'categories' => $categories,
      'favoritos'    => $favoritos,
      'rascunhos'    => $rascunhos,
    ]);
  }

  /**
   * Método estático para trazer os Mangás por ID
   * 
   * @param  int $id
   * @return Manga
   */

  static function byId($id)
  {
    return Manga::find($id);
  }

  /**
   * Método estático para trazer os Mangás de acordo com o usuário (autor)
   * 
   * @param int $id
   * @return Manga
   */

  static function byAuthors($id)
  {
    $id_authors = $id;

    $manga = Manga::where('user_id', '=', $id_authors)->get();

    return $manga;
  }

  public function create(): View
  {
    $user = auth()->user();
    $categories = CategorysController::show();
    $rascunhos = array();
    $favoritos = array();

    if (auth()->check()) {
      $rascunhos = Chapter::where('sketch', true)
        ->where('user_id', $user->id)
        ->get();

      if (FavoriteController::byUser($user->id)->count() > 0) {
        $manga = FavoriteController::byUser($user->id);
        foreach ($manga as $item) {
          $favorite[] = MangaController::byId($item->manga_id);
        }
      }
    }

    return view(
      'user.create.manga.index',
      [
        'user' => $user,
        'favoritos' => $favorite,
        'rascunhos' => $rascunhos,
        'categories' => $categories
      ]
    );
  }

  public function store(Request $request)
  {
    $user = auth()->user();

    $manga = new Manga;
    $manga->user_id = $user->id;
    $manga->name = $request->name;
    $manga->synopsis = $request->synopsis;
    $manga->created_at = Carbon::now();
    $manga->updated_at = Carbon::now();
    $manga->qtd_chapter = 0;

    if ($request->hasFile('image') && $request->file('image')->isValid()) {
      $requestImage = $request->image;
      $extension = $requestImage->extension();
      $imageName = md5($requestImage->getClientOriginalName() . strtotime('now')) . '.' . $extension;
      $requestImage->move(public_path('images/manga'), $imageName);
      $manga->image = $imageName;
    }

    try {
      DB::beginTransaction();

      $manga->save();

      foreach ($request->categorys as $category_id) {
        MangaCategory::create([
          'manga_id' => $manga->id,
          'category_id' => $category_id,
        ]);
      }

      DB::commit();
    } catch (\Exception $e) {
      DB::rollBack();
      return redirect('/create/manga')->with('error', $e->getMessage());
      // return redirect('/create/manga')->with('error', var_dump($request->categorys));
    }

    return redirect('/')->with('msg', 'Mangá inserido com sucesso!');
  }

  public function edit()
  {
    $id = request('id');
    $manga = Manga::where('id', $id)->get();
    $chapters = DB::table('chapters')
      ->where('manga_id', $id)
      ->where(function ($query) {
        return $query
          ->where('sketch', '!=', 1);
      })
      ->orderBy('index')
      ->get();
    $categories_id = MangaCategoryController::byManga($id);

    $categories = CategorysController::byId($categories_id);

    $all_categories = CategorysController::show();
    $user = auth()->user();
    $rascunhos = array();
    $favoritos = array();

    if (auth()->check()) {
      $rascunhos = Chapter::where('sketch', true)
        ->where('user_id', $user->id)
        ->get();

      if (FavoriteController::byUser($user->id)->count() > 0) {
        $manga = FavoriteController::byUser($user->id);
        foreach ($manga as $item) {
          $favorite[] = MangaController::byId($item->manga_id);
        }
      }
    }

    return view(
      'user.manga.edit.index',
      [
        'user'              => $user,
        'manga'             => $manga[0],
        'chapters'          => $chapters,
        'categories'        => $all_categories,
        'categoriesByManga' => $categories,
        'favoritos'         => $favorite,
        'rascunhos'         => $rascunhos,
      ]
    );
  }

  public function update(Request $request)
  {
    try {
      DB::beginTransaction();

      $id = request('id');

      $manga = Manga::findOrFail($id);

      $manga->synopsis = $request->synopsis;

      $manga->save();

      MangaCategory::where('manga_id', $manga->id)->delete();

      foreach ($request->categorys as $category_id) {
        MangaCategory::create([
          'manga_id' => $manga->id,
          'category_id' => $category_id,
        ]);
      }

      DB::commit();
    } catch (\Exception $e) {
      DB::rollBack();
      return redirect('/manga/edit/' . $request->id)->with('error', $e->getMessage());
    }

    return redirect('/dashboard');
  }

  public function search()
  {
    $query = request('name');
    $mangas = Manga::where('name', 'LIKE', '%' . $query . '%')->get();

    return response()->json([
      'status' => true,
      'data'   => $mangas
    ]);
  }
}
