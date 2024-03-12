import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  connect() {
    console.log("Hello, Stimulus!");
    var swiper = new Swiper(".upcomingroomsSwiper", {
      slidesPerView: 6,
      spaceBetween: 40,
      centeredSlides: true,
      grabCursor: true,
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
