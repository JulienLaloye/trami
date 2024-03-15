import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="questionaires-status"
export default class extends Controller {
  static targets = ["statusElement"]

  static values = { status: String }

  connect() {
    console.log(this.statusValue)
  }

  status(event) {
    const toggle = this.element.toggleAttribute("ques-3-ans-orange")
    console.log(toggle)
    if (toggle === true) {
      this.element.classList.add("ques-3-ans-orange")
      console.log(event.params.status)
      this.element.insertAdjacentHTML("beforeend", `<input type="hidden" name="status" id="status" value="${event.params.status}" />`)
    } else {
      this.element.classList.remove("ques-3-ans-orange")
      this.element.innerHTML = ''
      this.element.insertAdjacentHTML("beforeend", `<span value="local"></span>
      <h5 class="mb-0"><label class="mx-3 main-font weight-300 font-18 text-black-gray mb-0" for="mood">${this.statusValue}</label></h5>`)
    }
  }
}
