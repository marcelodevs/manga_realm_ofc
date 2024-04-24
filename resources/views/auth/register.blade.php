<x-guest-layout>
  <x-authentication-card>
    <x-slot name="logo">
    </x-slot>
    {{-- Exibição de erros de validação --}}
    <x-validation-errors class="mb-4" />
    <form method="POST" action="{{ route('register') }}">
      @csrf
      <div>
        <x-label for="image" value="{{ __('Foto') }}" />
        <x-input id="image" class="block mt-1 w-full" type="file" name="image" :value="old('foto')" required />
      </div>
      <div>
        <x-label for="name" value="{{ __('Nome') }}" />
        <x-input id="name" class="block mt-1 w-full" type="text" name="name" :value="old('name')" required autofocus />
      </div>
      <div class="mt-4">
        <x-label for="email" value="{{ __('Email') }}" />
        <x-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required />
      </div>
      <div class="mt-4">
        <x-label for="password" value="{{ __('Senha') }}" />
        <x-input id="password" class="block mt-1 w-full" type="password" name="password" required autocomplete="new-password" />
      </div>
      <div class="mt-4">
        <x-label for="password_confirmation" value="{{ __('Confirmar Senha') }}" />
        <x-input id="password_confirmation" class="block mt-1 w-full" type="password" name="password_confirmation" required autocomplete="new-password" />
      </div>
      <div class="flex items-center justify-end mt-4">
        <a href="{{ route('login') }}" class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
          {{ __('Já registrado?') }}
        </a>
        <x-button class="ml-4">
          {{ __('Registrar') }}
        </x-button>
      </div>
    </form>
  </x-authentication-card>
</x-guest-layout>
