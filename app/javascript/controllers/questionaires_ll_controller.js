import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="questionaires-ll"
export default class extends Controller {
  static targets = ["boo"]

  connect() {
    console.log("ll connected")
  }

  fire(event) {
    this.booTargets.forEach((b) => {
      if (b.classList.contains("ques-3-ans-orange") === false) {
        console.log(b)
        b.innerHTML = `<h5 class="mb-0"><label class="mx-${event.currentTarget.id} main-font weight-300 font-18 text-black-gray mb-0" for="status">${event.currentTarget.params.status}</label></h5>`
      }
    })

  }
}
