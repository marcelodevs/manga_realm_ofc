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
  @if (count($mangas) > 0)
    @foreach ($mangas as $manga)
      <x-card-manga>
        <x-slot name="id">{{ $manga->id }}</x-slot>
        <x-slot name="image">{{ $manga->image }}</x-slot>
        <x-slot name="name">{{ $manga->name }}</x-slot>
        <x-slot name="categories">{{ $manga->categorys }}</x-slot>
        <x-slot name="qtd_chapters">{{ $manga->qtd_chapter }}</x-slot>
        <x-slot name="synopse">{{ $manga->synopsis }}</x-slot>
      </x-card-manga>
    @endforeach
  @else
    <p style="color: red;">Nenhum mangá dessa categoria adicionado!</p>
  @endif
@endsection

@section("scripts", "src=/js/user/home/index.js")
