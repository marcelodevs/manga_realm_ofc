@extends('layouts.navbar')

@section('title', '• Mangás')

@section('css', 'user/home/index')

@section('navbar-secondary')
  <nav class="navbar border-top-0">
    <div class="btn-group navbar-collapse">
      <select id="category-select" class="p-2 w-auto">
        <option value="Tudo" <?php echo (!isset($_GET['category'])) ? 'selected' : '' ?>>Tudo</option>
        @foreach ($genero_manga as $genero)
          <option value="/categorys/<?php echo $genero->category_name; ?>" <?php echo (isset($_GET['category']) and $_GET['category'] == $genero) ? 'selected' : '' ?>>
            {{$genero->category_name}}
          </option>
        @endforeach
      </select>
      <button>
        <a href="/authors" class="nav-item text-decoration-none">Autores</a>
      </button>
    </div>
  </nav>
@endsection

@section('main')
  @if (count($mangas) > 0)
    @foreach ($mangas as $manga)
      @php
        $today = now()->format('Y-m-d');
        $mangaDate = $manga->updated_at->format('Y-m-d');
      @endphp
      @if ($mangaDate == $today)
        <section class="today">
          <h1>Atualizados hoje</h1>
          <hr>
          <x-card-manga>
            <x-slot name="id">{{ $manga->id }}</x-slot>
            <x-slot name="image">{{ $manga->image }}</x-slot>
            <x-slot name="name">{{ $manga->name }}</x-slot>
            <x-slot name="categories">{{ $manga->categorys }}</x-slot>
            <x-slot name="qtd_chapters">{{ $manga->qtd_chapter }}</x-slot>
            <x-slot name="synopse">{{ $manga->synopsis }}</x-slot>
          </x-card-manga>
        </section>
      @elseif ($mangaDate == now()->subDay()->format('Y-m-d'))
        <section class="yesterday">
          <h1>Autualizados recentemente</h1>
          <hr>
          <x-card-manga>
            <x-slot name="id">{{ $manga->id }}</x-slot>
            <x-slot name="image">{{ $manga->image }}</x-slot>
            <x-slot name="name">{{ $manga->name }}</x-slot>
            <x-slot name="categories">{{ $manga->categorys }}</x-slot>
            <x-slot name="qtd_chapters">{{ $manga->qtd_chapter }}</x-slot>
            <x-slot name="synopse">{{ $manga->synopsis }}</x-slot>
          </x-card-manga>
        </section>
      @else
        <section class="others">
          <h1>Outros</h1>
          <hr>
          <x-card-manga>
            <x-slot name="id">{{ $manga->id }}</x-slot>
            <x-slot name="image">{{ $manga->image }}</x-slot>
            <x-slot name="name">{{ $manga->name }}</x-slot>
            <x-slot name="categories">{{ $manga->categorys }}</x-slot>
            <x-slot name="qtd_chapters">{{ $manga->qtd_chapter }}</x-slot>
            <x-slot name="synopse">{{ $manga->synopsis }}</x-slot>
          </x-card-manga>
        </section>
      @endif
    @endforeach
  @else
    <p style="color: red;">Nenhum mangá adicionado!</p>
  @endif
@endsection

@section("scripts", "src=/js/user/home/index.js")
