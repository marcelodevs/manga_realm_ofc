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
    $chapter = Chapter::find($id);

    $manga_name = MangaController::byId($chapter->manga_id);

    return view(
      'user.chapter.index',
      [
        'user' => $user,
        'chapter' => $chapter,
        'manga_name' => $manga_name->name
      ]
    );
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
      $chapter->sketch = 1;
    } else {
      $chapter->sketch = 0;
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

  public function edit(): View
  {
    $id = request('id');
    $chapter = Chapter::find($id);
    $user = auth()->user();

    if (!isset($chapter)) {
      abort(404);
    }

    $manga_name = MangaController::byId($chapter->manga_id);


    return view(
      'user.chapter.edit.index',
      [
        'user' => $user,
        'chapter' => $chapter,
        'manga_name' => $manga_name->name
      ]
    );
  }

  public function update(Request $request)
  {
    $id = request('id');
    $chapter = Chapter::find($id);

    $chapter->index = $request->index;
    $chapter->title = $request->title;
    $chapter->content = $request->content;

    if (isset($request->sketch) && $request->sketch <> null) {
      $chapter->sketch = 1;
      try {
        $chapter->save();
        return redirect('/dashboard');
      } catch (\Exception $e) {
        return redirect('/chapter/edit/' . $request->id)->with('error', $e->getMessage());
      }
    } else {
      $chapter->sketch = 0;
      $manga_update = Manga::find($request->manga_id);

      $manga_update->qtd_chapter += 1;

      try {
        $chapter->save();
        $manga_update->save();
        return redirect('/manga/' . $request->manga_id);
      } catch (\Exception $e) {
        return redirect('/chapter/edit/' . $request->id)->with('error', $e->getMessage());
      }
    }
  }
}
