import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="message"
export default class extends Controller {
  static targets = ["message"];

  update(event) {
    const message = event.detail.message;
    const currentUser = event.detail.currentUser;
    const messageDiv = this.messageTarget;

    if (message.user == currentUser) {
      messageDiv.style.backgroundColor = "#b2f0ff";
      messageDiv.classList.add("my-message");
      messageDiv.classList.remove("other-message");
      messageDiv.querySelector("strong").textContent = "You";
    } else {
      messageDiv.style.backgroundColor = "#f4ffa1";
      messageDiv.classList.add("other-message");
      messageDiv.classList.remove("my-message");
      messageDiv.querySelector("strong").textContent = message.user.username;
    }
  }
}
