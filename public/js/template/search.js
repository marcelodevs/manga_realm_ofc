const searchResults = document.getElementById('search-results');

document.getElementById('search').addEventListener('keyup', function () {
  const searchText = this.value.trim();

  if (searchText === '')
  {
    searchResults.innerHTML = '';
    return;
  }

  fetch(`/search/manga/${searchText}`)
    .then(response => response.json())
    .then(data => {
      if (data.status)
      {
        let html = '';
        data.data.forEach(manga => {
          console.log(manga);
          html += `<div onclick="redirect(${manga.id})">${manga.name}</div>`;
        });
        searchResults.innerHTML = html;
      } else
      {
        searchResults.innerHTML = '<div>Nenhum mangá encontrado</div>';
      }
    })
    .catch(error => {
      console.error('Erro ao buscar mangás:', error);
    });
});

function redirect(id) {
  window.location.href = '/manga/' + id;
}
