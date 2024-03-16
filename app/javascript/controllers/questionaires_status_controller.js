import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="questionaires-status"
export default class extends Controller {

  connect() {
    console.log("currentparams connected")
  }

  removeMood(event) {
    const mood = event.currentTarget.innerText
    if (event.currentTarget.toggleAttribute("mood-card-select") === false) {
      event.currentTarget.innerHTML = `<label class="main-font text-black-gray" for="mood">${mood}</label>`
    }
    console.log(this.element)
  }
}
