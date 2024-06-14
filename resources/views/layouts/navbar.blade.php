@extends('layouts.main')

@section('navbar-primary')
  <nav class="navbar p-3 border-bottom border-light">
    <h1 class="fs-3">
      <a href="/" class="nav-link text-light text-decoration-none fw-bold">MangáRealm</a>
    </h1>
    <div class="search-input">
      <input type="text" name="search" id="search" placeholder="Pesquisar por nome do mangá" autocomplete="off">
      <div id="search-results"></div>
    </div>
    <div class="lr-group">
      <div class="create-manga">
        <button type="button">
          <a href="/help" class="nav-item text-decoration-none">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="white" class="bi bi-question-circle" viewBox="0 0 16 16">
              <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
              <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286m1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94"/>
            </svg>
            Ajuda
          </a>
        </button>
      </div>
      @auth
        <div class="create-manga">
          <button type="button">
            <a href="/create" class="nav-item text-decoration-none">
              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="white" class="bi bi-plus-circle" viewBox="0 0 16 16">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
              </svg>
              Criar
            </a>
          </button>
        </div>
        <div class="profile">
          <div class="btn-group dropstart">
            <button type="button" class="btn" data-bs-toggle="dropdown" aria-expanded="false">
              <img src="/storage/{{ stripslashes(trim(preg_replace('/(\'|")/', '', json_encode($user->profile_photo_path)))) }}" alt="oi">
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="/user/profile">Perfil ({{ $user->name }})</a></li>
              <li><a class="dropdown-item" href="/dashboard">Dashboard</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="/dashboard#rascunhos">Rascunhos ({{ count($rascunhos) }})</a></li>
              <li><a class="dropdown-item" href="/dashboard#favoritos">Favoritos ({{ count($favoritos) }})</a></li>
            </ul>
          </div>
        </div>
      @endauth
      @guest
      <div class="login">
        <button type="button" class="in">
          <a href="/login" class="nav-item text-decoration-none">
          <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="white" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0z"/>
            <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"/>
          </svg>
            Entre
          </a>
        </button>
      </div>
      <div class="register">
        <button type="button" class="up">
          <a href="/register" class="nav-item text-decoration-none">
          <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="white" class="bi bi-person-add" viewBox="0 0 16 16">
            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
            <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
          </svg>
            Inscreva-se
          </a>
        </button>
      </div>
      @endguest
    </div>
  </nav>
@endsection

@section('scripts2', 'src=/js/template/search.js')
