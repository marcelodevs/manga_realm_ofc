@extends('layouts.navbar')

@section('title', '• Mangás')

@section('css', 'user/home/index')

@section('navbar-secondary')
  <nav class="navbar border-top-0">
    <div class="btn-group navbar-collapse">
      <select id="category-select" class="p-2 w-auto">
        <option value="Tudo" <?php echo (!isset($_GET['category'])) ? 'selected' : '' ?>>Tudo</option>
        @foreach ($genero_manga as $genero)
          <option value="/categorys/{{ $genero->category_name }}">
            {{ $genero->category_name }}
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
