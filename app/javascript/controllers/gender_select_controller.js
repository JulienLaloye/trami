import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="gender-select"
export default class extends Controller {
  connect() {
    console.log("params connected")
  }

  params(event) {
    console.log("this is params")
    console.log(event.params.gender)
    this.element.insertAdjacentHTML("beforeend", `<input type="hidden" name="gender" id="gender" value="${event.params.gender}" />`)
  }
}
