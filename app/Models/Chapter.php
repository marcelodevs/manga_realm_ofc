<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * A Entidade Chapter possui uma relação de 1 para 1 com Manga
 * 
 * @author marcelodevs
 */

class Chapter extends Model
{
  use HasFactory;

  public function manga()
  {
    return $this->belongsTo('App\Models\Manga');
  }
}
