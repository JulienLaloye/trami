import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-new"
export default class extends Controller {
    static targets = ["togglableElement", "reset"]
    fire(event) {
      this.resetTargets.forEach((r) => {
        r.classList.remove(`mood-card-${r.innerText.toLowerCase()}`)
      })
      event.currentTarget.classList.add(`mood-card-${event.currentTarget.innerText.toLowerCase()}`)

      if (event.currentTarget.toggleAttribute(`mood-card-${event.currentTarget.innerText.toLowerCase()}`) === true) {
        this.togglableElementTarget.classList.remove("d-none");
      }
      else {
        event.currentTarget.classList.remove(`mood-card-${event.currentTarget.innerText.toLowerCase()}`)
        this.togglableElementTarget.classList.add("d-none");
      }
    }
}
