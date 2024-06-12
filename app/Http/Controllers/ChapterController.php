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
  static function next_chapter($index, $manga_id)
  {
    return Chapter::where('manga_id', $manga_id)
      ->where('sketch', 'f')
      ->where('index', '>', $index)
      ->orderBy('index', 'asc')
      ->first();
  }

  static function back_chapter($index, $manga_id)
  {
    return Chapter::where('manga_id', $manga_id)
      ->where('sketch', 'f')
      ->where('index', '<', $index)
      ->orderBy('index', 'desc')
      ->first();
  }

  public function show(): View
  {
    $id = request('id');
    $user = auth()->user();
    $chapter = Chapter::find($id);

    $manga_name = MangaController::byId($chapter->manga_id);

    $next_chapter = self::next_chapter($chapter->index, $chapter->manga_id);
    $back_chapter = self::back_chapter($chapter->index, $chapter->manga_id);

    if ($next_chapter != null) {
      $next_chapter = $next_chapter->id;
    } else {
      $next_chapter = false;
    }

    if ($back_chapter != null) {
      $back_chapter = $back_chapter->id;
    } else {
      $back_chapter = false;
    }

    if ($user && !ViewChapterController::validation($user->id, $chapter->id)) {
      ViewChapterController::store($user->id, $chapter->id);
    }

    $comments = ChapterCommentController::index($id);

    if (auth()->check()) {
      $rascunhos = Chapter::where('sketch', true)
        ->where('user_id', $user->id)
        ->get();

      $favorite = array();

      if (FavoriteController::byUser($user->id)->count() > 0) {
        $manga = FavoriteController::byUser($user->id);
        foreach ($manga as $item) {
          $favorite[] = MangaController::byId($item->manga_id);
        }
      }
    }

    return view(
      'user.chapter.index',
      [
        'user' => $user,
        'chapter' => $chapter,
        'comments' => $comments,
        'favoritos' => $favorite,
        'rascunhos' => $rascunhos,
        'next_chapter' => $next_chapter,
        'back_chapter' => $back_chapter,
        'manga_name' => $manga_name->name,
      ]
    );
  }


  public function create(): View
  {
    $user = auth()->user();
    $mangas = MangaController::byAuthors($user->id);

    if (auth()->check()) {
      $rascunhos = Chapter::where('sketch', true)
        ->where('user_id', $user->id)
        ->get();

      $favorite = array();

      if (FavoriteController::byUser($user->id)->count() > 0) {
        $manga = FavoriteController::byUser($user->id);
        foreach ($manga as $item) {
          $favorite[] = MangaController::byId($item->manga_id);
        }
      }
    }

    return view(
      "user.create.chapter.index",
      [
        'user' => $user,
        'mangas' => $mangas,
        'favoritos' => $favorite,
        'rascunhos' => $rascunhos,
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
    $chapter->user_id = auth()->id();

    if (isset($request->sketch) && $request->sketch <> null) {
      $chapter->sketch = 1;
    } else {
      $chapter->sketch = 0;
      $manga_update = Manga::find($request->manga_id);

      $manga_update->qtd_chapter += 1;
    }

    try {
      $chapter->save();
      $manga_update->save();
      return redirect('/create');
    } catch (\Exception $e) {
      return redirect('/create/chapter')->with('error', $e->getMessage());
    }
  }

  public function storeSketch(Request $request)
  {
    $chapter = new Chapter;

    $chapter->manga_id = $request->manga_id;
    $chapter->index = $request->index;
    $chapter->title = $request->title;
    $chapter->content = $request->content;
    $chapter->user_id = auth()->id();
    $chapter->sketch = 1;

    try {
      $chapter->save();
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

    if (auth()->check()) {
      $rascunhos = Chapter::where('sketch', true)
        ->where('user_id', $user->id)
        ->get();

      $favorite = array();

      if (FavoriteController::byUser($user->id)->count() > 0) {
        $manga = FavoriteController::byUser($user->id);
        foreach ($manga as $item) {
          $favorite[] = MangaController::byId($item->manga_id);
        }
      }
    }

    return view(
      'user.chapter.edit.index',
      [
        'user' => $user,
        'chapter' => $chapter,
        'favoritos' => $favorite,
        'rascunhos' => $rascunhos,
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

    if (isset($request->sketch) && !is_null($request->sketch)) {
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

  public function getIndex()
  {
    $manga_id = request('id');
    $lastIndex = Chapter::where('manga_id', $manga_id)
      ->orderBy('index', 'desc')
      ->first();

    if ($lastIndex) {
      return response()->json(['index' => $lastIndex->index + 1]);
    }

    return response()->json(['index' => 1]);
  }
}
