<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * A Entidade Manga possui uma relação de 1 para 1 com User
 * A Entidade Mnaga possui uma relação de 1 para N com Chapter
 * 
 * @author marcelodevs
 */

class Manga extends Model
{
  use HasFactory;

  protected $dates = ['date'];

  public function user()
  {
    return $this->hasOne(User::class);
  }

  public function users()
  {
    return $this->belongsTo(User::class);
  }

  public function categories()
  {
    return $this->belongsToMany(Category::class);
  }
}
