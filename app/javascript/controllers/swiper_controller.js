import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 5,
      spaceBetween: 40,
      centeredSlides: true,
      grabCursor: true,
      loop: true,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
      autoplay: {
        delay: 4000,
      },
    });
  }
}


/* ------ POSSIBLE FEATURES FOR THE SLIDER -START
autoplay: {
  delay: 4000,
}

  fadeEffect: {
    crossFade: true},

effect: 'fade',  //-- can be placed below the loop parameter
------ POSSIBLE FEATURES FOR SLIDERS -END */
