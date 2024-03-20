import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="wave"
export default class extends Controller {
  connect() {
    console.log(this.element.innerText)

    let delay = 200;
    const text = "Hi Friend"
    let h1 = this.element

    h1.innerHTML = text.split("").map(letter => {
      console.log(letter);
      return `<span>` + letter + `</span>`;
    }).join("");
    console.log(h1)

    Array.from(h1.children).forEach((w, index) => {
      console.log(w)
      setTimeout(() => {
        w.classList.add("wavy");
      }, index * 60 + delay);
    });
  }
}
