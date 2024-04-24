<div class="content">
  <a href="/manga/{{ $id }}" class="manga-link">
    <div class="card">
      <div class="card-img">
        <img src="/images/manga/{{ $image }}" alt="Descrição da imagem">
      </div>
      <div class="card-content">
        <p>{{ $name }}</p>
        <div class="transparent-p">
          <p>Capítulos</p>
          <p>{{ $qtd_chapters }}</p>
        </div>
      </div>
      <div class="card-description">
        <p>
          {{ $synopse }}
        </p>
        @if (!$categories)
          <p>
            @foreach (json_decode($categories) as $category)
              {{ $category }},
            @endforeach
          </p>
        @endif
      </div>
    </div>
  </a>
</div>
