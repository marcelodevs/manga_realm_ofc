@props(['manga'])

<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">Mangás</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body d-flex flex-column align-items-center w-100">
        @foreach ($manga as $item)
          <x-card-manga>
            <x-slot name="id">{{ $item->id }}</x-slot>
            <x-slot name="name">{{ $item->name }}</x-slot>
            <x-slot name="image">{{ $item->image }}</x-slot>
            <x-slot name="qtd_chapters">{{ $item->qtd_chapter }}</x-slot>
          </x-card-manga>
        @endforeach
      </div>
    </div>
  </div>
</div>
