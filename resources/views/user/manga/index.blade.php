@extends('layouts.navbar')

@section('css', 'user/manga/manga')

@section('main')
  <div class="card mb-12 p-3 w-75 first" style="max-width: 540px;">
    <div class="row g-0">
      <div class="col-md-4">
        <img src="/images/manga/{{ $manga->image }}" class="img-fluid rounded-start" alt="...">
      </div>
      <div class="col-md-8">
        <div class="card-body">
          <h5 class="card-title text-light">{{ $manga->name }}</h5>
          <p class="card-text text-light">Capítulos: {{ $manga->qtd_chapter }}</p>
          <p class="card-text text-light">{{ $manga->categorys }}</p>
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
        <h5 class="card-title">Avaliação:</h5>
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
        </p>
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
          <div class="d-flex justify-content-start align-items-center gap-3 p-0">
            <img src="/images/manga/{{ $manga->image }}" width="50" class="rounded-circle">
            <p class="text-dark p-0 fs-6">{{ $manga->name }}</p>
            <p class="text-dark p-0 fs-5">{{ $manga->name }}</p>
          </div>
        </div>
        <div class="modal-footer justify-content-center">
          <form action="">
            <div class="input-group mb-3 d-flex aligin-items-center">
              @auth
                <input type="text" class="form-control w-75 m-0" placeholder="Escreva seu comentário" aria-describedby="button-addon2">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button>
              @endauth
              @guest
                <input type="text" class="form-control w-75" placeholder="Faça o login para comentar" disabled aria-describedby="button-addon2">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2" disabled>Button</button>
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
            @foreach ($chapters as $item)
              <a href="/chapter/{{ $item->id }}" class="text-decoration-none text-dark fs-6 p-1 nav-link">Capítulo {{ $item->index }} - {{ $item->title }}</a>
            @endforeach
          </div>
        </div>
      </div>
    </div>
  </div>
@endsection
