@extends('layouts.navbar')

@section('title', '• Editar Mangá')

@section('css', 'user/manga/edit_manga')

@if(session('error'))
  <div class="alert alert-danger" role="alert">
    {{session('error')}}
  </div>
@endif

@section('main')
  <form action="{{ route('update.manga', $manga->id) }}" enctype="multipart/form-data" method="post" autocomplete="off" class="new_manga form">
    @csrf
    <h1>Editar Mangá</h1>
    <div class="form-group">
      <label for="img">Imagem:</label>
      <input type="file" name="image" class="form-control" id="img formFile" accept="image/*" value="{{ $manga->image }}" disabled required>
      <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        Ver Imagem
      </button>
    </div>
    <div class="form-group w-100">
      <label for="nome">Nome do mangá/light novel:</label>
      <input type="text" name="name" id="nome" class="w-100" value="{{ $manga->name }}" disabled>
    </div>
    <br>
    <div class="form-group">
      @foreach ($categories as $item)
        <div class="form-check form-check-inline">
          <input class="form-check-input" type="checkbox" name="categorys[]" id="inlineRadio1" value="{{ $item->id }}" {{ in_array($item->id, $categoriesByManga->pluck('id')->toArray()) ? 'checked' : '' }}>
          <label class="form-check-label" for="inlineRadio1">{{ $item->category_name }}</label>
        </div>
      @endforeach
    </div>
    <div class="form-group w-100">
      <label for="sinopse">Sinopse:</label>
      <textarea name="synopsis" id="sinopse" maxlength="500" class="w-100" required>{{ $manga->synopsis }}</textarea>
      <span id="char-count">0</span>/500 caracteres,
      <span id="word-count">0</span> palavras
    </div>
    <br>
    <button type="submit">Enviar</button>
  </form>
@endsection

@section('scripts', 'src=/js/manga/new_manga.js')

<!-- Modal para imagem -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Capa de {{ $manga->name }}</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
      </div>
      <div class="modal-body d-flex justify-content-center">
        <img src="/images/manga/{{ $manga->image }}" id="profileImage">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
      </div>
    </div>
  </div>
</div>
