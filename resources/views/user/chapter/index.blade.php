@extends('layouts.navbar')

@section('css', 'user/chapter/capitulo')

@section('main')

  <div class="acoes">
    <a href="{{ ($back_chapter) ? '/chapter/' . $back_chapter : '/manga/' . $chapter->manga_id }}">
      <button>
        {{ ($back_chapter) ? 'Anterior' : 'Página do Mangá' }}
      </button>
    </a>
    <a href="{{ ($next_chapter) ? '/chapter/' . $next_chapter : '/manga/' . $chapter->manga_id }}">
      <button>
        {{ ($next_chapter) ? 'Anterior' : 'Página do Mangá' }}
      </button>
    </a>
  </div>

  <br>

  <div class="manga">
    <div class="manga_nome">
      <a href="/manga/{{ $chapter->manga_id }}" class="nav-link text-light p-0 fw-bold">{{ $manga_name }}</a>
    </div>
    <br>
    <div class="numero_capitulo">
      <p>Capítulo {{ $chapter->index }}</p>
    </div>
    <br>
    <div class="title">
      <p>
        <strong>{{ $chapter->title }}</strong>
      </p>
    </div>
    <br>
    <div class="content">
      <pre id="substr" style="white-space: pre-wrap;"><?php echo substr($chapter->content, 0, 1000) ?>...
      </pre>
      <?php if (strlen($chapter->content) > 1000) : ?>
        <button onclick="toggleChapter()">Mostrar mais</button>
      <?php endif; ?>
      <pre id="fullContent" style="display:none; white-space: pre-wrap;">{{ $chapter->content }}</pre>
    </div>
  </div>

  <div class="acoes">
    <a href="{{ ($back_chapter) ? '/chapter/' . $back_chapter : '/manga/' . $chapter->manga_id }}">
      <button>
        {{ ($back_chapter) ? 'Anterior' : 'Página do Mangá' }}
      </button>
    </a>
    <a href="{{ ($next_chapter) ? '/chapter/' . $next_chapter : '/manga/' . $chapter->manga_id }}">
      <button>
        {{ ($next_chapter) ? 'Próximo' : 'Página do Mangá' }}
      </button>
    </a>
  </div>

  <div class="comentarios-container">
    <h1>Comentários</h1>
    <div class="public-comment">
      <form action="../../controllers/comentarioCapituloController.php" method="post" class="send-message" autocomplete="off">
        @auth
          <input type="text" name="comments_capitulo" placeholder="Deixe seu comentário!">
          <button type="submit">Enviar</button>
        @endauth
        @guest
          <input type="text" placeholder="Você precisa estar logado para comentar" disabled>
          <button type="button" disabled>Enviar</button>
        @endguest
      </form>
    </div>
    <hr>
    <p>Nenhum comentário adicionado, seja o primeiro a comentar!</p>
  </div>
@endsection

@section('others')
  <section class="btn-voltar">
    <button onclick="voltar()" class="voltar">⬆</button>
  </section>
@endsection

  <script>
    function voltar() {
      window.scroll({
        top: 0,
        behavior: 'smooth'
      });
    }

    function toggleChapter() {
      var fullContent = document.getElementById('fullContent');
      var substr = document.getElementById('substr');
      var button = document.querySelector('.content button');

      if (fullContent.style.display === 'none') {
        fullContent.style.display = 'block';
        substr.style.display = 'none';
        button.style.display = 'none';
      } else {
        fullContent.style.display = 'none';
        button.textContent = 'Mostrar mais';
      }
    }
  </script>
