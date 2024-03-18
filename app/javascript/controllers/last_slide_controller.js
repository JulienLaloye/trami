import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="last-slide"
export default class extends Controller {
  static targets = ["button", "sign", "prev"]

  connect() {
    console.log("last slide connected")
  }

  fired() {
    console.log("fired connected")
    this.buttonTarget.classList.remove("round-button-next")
    this.signTarget.classList.remove("button-content")
    this.buttonTarget.classList.add("disabled-round-btn")
    this.signTarget.classList.add("sign-gray")
    this.buttonTarget.disabled = true
    console.log(this.buttonTarget)
  }

  next() {
    console.log("next connected")
    this.prevTarget.classList.remove("d-none")
  }
}
