@extends('layouts.navbar')

@section('title', '• Autores')

@section('css', 'user/home/authors')

@php
  $selectedCategory = request('id'); // Obtém o valor da categoria da URL
@endphp

@section('navbar-secondary')
  <nav class="navbar">
    <div class="btn-group navbar-collapse">
      <button class="p-2">
        <a href="/" class="nav-item text-decoration-none p-2">Página Inicial</a>
      </button>
      <select id="category-select" class="p-0 w-auto">
        <option value="Tudo">Tudo</option>
        @foreach ($genero_manga as $genero)
          <option value="/categorys/{{ $genero->category_name }}" {{ $selectedCategory == $genero->category_name ? 'selected' : '' }}>
            {{ $genero->category_name }}
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
        <x-slot name="user_name">{{ $author->name }}</x-slot>
        <x-slot name="user_image">{{ stripslashes(trim(preg_replace('/(\'|")/', '', json_encode($author->profile_photo_path)))) }}</x-slot>
        @foreach ($mangas as $m)
          <x-slot name="id">{{ $m->id }}</x-slot>
          <x-slot name="image">{{ $m->image }}</x-slot>
          <x-slot name="name">{{ $m->name }}</x-slot>
          <x-slot name="qtd_chapters">{{ $m->qtd_chapter }}</x-slot>
        @endforeach
      </x-modal-author>
    @endforeach
  @else
    <p style="color: red;">Nenhum autor adicionado!</p>
  @endif
@endsection

@section("scripts", "src=/js/user/home/index.js")
