@extends('layouts.navbar')

@section('title', '• Novo Mangá')

@section('css', 'new_manga')

@if(session('error'))
  {{session('error')}}
@endif

@section('main')
  <form action="{{ route('create.manga') }}" enctype="multipart/form-data" method="post" autocomplete="off" class="new_manga">
  @csrf
    <h1>Novo Mangá</h1>
    <div class="form-group">
      <label for="img">Imagem:</label>
      <input type="file" name="image" id="img" accept="image/*" required>
      <img src="" id="profileImage">
    </div>
    <div class="form-group">
      <label for="nome">Nome do mangá/light novel:</label>
      <input type="text" name="name" id="nome" value="Akuma to keiyaku shita hi" required>
    </div>
    <div class="form-group">
      <label for="genero">Gêneros:</label>
        <input value="Romance" type="checkbox" id="genero" name="categorys[]">Romance
        <input value="Drama" type="checkbox" id="genero" name="categorys[]" checked>Drama
        <input value="Ação" type="checkbox" id="genero" name="categorys[]" checked>Ação
        <input value="Comédia" type="checkbox" id="genero" name="categorys[]" checked>Comédia
        <input value="Escolar" type="checkbox" id="genero" name="categorys[]" checked>Escolar
        <input value="Shounen" type="checkbox" id="genero" name="categorys[]" checked>Shounen
        <input value="Poderes" type="checkbox" id="genero" name="categorys[]" checked>Poderes
        <input value="Magia" type="checkbox" id="genero" name="categorys[]" checked>Magia
    </div>
    <div class="form-group">
      <label for="sinopse">Sinopse:</label>
      <textarea name="synopsis" id="sinopse" maxlength="500" accesskey="i" required>Akuma to keiyaku shita hi</textarea>
      <span id="char-count">0</span>/500
    </div>
    <br>
    <button type="submit">Enviar</button>
  </form>
@endsection
