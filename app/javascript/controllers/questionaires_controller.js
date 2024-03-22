import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="questionaires"
export default class extends Controller {
  static targets = ["moodElement", "value"]

  connect() {
    console.log("questionaires connected")
  }

  mood(event) {
    const c  = event.currentTarget.classList.toggle("brightness-1")
    event.currentTarget.classList.toggle("zoom")
    console.log(c)
    //this.moodElementTargets.forEach((mood) => {
    //})
    if (c) {
      event.currentTarget.insertAdjacentHTML("beforeend",`<input type="hidden" name="${event.currentTarget.id}" value="${event.currentTarget.id}" />`)
    } else {
      console.log("it's false")
    }
    // console.log(this.element)
  }
}
