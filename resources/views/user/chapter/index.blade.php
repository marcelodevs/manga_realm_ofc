@extends('layouts.navbar')

@section('title', '• ' . $manga_name . ' - Capítulo ' . $chapter->index)

@section('css', 'user/chapter/capitulo')

@section('main')

  @if(session('error'))
    <div class="alert alert-danger" role="alert">
      {{session('error')}}
    </div>
  @endif

  <div class="acoes">
    <a href="{{ ($back_chapter) ? '/chapter/' . $back_chapter : '/manga/' . $chapter->manga_id }}">
      <button>
        {{ ($back_chapter) ? 'Anterior' : 'Página do Mangá' }}
      </button>
    </a>
    @if ($next_chapter and $back_chapter)
      <a href="{{ '/manga/' . $chapter->manga_id }}">
        <button>
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
          </svg>
        </button>
      </a>
    @endif
    <a href="{{ ($next_chapter) ? '/chapter/' . $next_chapter : '/manga/' . $chapter->manga_id }}">
      <button>
        {{ ($next_chapter) ? 'Próximo' : 'Página do Mangá' }}
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
    <div class="title">
      <p>
        <strong>{{ $chapter->title }}</strong>
      </p>
    </div>
    <div class="content">
      <pre id="substr" style="white-space: pre-wrap;"><?php echo substr($chapter->content, 0, 1000) ?>...
      </pre>
      <?php if (strlen($chapter->content) > 1000) : ?>
        <div class="show_more"><button onclick="toggleChapter()">Mostrar mais</button></div>
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
    @if ($next_chapter and $back_chapter)
      <a href="{{ '/manga/' . $chapter->manga_id }}">
        <button>
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
          </svg>
        </button>
      </a>
    @endif
    <a href="{{ ($next_chapter) ? '/chapter/' . $next_chapter : '/manga/' . $chapter->manga_id }}">
      <button>
        {{ ($next_chapter) ? 'Próximo' : 'Página do Mangá' }}
      </button>
    </a>
  </div>

  <div class="comentarios-container">
    <h1>Comentários</h1>
    <div class="public-comment">
    <form action="{{ route('comment.chapter', $chapter->id) }}" method="post" class="send-message" autocomplete="off">
      @csrf
      @auth
        <textarea name="comment" placeholder="Deixe seu comentário!" rows="4" style="width: 100%;"></textarea>
        <button type="submit">Enviar</button>
      @endauth
      @guest
        <textarea placeholder="Você precisa estar logado para comentar" rows="4" style="width: 100%;" disabled></textarea>
      @endguest
    </form>
    </div>
    <hr>
    @foreach ($comments as $comment)
      <div class="comments" id="comment_{{ $comment->id }}">
        <div class="info-user">
          <img src="/storage/{{ $comment->user->profile_photo_path }}" width="40" height="40">
          <p>{{ $comment->user->name }}</p>
        </div>
        <p class="comment-text">{{ $comment->comment }}</p>
        <br>
      </div>
    @endforeach
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
