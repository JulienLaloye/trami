import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="personality"
export default class extends Controller {
  static targets = ["personalityCard"]

  connect() {
    console.log("personality connected!")
  }

  click(event) {
    console.log(event.currentTarget)
  }
}
