@extends('layouts.navbar')

@section('css', 'user/chapter/update_chapter')

@section('main')
  <form action="{{ route('update.chapter', $chapter->id) }}" method="post" autocomplete="off" class="new-chapter" id="chapterForm">
    @csrf
    <h1>Editar Capítulo</h1>
    <div class="form-group">
      <label for="id">Nº Capítulo</label>
      <input type="number" name="index" id="id" value="{{ $chapter->index }}" required>
    </div>
    <br>
    <div class="form-group">
      <label>Mangá: {{ $manga_name }}</label>
      <input type="hidden" name="manga_id" id="manga" value="{{ $chapter->manga_id }}" required>
    </div>
    <br>
    <div class="form-group">
      <label for="title">Título do Capítulo</label>
      <input type="text" name="title" id="title" value="{{ $chapter->title }}" required>
    </div>
    <div class="form-group">
      <label for="content">Conteúdo</label>
      <textarea name="content" id="content" autofocus spellcheck="true" required>{{ $chapter->content }}</textarea>
      <span id="char-count">0</span> caracteres,
      <span id="word-count">0</span> palavras
    </div>
    <br>
    <input type="hidden" name="id" value="{{ $chapter->id }}">
    <div class="btn-group">
      <button type="submit" name="sketch" value="S">Salvar Rascunho</button>
      <button type="submit">Enviar</button>
    </div>
  </form>
@endsection

@section('scripts', 'src=/js/chapter/new_chapter.js')
