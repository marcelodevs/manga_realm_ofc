<?php

namespace App\Http\Controllers;

use App\Models\Chapter;
use App\Models\Manga;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ChapterController extends Controller
{
  public function create()
  {
    $user = auth()->user();
    $mangas = MangaController::byAuthors($user->id)->get();
    return view("user.create.chapter.index", ['user' => $user, 'mangas' => $mangas]);
  }

  public function store(Request $request)
  {
    $chapter = new Chapter;

    $chapter->manga_id = $request->manga_id;
    $chapter->index = $request->index;
    $chapter->title = $request->title;
    $chapter->created_at = Carbon::now();
    $chapter->updated_at = Carbon::now();
    $chapter->content = $request->content;

    if (isset($request->sketch) && $request->sketch <> null) {
      $chapter->sketch = $request->sketch;
    } else {
      $chapter->sketch = "N";
    }

    $manga_update = Manga::find($request->manga_id);

    $manga_update->qtd_chapter += 1;

    try {
      $chapter->save();
      $manga_update->save();
      return redirect('/create');
    } catch (\Exception $e) {
      return redirect('/create/chapter')->with('error', $e->getMessage());
    }
  }
}
