import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="questionaires-lotr"
export default class extends Controller {
  connect() {
    console.log("lotr connected")
  }
}
