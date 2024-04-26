<?php

namespace App\Http\Controllers;

use App\Models\Chapter;
use App\Models\Manga;
use Carbon\Carbon;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ChapterController extends Controller
{
  public function show(): View
  {
    $id = request('id');
    $user = auth()->user();
    $chapter = DB::table('chapters')
      ->where('id', $id)
      ->get();

    $manga_name = MangaController::byId($chapter[0]->manga_id);

    foreach ($manga_name as $manga) {
      return view(
        'user.chapter.index',
        [
          'user' => $user,
          'chapter' => $chapter[0],
          'manga_name' => $manga
        ]
      );
    }
  }

  public function create(): View
  {
    $user = auth()->user();
    $mangas = MangaController::byAuthors($user->id);
    return view(
      "user.create.chapter.index",
      [
        'user' => $user,
        'mangas' => $mangas
      ]
    );
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
