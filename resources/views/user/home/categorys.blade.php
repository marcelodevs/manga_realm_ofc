@extends('layouts.navbar')

@section('css', 'user/home/index')

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
  @if (count($rascunhos) > 0)
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
      <strong>Você tem {{ count($rascunhos) }} capítulos salvo como rascunho!</strong>
      <a href="/dashboard" class="alert-link">Clique aqui para vê-lo</a>
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
  @endif
  @if (count($mangas) > 0)
    @php
      $groupedMangas = [
        'today' => [],
        'recent' => [],
        'others' => [],
      ];

      $today = now()->format('Y-m-d');
      $recentDate = now()->subDays(3)->format('Y-m-d');

      foreach ($mangas as $manga) {
        $mangaDate = $manga->updated_at->format('Y-m-d');
        if ($mangaDate == $today) {
          $groupedMangas['today'][] = $manga;
        } elseif ($mangaDate >= $recentDate && $mangaDate < $today) {
          $groupedMangas['recent'][] = $manga;
        } else {
          $groupedMangas['others'][] = $manga;
        }
      }
    @endphp

    @foreach ($groupedMangas as $category => $mangasGroup)
      @if (count($mangasGroup) > 0)
        <section>
          <h1>
            @if ($category == 'today')
              Atualizados hoje
            @elseif ($category == 'recent')
              Atualizados recentemente
            @else
              Outros
            @endif
          </h1>
          <hr>
          <div class="cards-container d-flex gap-1">
            @foreach ($mangasGroup as $manga)
              <x-card-manga>
                <x-slot name="route">{{ route('show.manga', $manga->id) }}</x-slot>
                <x-slot name="image">{{ $manga->image }}</x-slot>
                <x-slot name="name">{{ $manga->name }}</x-slot>
                <x-slot name="categories">{{ $manga->categorys }}</x-slot>
                <x-slot name="qtd_chapters">{{ $manga->qtd_chapter }}</x-slot>
                <x-slot name="synopse">{{ $manga->synopsis }}</x-slot>
              </x-card-manga>
            @endforeach
          </div>
        </section>
      @endif
    @endforeach
  @else
    <p style="color: red;">Nenhum mangá adicionado!</p>
  @endif
@endsection

@section("scripts", "src=/js/user/home/index.js")
