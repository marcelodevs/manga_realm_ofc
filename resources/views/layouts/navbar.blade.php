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
              <img src="/img/create.png">
              Criar
            </a>
          </button>
        </div>
        <div class="profile">
          <button type="button">
            <a href="/user/profile" class="nav-item text-decoration-none">
              <img src="/storage/{{ stripslashes(trim(preg_replace('/(\'|")/', '', json_encode($user->profile_photo_path)))) }}" alt="oi">
              {{$user->name}}
            </a>
          </button>
        </div>
      @endauth
      @guest
      <div class="login">
        <button type="button" class="in">
          <a href="/login" class="nav-item text-decoration-none">
            <img src="/img/sign-in.png">
            Entre
          </a>
        </button>
      </div>
      <div class="register">
        <button type="button" class="up">
          <a href="/register" class="nav-item text-decoration-none">
            <img src="/img/add-user.png">
            Inscreva-se
          </a>
        </button>
      </div>
      @endguest
    </div>
  </nav>
@endsection

{{-- <script>
  const searchResults = document.getElementById('search-results');

  document.getElementById('search').addEventListener('keyup', () => {
    const searchText = this.value.trim();

    if (searchText === '')
    {
      searchResults.innerHTML = '';
      return;
    }

    fetch(`{{ route('search.manga') }}?q=${encodeURIComponent(searchText)}`)
      .then(response => response.json())
      .then(data => {
        if (data.status)
        {
          let html = '';
          data.data.forEach(manga => {
            console.log(manga);
            html += `<div><a href="../manga/index.php?manga=${manga.id_manga}">${manga.nome}</a></div>`;
          });
          searchResults.innerHTML = html;
        } else
        {
          searchResults.innerHTML = '<div>Nenhum mangá encontrado</div>';
        }
      })
      .catch(error => {
        console.error('Erro ao buscar mangás:', error);
      });
  });
</script> --}}
