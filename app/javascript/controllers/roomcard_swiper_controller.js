import { Controller } from "@hotwired/stimulus"
// import Swiper from 'swiper/bundle';

// Connects to data-controller="roomcard-swiper"
export default class extends Controller {
  connect() {var swiper = new Swiper(".roomcardSwiper", {
    slidesPerView: 4,
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
  });
  }
}
