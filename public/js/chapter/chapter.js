const paragraph = document.getElementById('substr');
let text = paragraph.innerHTML;

// Verificar e destacar palavras entre asteriscos
text = text.replace(/\*(.*?)\*/g, '<span class="highlight">*$1*</span>');

// Verificar palavras no início da frase pós quebra de linha que terminam com igual
text = text.replace(/(?:^|\n)(\w+)=/g, '\n<span class="bold">$1</span>=');

// Atualizar o conteúdo do parágrafo
paragraph.innerHTML = text;

function voltar() {
  window.scroll({
    top: 0,
    behavior: 'smooth'
  });
}

function toggleChapter() {
  var fullContent = document.getElementById('fullContent');
  var substr = document.getElementById('substr');
  var button = document.querySelector('.content button');

  if (fullContent.style.display === 'none')
  {
    fullContent.style.display = 'block';
    substr.style.display = 'none';
    button.style.display = 'none';
    const paragraph = document.getElementById('fullContent');
    let text = paragraph.innerHTML;

    // Verifica e destaca palavras entre asteriscos
    text = text.replace(/\*(.*?)\*/g, '<span class="highlight">*$1*</span>');

    // Verifica palavras no início da frase pós quebra de linha que terminam com igual
    text = text.replace(/(?:^|\n)(\w+)=/g, '\n<span class="bold">$1</span>=');

    paragraph.innerHTML = text;
  } else
  {
    fullContent.style.display = 'none';
    button.textContent = 'Mostrar mais';
  }
}
