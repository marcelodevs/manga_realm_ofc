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

  static function index(): mixed
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
    $manga = Manga::where('id', $id)->get();
    $chapters = DB::table('chapters')
      ->where('manga_id', $id)
      ->orderBy('index')
      ->get();
    $categories_id = MangaCategoryController::byManga($id);
    
    $categories = CategorysController::byId($categories_id);
    $user = auth()->user();
    return view(
      'user.manga.index',
      [
        'manga' => $manga[0],
        'user' => $user,
        'chapters' => $chapters,
        'categories' => $categories
      ]
    );
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

    return view(
      'user.create.manga.index',
      [
        'user' => $user,
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
    $manga->categorys = '{}';
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
}
