@extends('layouts.navbar')

@section('title', '• Novo Mangá')

@section('css', 'user/create/manga/new_manga')

@if(session('error'))
  <div class="alert alert-danger" role="alert">
    {{session('error')}}
  </div>
@endif

@section('main')
  <form action="{{ route('create.manga') }}" enctype="multipart/form-data" method="post" autocomplete="off" class="new_manga form">
  @csrf
    <h1>Novo Mangá</h1>
    <div class="form-group">
      <label for="img">Imagem:</label>
      <input type="file" name="image" class="form-control" id="img formFile" accept="image/*" required>
      <img src="" id="profileImage">
    </div>
    <div class="form-group w-100">
      <label for="nome">Nome do mangá/light novel:</label>
      <input type="text" name="name" id="nome" class="w-100" required>
    </div>
    <br>
    <div class="form-group">
      @foreach ($categories as $item)
        <div class="form-check form-check-inline">
          <input class="form-check-input" type="checkbox" name="categorys[]" id="inlineRadio1" value="{{ $item->id }}">
          <label class="form-check-label" for="inlineRadio1">{{ $item->category_name }}</label>
        </div>
      @endforeach
    </div>
    <div class="form-group w-100">
      <label for="sinopse">Sinopse:</label>
      <textarea name="synopsis" id="sinopse" maxlength="500" class="w-100" required></textarea>
      <span id="char-count">0</span>/500 caracteres,
      <span id="word-count">0</span> palavras
    </div>
    <br>
    <button type="submit">Enviar</button>
  </form>
@endsection

@section('scripts', 'src=/js/manga/new_manga.js')
