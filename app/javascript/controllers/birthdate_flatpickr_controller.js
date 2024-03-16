import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="birthdate-flatpickr"
export default class extends Controller {
  connect() {
    console.log("birthdate-flatpickr connected", this.element);

    flatpickr(".birthdate", {
      dateFormat: "Y-m-d",
    });
  }
}
