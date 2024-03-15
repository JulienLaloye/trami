import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="questionaires-status"
export default class extends Controller {
  static targets = ["statusElement"]

  connect() {
    console.log(this.statusValue)
  }

  status() {
    this.element.style.cssText = 'border: 3px solid #ff9419; box-shadow: 0px 0px 8px rgba(114, 99, 86, .2);'
    this.statusElementTarget.insertAdjacentHTML("beforeend", `<input type="hidden" name="status" id="status" value="${this.statusValue}" />`)
  }
}
