import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("2nd Stimulus here!");
    var swiper = new Swiper(".myroomsSwiper", {
      slidesPerView: 4,
      spaceBetween: 40,
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
