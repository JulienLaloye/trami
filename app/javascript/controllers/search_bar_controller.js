import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bar"
export default class extends Controller {
  static targets = ["select-mood"]
  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  search(event) {
    event.preventDefault()
    console.log("searching for")
    const currentMood = this.selectMoodTargets
    currentMood === "social"
  }
}
