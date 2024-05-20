@extends('layouts.navbar')

@section('main')
  <div class="container container-fluid d-flex justify-content-center gap-5 position-absolute top-50 start-50 translate-middle">
    <div class="card" style="width: 18rem;">
      <div class="card-body">
        <h5 class="card-title">Navegação</h5>
        <p class="card-text">Aqui você verá um guia completo sobre como navegar pelo MangáRealm</p>
        <a href="{{ route('help.navigation') }}" class="btn btn-primary">Ir</a>
      </div>
    </div>
    <div class="card" style="width: 18rem;">
      <div class="card-body">
        <h5 class="card-title">Criar</h5>
        <p class="card-text">Aqui você aprenderá como fazer sua conta para criar seu próprio Mangá e como fazer os capítulos para esse Mangá</p>
        <a href="{{ route('help.create') }}" class="btn btn-primary">Ir</a>
      </div>
    </div>
  </div>
@endsection
