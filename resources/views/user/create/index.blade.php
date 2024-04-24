@extends('layouts.navbar')

@section('title', '• Novo')

@section('css', 'new_manga')

@section('main')
  <a href="/create/manga" class="card_manga">
    <img src="/img/create.png" alt="">
    <p>Novo <strong>Mangá</strong></p>
  </a>
  <a href="/create/chapter" class="card_capther">
    <img src="/img/create.png" alt="">
    <p>Novo <strong>Capítulo</strong></p>
  </a>
@endsection
