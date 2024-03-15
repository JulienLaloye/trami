import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="questionaires"
export default class extends Controller {
  static targets = ["moodElement"]

  connect() {
    console.log(this.moodElementTarget.innerText)
  }

  mood() {
    const toggle = this.element.toggleAttribute("mood-card-select")
    console.log(toggle)
    if (toggle === true) {
      this.element.classList.add("mood-card-select")
      this.element.insertAdjacentHTML("beforeend", `<input type="hidden" name="mood" id="mood" value="${this.moodElementTarget.innerText}" />`)
    } else {
      this.element.classList.remove("mood-card-select")
      const child = console.log(this.element.innerHTML = '')
      this.element.insertAdjacentHTML("beforeend", `<label class="main-font text-black-gray" for="mood">${this.element.id}</label>`)
    }
  }
}
