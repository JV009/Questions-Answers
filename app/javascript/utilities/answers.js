document.addEventListener('turbo:load', function() {
  const handleEditClick = function(e) {
    if (e.target.classList.contains('edit-answer-link')) {
      e.preventDefault();
      const answerId = e.target.dataset.answerId;
      const form = document.getElementById(`edit-answer-${answerId}`);

      // Переключаем видимость
      form.classList.toggle('hidden');

      // Гарантированно показываем/скрываем форму
      if (form.classList.contains('hidden')) {
        form.style.display = 'none';
        e.target.style.display = 'inline';
      } else {
        form.style.display = 'block';
        e.target.style.display = 'none';
      }
    }
  };

  // Удаляем старые обработчики перед добавлением новых
  document.removeEventListener('click', handleEditClick);
  document.addEventListener('click', handleEditClick);
});
