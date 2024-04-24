@extends('layouts.navbar')

@section('title', '• Mangás')

@section('css', 'usuario')

@section('navbar-secondary')
  <hr>
    <nav>
      <div class="btn-group">
        <button><a href="/">Página Inicial</a></button>
        <select id="category-select">
          <option value="Tudo" <?php echo (!isset($_GET['category'])) ? 'selected' : '' ?>>Tudo</option>
          @foreach ($genero_manga as $genero)
            <option value="/categorys/<?php echo $genero->category_name; ?>" <?php echo (isset($_GET['category']) and $_GET['category'] == $genero) ? 'selected' : '' ?>>
              {{$genero->category_name}}
            </option>
          @endforeach
        </select>
        <button><a href="/authors">Autores</a></button>
      </div>
    </nav>
@endsection

@section('main')
  @if (count($mangas) > 0)
    @foreach ($mangas as $manga)
      <a href="/manga/?manga={{$manga->id}}">
        <div class="card">
          <div class="card-img">
            <img src="/images/manga/{{$manga->image}}" alt="Descrição da imagem">
          </div>
          <div class="card-content">
            <p>{{$manga->name}}</p>
            <div class="transparent-p">
              <p>
                @foreach (json_decode($manga->categorys) as $category)
                  {{ $category }},
                @endforeach
              </p>
              <p>Capítulos</p>
              <p>{{($manga->qtd_chapter)}}</p>
            </div>
          </div>
        </div>
      </a>
    @endforeach
  @else
    <p style="color: red;">Nenhum mangá adicionado!</p>
  @endif


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

  <script>
    $(document).ready(function(){

    $('#category-select').on('change', function () {
        var url = $(this).val(); 
        if (url) { 
          window.open(url);
        }
        return false;
      });
    });
  </script>
@endsection
