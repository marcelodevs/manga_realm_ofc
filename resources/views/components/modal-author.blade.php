@props(['manga'])

<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel">Perfil</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="d-flex flex-row justify-content-evenly align-items-center">
          <img src="/storage/{{ $user_image }}" class="rounded-circle w-25">
          <div class="row">
            <p class="text-dark fs-4">{{ $user_name }}</p>
            <p class="text-dark fs-5">{{ $user_name }}</p>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">Ver mangás</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">Mangás</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body d-flex flex-column align-items-center w-100">
          @foreach ($manga[0] as $item)
            <x-card-manga>
              <x-slot name="route">{{ route('show.manga', $item->id) }}</x-slot>
              <x-slot name="name">{{ $item->name }}</x-slot>
              <x-slot name="image">{{ $item->image }}</x-slot>
              <x-slot name="qtd_chapters">{{ $item->qtd_chapter }}</x-slot>
            </x-card-manga>
          @endforeach
      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Ver perfil</button>
      </div>
    </div>
  </div>
</div>

