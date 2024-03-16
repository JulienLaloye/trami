import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "allParticipants", "toggleButton"];

  toggleVisibility(event) {
    this.allParticipantsTarget.classList.toggle("d-none");
    const buttonText = this.toggleButtonTarget.textContent;
    const buttonColor = this.toggleButtonTarget.style.backgroundColor;
    console.log(buttonColor);
    this.toggleButtonTarget.style.background = buttonColor ===  "rgb(62, 62, 62)"? "rgba(255, 171, 25, 1)" : "rgb(62, 62, 62)";
  }
}
