import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="questionaires-lotr"
export default class extends Controller {
  static targets = ["ques"]

  connect() {
    console.log("lotr connected")
  }

  status(event) {
    this.quesTargets.forEach((t) => {
      t.classList.remove("ques-3-ans-orange")
    })
    event.currentTarget.classList.toggle("ques-3-ans-orange")
    if (event.currentTarget.classList.contains("ques-3-ans-orange")) {
      event.currentTarget.insertAdjacentHTML("beforeend", `<input type="hidden" name="status" id="status" value="${event.params.status}" />`)
    }
  }
}
