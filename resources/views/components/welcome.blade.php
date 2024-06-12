@props(['manga', 'rascunhos', 'favoritos'])

@section('css', 'user/chapter/sketch')
@section('css2', 'templates/card-manga')

<div class="p-6 lg:p-8 bg-white border-b border-gray-200">
  <x-application-logo class="block h-12 w-auto" />

  <h1 class="mt-8 text-2xl font-medium text-gray-900">
    Bem-vindo(a) {{ Auth::user()->name }}!
  </h1>

  <p class="mt-6 text-gray-500 leading-relaxed">
    Sem ideias doq pôr aq, entt finge que tem algo para preencher e segue o roteiro :)
  </p>
</div>

<div class="bg-gray-200 bg-opacity-25 grid grid-cols-1 md:grid-cols-2 gap-6 lg:gap-8 p-6 lg:p-8">
  <div>
    <div class="flex items-center" id="favoritos">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-check-fill" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5m8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0z"/>
      </svg>
      <h2 class="ms-3 text-xl font-semibold text-gray-900">
        <a href="">Meus Favoritos ( {{ count($favoritos) }} )</a>
      </h2>
    </div>

    <aside class="flex">
      @foreach ($favoritos as $item)
        <x-card-manga>
          <x-slot name="route">{{ route('show.manga', $item->id) }}</x-slot>
          <x-slot name="name">{{ $item->name }}</x-slot>
          <x-slot name="image">{{ $item->image }}</x-slot>
          <x-slot name="qtd_chapters">{{ $item->qtd_chapter }}</x-slot>
        </x-card-manga>
      @endforeach
    </aside>
  </div>

  <div>
    <div class="flex items-center" id="mangas">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book-half" viewBox="0 0 16 16">
        <path d="M8.5 2.687c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783"/>
      </svg>
      <h2 class="ms-3 text-xl font-semibold text-gray-900">
        <a href="">Meus Mangás ( {{ count($manga) }} )</a>
      </h2>
    </div>

    <aside class="flex">
      @foreach ($manga as $item)
        <x-card-manga>
          <x-slot name="route">{{ route('edit.manga', $item->id) }}</x-slot>
          <x-slot name="name">{{ $item->name }}</x-slot>
          <x-slot name="image">{{ $item->image }}</x-slot>
          <x-slot name="qtd_chapters">{{ $item->qtd_chapter }}</x-slot>
        </x-card-manga>
      @endforeach
    </aside>
  </div>

  <div>
    <div class="flex items-center" id="rascunhos">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
      </svg>
      <h2 class="ms-3 text-xl font-semibold text-gray-900">
        <a href="">Meus Rascunhos ( {{ count($rascunhos) }} )</a>
      </h2>
    </div>

    <aside class="flex sketch">
      @foreach ($rascunhos as $item)
        <x-card-sketch-chapter>
          <x-slot name="id">{{ $item->id }}</x-slot>
          <x-slot name="index">{{ $item->index }}</x-slot>
          <x-slot name="title">{{ $item->title }}</x-slot>
        </x-card-sketch-chapter>
      @endforeach
    </aside>
  </div>
</div>
