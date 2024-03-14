import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="questionaires"
export default class extends Controller {
  static targets = ["moodElement"]

  static values = {dreamy: String}

  connect() {
    console.log("questionaires controller connected")
  }

  mood() {
    console.log("connected")
  }
}
