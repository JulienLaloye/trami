import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="questionaires"
export default class extends Controller {
  static targets = ["moodElement"]

  connect() {
    console.log(this.moodElementTarget.innerText)
  }

  mood() {
    this.element.classList.toggle("mood-card-select")
    if (this.element.classList.contains("mood-card-select")) {
      this.moodElementTarget.insertAdjacentHTML("beforeend", `<input type="hidden" name="mood" id="mood" value="${this.moodElementTarget.innerText}" />`)
    }
  }
}
