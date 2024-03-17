import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  connect() {
    console.log("Hello, Stimulus!");
    var swiper = new Swiper(".upcomingroomsSwiper", {
      slidesPerView: 4,
      spaceBetween: 10,
      centeredSlides: false,
      grabCursor: false,
      loop: false,

      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      }
    });
  }
}
