import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mood-color"
export default class extends Controller {
  static targets = ["moodName"];

  connect() {
    console.log("Connected to mood-color")
  }

  // Method to handle mouseover event
  displayColor(event) {
    const moodName = event.currentTarget;
    const moodColor = moodName.dataset.color;
    moodName.style.backgroundImage = `radial-gradient(circle, ${moodColor} 45%, transparent, transparent)`;
  }
  // Method to handle mouseout event
  resetColor(event) {
    const moodName = event.currentTarget;
    moodName.style.backgroundImage = "";
  }
}
