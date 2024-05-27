@extends('layouts.navbar')

@section('title', '• ' . $manga->name)

@section('css', 'user/manga/manga')

@section('main')
  @if(session('error'))
    <div class="alert alert-danger" role="alert">
      {{session('error')}}
    </div>
  @endif
  @auth
    <div class="favorite">
      @if ($favorite)
        <form action="">
          <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#00008b" class="bi bi-bookmark-check-fill" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5m8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0z"/>
          </svg>
        </form>
      @else
        <form action="{{ route('favorite.manga', $manga->id) }}">
          <button type="submit">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#00008b" class="bi bi-bookmark-plus" viewBox="0 0 16 16">
              <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z"/>
              <path d="M8 4a.5.5 0 0 1 .5.5V6H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V7H6a.5.5 0 0 1 0-1h1.5V4.5A.5.5 0 0 1 8 4"/>
            </svg>
          </button>
        </form>
      @endif
    </div>
  @endauth
  <div class="card mb-12 p-3 w-75 first" style="max-width: 540px;">
    <div class="row g-0">
      <div class="col-md-4">
        <img src="/images/manga/{{ $manga->image }}" class="img-fluid rounded-start" alt="...">
      </div>
      <div class="col-md-8">
        <div class="card-body">
          <h5 class="card-title text-light">{{ $manga->name }}</h5>
          <p class="card-text text-light">{{ $manga->qtd_chapter }} capítulos</p>
          <p class="card-text text-light">
            @foreach ($categories as $index => $item)
              {{ $item->category_name }}@if ($index < count($categories) - 1),@endif
            @endforeach
          </p>
          <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#commentsModalToggle" role="button">
            Ver comentários
          </button>
          <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#chaptersModalToggle" role="button">
            Ver capítulos
          </button>
        </div>
      </div>
    </div>
    <br>
    <div class="card text-dark bg-light mb-3 w-100">
      <div class="card-header">Informações</div>
      <div class="card-body">
        <h5 class="card-title">Sinopse:</h5>
        <p class="card-text">{{ $manga->synopsis }}</p>
        {{-- <h5 class="card-title">Avaliação:</h5>
        <p class="card-text">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="yellow" class="bi bi-star-fill" viewBox="0 0 16 16">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
          </svg>
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="yellow" class="bi bi-star-fill" viewBox="0 0 16 16">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
          </svg>
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="yellow" class="bi bi-star-fill" viewBox="0 0 16 16">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
          </svg>
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="yellow" class="bi bi-star-fill" viewBox="0 0 16 16">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
          </svg>
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="yellow" class="bi bi-star-fill" viewBox="0 0 16 16">
            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
          </svg>
        </p> --}}
      </div>
    </div>
  </div>

  <!-- MODAL PARA COMENTÁRIOS -->

  <div class="modal fade" id="commentsModalToggle" aria-hidden="false" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalToggleLabel">Comentários</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          @foreach ($comments as $comment)
            <div class="d-flex justify-content-start align-items-center gap-3 p-0 comment">
              <img src="/storage/{{ $comment->user->profile_photo_path }}" width="50" class="rounded-circle">
              <div class="d-flex flex-column md-5 justify-content-center">
                <p class="text-dark p-0 fs-6">{{ $comment->user->name }}</p>
                <p class="text-dark p-0 fs-5">{{ $comment->comment }}</p>
              </div>
            </div>
          @endforeach
        </div>
        <div class="modal-footer justify-content-center">
          <form action="{{ route('comment.manga', $manga->id) }}", method="POST" autocomplete="off">
            @csrf
            <div class="input-group mb-3 d-flex aligin-items-center">
              @auth
                <input type="text" class="form-control w-75 m-0" placeholder="Escreva seu comentário" aria-describedby="button-addon2" name="comment">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2">Enviar</button>
              @endauth
              @guest
                <input type="text" class="form-control w-75" placeholder="Faça o login para comentar" disabled aria-describedby="button-addon2">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2" disabled>Enviar</button>
              @endguest
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- MODAL PARA CAPÍTULOS -->

  <div class="modal fade" id="chaptersModalToggle" aria-hidden="false" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalToggleLabel">Capítulos</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="d-flex flex-column gap-2">
            @foreach ($chapters as $chapter)
              <a href="/chapter/{{ $chapter->id }}" 
                class="text-decoration-none text-dark {{ isset($views[$chapter->id]) && $views[$chapter->id] ? 'opacity-50' : '' }} fs-6 p-1 nav-link">
                  Capítulo {{ $chapter->index }} - {{ $chapter->title }}
              </a>
            @endforeach
          </div>
        </div>
      </div>
    </div>
  </div>
@endsection
