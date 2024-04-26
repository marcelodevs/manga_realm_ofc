@props(['manga', 'rascunhos'])

@section('css', 'templates/card-manga')

<div class="p-6 lg:p-8 bg-white border-b border-gray-200">
  <x-application-logo class="block h-12 w-auto" />

  <h1 class="mt-8 text-2xl font-medium text-gray-900">
    Bem-vindo(a) {{ Auth::user()->name }}!
  </h1>

  <p class="mt-6 text-gray-500 leading-relaxed">
    Laravel Jetstream provides a beautiful, robust starting point for your next Laravel application. Laravel is designed
    to help you build your application using a development environment that is simple, powerful, and enjoyable. We believe
    you should love expressing your creativity through programming, so we have spent time carefully crafting the Laravel
    ecosystem to be a breath of fresh air. We hope you love it.
  </p>
</div>

<div class="bg-gray-200 bg-opacity-25 grid grid-cols-1 md:grid-cols-2 gap-6 lg:gap-8 p-6 lg:p-8">
  <div>
    <div class="flex items-center">
      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
          <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
        </svg>
      <h2 class="ms-3 text-xl font-semibold text-gray-900">
        <a href="https://laravel.com/docs">Meus Favoritos</a>
      </h2>
    </div>

    <p class="mt-4 text-gray-500 text-sm leading-relaxed">
      Laravel has wonderful documentation covering every aspect of the framework. Whether you're new to the framework or have previous experience, we recommend reading all of the documentation from beginning to end.
    </p>

    <p class="mt-4 text-sm">
      <a href="https://laravel.com/docs" class="inline-flex items-center font-semibold text-indigo-700">
        Explore the documentation

        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" class="ms-1 w-5 h-5 fill-indigo-500">
          <path fill-rule="evenodd" d="M5 10a.75.75 0 01.75-.75h6.638L10.23 7.29a.75.75 0 111.04-1.08l3.5 3.25a.75.75 0 010 1.08l-3.5 3.25a.75.75 0 11-1.04-1.08l2.158-1.96H5.75A.75.75 0 015 10z" clip-rule="evenodd" />
        </svg>
      </a>
    </p>
  </div>

  <div>
    <div class="flex items-center">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book-half" viewBox="0 0 16 16">
        <path d="M8.5 2.687c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783"/>
      </svg>
      <h2 class="ms-3 text-xl font-semibold text-gray-900">
        <a href="https://laracasts.com">Meus Mangás</a>
      </h2>
    </div>

    <aside class="flex">
      @foreach ($manga as $item)
        <x-card-manga>
          <x-slot name="id">{{ $item->id }}</x-slot>
          <x-slot name="name">{{ $item->name }}</x-slot>
          <x-slot name="image">{{ $item->image }}</x-slot>
          <x-slot name="qtd_chapters">{{ $item->qtd_chapter }}</x-slot>
        </x-card-manga>
      @endforeach
    </aside>
  </div>

  <div>
    <div class="flex items-center">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
      </svg>
      <h2 class="ms-3 text-xl font-semibold text-gray-900">
        <a href="https://tailwindcss.com/">Meus Rascunhos</a>
      </h2>
    </div>

    <p class="mt-4 text-gray-500 text-sm leading-relaxed">
      Laravel Jetstream is built with Tailwind, an amazing utility first CSS framework that doesn't get in your way. You'll be amazed how easily you can build and maintain fresh, modern designs with this wonderful framework at your fingertips.
    </p>
  </div>
</div>
