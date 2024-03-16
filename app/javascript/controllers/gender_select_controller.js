import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="gender-select"
export default class extends Controller {
  connect() {
    console.log("gender-select connected")
  }

  gender(event) {
    const toggle = this.element.toggleAttribute("icon-gender-shadow")
    console.log(toggle)
    if (toggle === true) {
      this.element.classList.add("icon-gender-shadow")
      console.log(event.params.gender)
      this.element.insertAdjacentHTML("beforeend", `<input type="hidden" name="gender" id="gender" value="${event.params.gender}" />`)
    } else {
      this.element.classList.remove("icon-gender-shadow")
      this.element.innerHTML = ''
      this.element.insertAdjacentHTML("beforeend", `<img class="${event.params.gender}-img" alt="${event.params.gender}" class="${event.params.gender}" src="/assets/${event.params.gender}.png">`)
    }
  }
}
