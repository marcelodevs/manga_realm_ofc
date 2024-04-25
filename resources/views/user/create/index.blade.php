@extends('layouts.navbar')

@section('title', '• Novo')

@section('css', 'user/create/index')

@section('main')
  <a href="/create/manga" class="card_manga text-decoration-none">
    <img src="/img/create.png" alt="">
    <p>Novo <strong>Mangá</strong></p>
  </a>
  <a href="/create/chapter" class="card_capther text-decoration-none">
    <img src="/img/create.png" alt="">
    <p>Novo <strong>Capítulo</strong></p>
  </a>
@endsection
