import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  handleResponse(event) {
    if (event.detail.success) {
      this.element.reset();
    }
  }
}
