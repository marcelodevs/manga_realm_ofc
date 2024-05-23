<?php

namespace App\Http\Controllers;

use App\Models\ViewChapter;
use Illuminate\Support\Facades\Log;

class ViewChapterController extends Controller
{
  /**
   * Método estático que valida se um capítulo já foi lido pelo usuário fornecido ou não
   * 
   * @param  int $user_id
   * @param  int $chapter_id
   * 
   * @return bool
   */
  static function validation(int $user_id, int $chapter_id): bool
  {
    return ViewChapter::where('user_id', $user_id)
      ->where('chapter_id', $chapter_id)
      ->exists();
  }

  /**
   * Método estático para registrar a visualização do usuário sobre um capítulo
   * 
   * @param  int $user_id
   * @param  int $chapter_id
   * 
   * @return bool
   */
  static function store(int $user_id, int $chapter_id): bool
  {
    // Verifica se já existe uma visualização registrada
    if (!static::validation($user_id, $chapter_id)) {
      $viewChapter = new ViewChapter;
      $viewChapter->user_id = $user_id;
      $viewChapter->chapter_id = $chapter_id;
      $viewChapter->view = true;

      try {
        $viewChapter->save();
        return true;
      } catch (\Exception $e) {
        Log::error($e);
        return false;
      }
    }
    return false;
  }
}
