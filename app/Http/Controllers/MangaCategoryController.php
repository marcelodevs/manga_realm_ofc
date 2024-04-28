<?php

namespace App\Http\Controllers;

use App\Models\MangaCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MangaCategoryController extends Controller
{
  static function show($name)
  {
    $category = CategorysController::byName($name);
    $return = array();
    foreach ($category as $c) {
      $return[] = MangaCategory::where('category_id', $c->id)
        ->get('manga_id');
    }
    return $return;
  }


  /**
   * Método estático que retorna o Id da categoria de acorod com o Id do Mangá
   * 
   * @param  int $id
   * @return Colletion
   */
  static function byManga($id) {
    return MangaCategory::where('manga_id', $id)->get();
  }
}
