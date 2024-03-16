import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="gender-select-none"
export default class extends Controller {
  static targets = ["icon"]

  connect() {
    console.log("gender-select-none connected")
  }

  gender(event) {
    this.iconTargets.forEach((t) => {
        t.classList.remove("icon-gender-shadow")
        event.currentTarget.classList.add("icon-gender-shadow")
        console.log("yay")
    })
    if (event.currentTarget.classList.contains("icon-gender-shadow")) {
      console.log(`it has icon-gender-shadow!`)
    }
  }
}
