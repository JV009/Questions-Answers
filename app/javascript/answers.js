document.addEventListener('turbo:load', function() {
  document.querySelectorAll('.edit-answer-link').forEach(link => {
    link.addEventListener('click', function(e) {
      e.preventDefault()
      const answerId = this.dataset.answerId
      this.style.display = 'none'
      document.getElementById(`edit-answer-${answerId}`).classList.remove('hidden')
    })
  })
})
