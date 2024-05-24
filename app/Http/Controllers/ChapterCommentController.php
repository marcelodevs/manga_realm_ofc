<?php

namespace App\Http\Controllers;

use App\Models\ChapterComment;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class ChapterCommentController extends Controller
{
  static function index(int $id): Collection
  {
    return ChapterComment::with('user')
      ->where('chapter_id', $id)
      ->get();
  }

  public function store(Request $request)
  {
    $chapterComment = new ChapterComment;

    $chapter_id = request('id');
    $user_id = auth()->user();

    $chapterComment->chapter_id = $chapter_id;
    $chapterComment->user_id = $user_id->id;
    $chapterComment->comment = $request->comment;

    try {
      $chapterComment->save();
    } catch (\Exception $e) {
      return redirect('/chapter/' . $chapter_id)->with('error', $e->getMessage());
    }

    return redirect('/chapter/' . $chapter_id);
  }
}
