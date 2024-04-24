<x-action-section>
  <x-slot name="title">
    {{ __('Autenticação de dois fatores') }}
  </x-slot>

  <x-slot name="description">
    {{ __('Adicione uma nova ideia de Mangá que outros leitores poderam ver e avaliar sua ideia.') }}
  </x-slot>

  <x-slot name="content">
    <h3 class="text-lg font-medium text-gray-900">
      {{ __('Crie um novo Mangá!') }}
    </h3>
    <div class="mt-3 max-w-xl text-sm text-gray-600">
      <p>
        {{ __('Quando criar um novo Mangá poderá optar por deixá-lo público ou privado, em ambos os casos você poderá adicionar capítulos a ele.') }}
      </p>
    </div>
    <div class="mt-5">
      <x-nav-link href="/create/manga" :active="request()->routeIs('dashboard')">
        <x-button type="button">
          {{ __('Criar') }}
        </x-button>
      </x-nav-link>
    </div>
  </x-slot>
</x-action-section>
