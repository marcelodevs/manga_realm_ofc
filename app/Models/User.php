<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Sanctum\HasApiTokens;

/**
 * A Entidade User possui uma relação de 1 para N com Manga
 * 
 * @author marcelodevs
 */

class User extends Authenticatable
{
  use HasApiTokens;
  use HasFactory;
  use HasProfilePhoto;
  use Notifiable;
  use TwoFactorAuthenticatable;

  /**
   * Os atributos que são atribuíveis em massa.
   *
   * @var array<int, string>
   */
  protected $fillable = [
    'name',
    'email',
    'password',
    'profile_photo_path'
  ];

  /**
   * Os atributos que devem estar ocultos para serialização.
   *
   * @var array<int, string>
   */
  protected $hidden = [
    'password',
    'remember_token',
    'two_factor_recovery_codes',
    'two_factor_secret',
  ];

  /**
   * Os acessores para anexar ao formulário de matriz do modelo.
   *
   * @var array<int, string>
   */
  protected $appends = [
    'profile_photo_url',
  ];

  protected $dates = ['date'];

  /**
   * Obtenha os atributos que devem ser lançados.
   *
   * @return array<string, string>
   */
  protected function casts(): array
  {
    return [
      'email_verified_at' => 'datetime',
      'password' => 'hashed',
    ];
  }

  public function mangas()
  {
    return $this->hasMany(Manga::class);
  }

  public function mangaComments()
  {
    return $this->hasMany(MangaComment::class);
  }

  public function chapterComments()
  {
    return $this->hasMany(ChapterComment::class);
  }

  public function favorites()
  {
    return $this->hasMany(Favorite::class);
  }
}
