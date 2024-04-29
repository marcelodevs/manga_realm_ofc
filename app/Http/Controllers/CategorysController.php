<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CategorysController extends Controller
{

  /**
   * Método estático para retornar todas as categorias do banco de dados
   * 
   * @return Collection
   */
  static function show()
  {
    return DB::table('categories')->get();
  }

  /**
   * Método estático que retorna uma categoria de acordo com o nome 
   *
   * @param  string $name
   * @return Collection
   */
  static function byName($name)
  {
    return Category::where('category_name', $name)->get();
  }

  /**
   * Método estático que retorna uma categoria de acordo com o id 
   *
   * @param  int $id
   * @return Collection
   */
  static function byId($id)
  {
    return Category::find($id);
  }
}
