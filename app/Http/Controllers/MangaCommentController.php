<?php

namespace App\Http\Controllers;

use App\Models\MangaComment;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class MangaCommentController extends Controller
{
  static function index(int $id): Collection
  {
    return MangaComment::with('user')->where('manga_id', $id)->get();
  }

  public function store(Request $request)
  {
    $mangaComment = new MangaComment;

    $manga_id = request('id');
    $user_id = auth()->user();

    $mangaComment->manga_id = $manga_id;
    $mangaComment->user_id = $user_id->id;
    $mangaComment->comment = $request->comment;

    try {
      $mangaComment->save();
    } catch (\Exception $e) {
      return redirect('/manga/' . $manga_id)->with('error', $e->getMessage());
    }

    return redirect('/manga/' . $manga_id);
  }
}
