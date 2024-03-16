import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="change-location"
export default class extends Controller {
  connect() {
    console.log("Hey change location")
  }

}
