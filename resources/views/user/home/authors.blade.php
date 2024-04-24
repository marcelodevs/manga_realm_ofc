@extends('layouts.navbar')

@section('title', '• Autores')

@section('css', 'user/home/authors')

@section('navbar-secondary')
  <nav class="navbar">
    <div class="btn-group navbar-collapse">
      <button class="p-2">
        <a href="/" class="nav-item text-decoration-none p-2">Página Inicial</a>
      </button>
      <select id="category-select" class="p-0 w-auto">
        <option value="Tudo" <?php echo (!isset($_GET['category'])) ? 'selected' : '' ?>>Tudo</option>
        @foreach ($genero_manga as $genero)
          <option value="/categorys/<?php echo $genero->category_name; ?>" <?php echo (isset($_GET['category']) and $_GET['category'] == $genero) ? 'selected' : '' ?>>
            {{$genero->category_name}}
          </option>
        @endforeach
      </select>
      <button class="p-2">
        <a href="/authors" class="nav-item text-decoration-none">Autores</a>
      </button>
    </div>
  </nav>
@endsection

@section('main')
  @if (!empty($authors))
    @foreach ($authors as $author)
      <a data-bs-toggle="modal" data-bs-target="#exampleModalToggle" role="button">
        <div class="card">
          <div class="card-img" style="border-bottom: 1px solid #fff;">
            <img src="/storage/{{ stripslashes(trim(preg_replace('/(\'|")/', '', json_encode($author->profile_photo_path)))) }}" alt="Descrição da imagem">
          </div>
          <div class="card-content">
            <p class="text-decoration-none text-light">{{ $author->name }}</p>
            <p>{{ count($author->mangas) }} Mangás</p>
          </div>
        </div>
      </a>
      <x-modal-author>
        <x-slot name="name">{{ $author->name }}</x-slot>
        <x-slot name="image">{{ stripslashes(trim(preg_replace('/(\'|")/', '', json_encode($author->profile_photo_path)))) }}</x-slot>
        <x-slot name="mangas">{{ $author->mangas }}</x-slot>
      </x-modal-author>
    @endforeach
  @else
    <p style="color: red;">Nenhum autor adicionado!</p>
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
