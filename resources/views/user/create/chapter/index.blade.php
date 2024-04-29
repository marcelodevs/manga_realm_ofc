@extends('layouts.navbar')

@section('title', '• Novo Capítulo')

@section('css', 'user/create/chapter/new_chapter')

@if(session('error'))
  <div class="alert alert-danger" role="alert">
    {{session('error')}}
  </div>
@endif

@section('main')
  @if ($mangas <> null)
    <form action="{{ route('create.chapter') }}" method="post" autocomplete="off" class="new-chapter" id="chapterForm">
      @csrf
      <h1>Novo Capítulo</h1>
      <div class="form-group">
        <label for="id">Nº Capítulo</label>
        <input type="number" name="index" id="id" required>
      </div>
      <div class="form-group">
        <label for="manga">Mangá: </label>
        <input type="text" list="mangas" name="manga_id" id="manga" required>
        <datalist id="mangas">
          @foreach ($mangas as $manga)
            <option value="{{ $manga->id }}">{{ $manga->id }} - {{ $manga->name }}</option>
          @endforeach
        </datalist>
      </div>
      <div class="form-group">
        <label for="title">Título do Capítulo</label>
        <input type="text" name="title" id="title" required>
      </div>
      <div class="form-group">
        <label for="content">Conteúdo</label>
        <textarea name="content" id="content" spellcheck="false" required></textarea>
        <span id="char-count">0</span> caracteres,
        <span id="word-count">0</span> palavras
      </div>
      <br>
      <div class="btn-group">
        <button type="submit" name="sketch" value="S">Salvar Rascunho</button>
        <button type="submit">Enviar</button>
      </div>
    </form>
  @else
    <div class="toast align-items-center text-white bg-primary border-0 d-flex align-items-center" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="d-flex">
        <div class="toast-body">
          Você não tem nenhum mangá adicionado!
        </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
    </div>
  @endif

  <script>
    function autoSaveDraft() {
      let formData = new FormData(document.getElementById('chapterForm'));

      if (formData.get('index') && formData.get('manga_id') && formData.get('title') && formData.get('content')) {
        fetch('{{ route("save.as.draft") }}', {
          method: 'POST',
          body: formData
        })
          .then(response => {
            if (response.ok) {
              console.log('Salvo como rascunho.');
            } else {
              console.error('Erro ao salvar como rascunho.');
            }
          })
          .catch(error => {
            console.error('Erro ao salvar como rascunho:', error);
          });
      } else {
        console.error('Por favor, preencha todos os campos obrigatórios.');
      }
    }

    setInterval(autoSaveDraft, 60000); // 60000 ms = 1 minuto
  </script>

@endsection

@section('scripts', 'src=/js/chapter/new_chapter.js')
