@extends('layouts.navbar')

@section('title', '• Novo')

@section('css', 'user/create/index')

@section('main')
  <a href="/create/manga" class="card_manga text-decoration-none">
    <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="white" class="bi bi-plus-circle" viewBox="0 0 16 16">
      <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
      <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
    </svg>
    <p>Novo <strong>Mangá</strong></p>
  </a>
  <a href="/create/chapter" class="card_capther text-decoration-none">
    <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="white" class="bi bi-plus-circle" viewBox="0 0 16 16">
      <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
      <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
    </svg>
    <p>Novo <strong>Capítulo</strong></p>
  </a>
@endsection
