document.getElementById('sinopse').addEventListener('input', function () {
  const maxLength = 0;
  const currentText = this.value.trim();
  const currentLength = currentText.length;
  const remaining = maxLength + currentLength;
  const charCount = document.getElementById('char-count');

  charCount.textContent = remaining;

  const wordCount = currentText.split(/\s+/).filter(function (word) {
    return word.length > 0;
  }).length;
  const wordCountDisplay = document.getElementById('word-count');
  wordCountDisplay.textContent = wordCount;

  if (remaining > 490) charCount.style.color = 'red';
  else charCount.style.color = 'white';
});
