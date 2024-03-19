import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="aboutpage"
export default class extends Controller {
  static targets = ["about"]

  connect() {
    console.log("aboutpage controller connected")
  }

  toggle(event) {
    console.log("it's toggled")
    this.aboutTarget.scrollIntoView();
  }
}
