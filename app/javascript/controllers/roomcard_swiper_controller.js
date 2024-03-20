import { Controller } from "@hotwired/stimulus"
// import Swiper from 'swiper/bundle';

// Connects to data-controller="roomcard-swiper"
export default class extends Controller {
  connect() {
    console.log("roomcard connected")
    var swiper = new Swiper(".roomcardSwiper", {
      slidesPerView: 3,
      spaceBetween: 40,
      centeredSlides: false,
      loop: true,

      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
  });
  }
}
