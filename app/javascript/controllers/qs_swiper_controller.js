import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="qs-swiper"
export default class extends Controller {
  connect() {
    console.log("qs-swiper is connected")

    new Swiper('.qs-swiper', {
      centeredSlides: true,

      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      // Navigation arrows
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      }
    });
  }
}
