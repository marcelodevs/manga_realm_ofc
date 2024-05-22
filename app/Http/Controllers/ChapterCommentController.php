<?php

namespace App\Http\Controllers;

use App\Models\ChapterComment;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class ChapterCommentController extends Controller
{
  static function index(int $id): Collection
  {
    $comments = ChapterComment::where('manga_id', $id)->get();
    $comments = $comments->reject(function (ChapterComment $chapterComment) {
      return $chapterComment->cancelled();
    }) ?? $comments;
    return $comments;
  }
}
