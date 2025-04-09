import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "link"]

  edit(event) {
    event.preventDefault()
    const answerId = event.target.dataset.answerId
    this.linkTargets.forEach(link => link.classList.add('hidden'))
    document.getElementById(`edit-answer-${answerId}`).classList.remove('hidden')
  }
}
