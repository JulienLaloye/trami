import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="personality"
export default class extends Controller {
  static targets = ["personalityCard"]

  connect() {
    console.log("personality connected!")
  }

  click(event) {
    console.log(event.params.personality)
    this.element.insertAdjacentHTML("beforeend", `<input type="hidden" name="personality" id="personality" value="${event.params.personality}" />`)
    console.log(event.currentTarget)
  }
}
