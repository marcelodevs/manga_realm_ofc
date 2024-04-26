<?php

namespace App\Http\Controllers;

use App\Models\Chapter;
use App\Models\Manga;
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
    $user = auth()->user();
    return view('user.manga.index', ['manga' => $manga[0], 'user' => $user, 'chapters' => $chapters]);
  }

  /**
   * Método estático para trazer os Mangás por ID
   * 
   * @param  int $id
   * @return Manga
   */

  static function byId($id)
  {
    return DB::table('mangas')
      ->where('id', $id)
      ->pluck('name');
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
    return view('user.create.manga.index', ['user' => $user]);
  }

  public function store(Request $request)
  {
    $manga = new Manga;

    $user = auth()->user();

    $manga->user_id = $user->id;
    $manga->name = $request->name;
    $manga->categorys = json_encode($request->categorys);
    $manga->synopsis = $request->synopsis;
    $manga->created_at = Carbon::now();
    $manga->updated_at = Carbon::now();

    if ($request->hasFile('image') && $request->file('image')->isValid()) {
      $requestImage = $request->image;
      $extension = $requestImage->extension();
      $imageName = md5($requestImage->getClientOriginalName() . strtotime('now')) . '.' . $extension;
      $requestImage->move(public_path('images/manga'), $imageName);
      $manga->image = $imageName;
    }

    $manga->qtd_chapter = 0;

    try {
      $manga->save();
    } catch (\Exception $e) {
      return redirect('/create/manga')->with('error', $e->getMessage());
    }

    return redirect('/')->with('msg', 'Mangá inserido com sucesso!');
  }
}
