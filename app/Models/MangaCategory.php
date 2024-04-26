<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * A Entidade MangaCategory possui uma relação de 1 para N com Manga
 * A Entidade MnagaCategory possui uma relação de 1 para N com Category
 * 
 * @author marcelodevs
 */

class MangaCategory extends Model
{
  use HasFactory;

  public function mangas()
  {
    return $this->belongsTo(Manga::class);
  }

  public function categories()
  {
    return $this->belongsTo(Category::class);
  }
}
