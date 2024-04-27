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
    $return = MangaCategory::where('category_id', $category[0]->id)
      ->get('manga_id');
    return $return;
  }
}
