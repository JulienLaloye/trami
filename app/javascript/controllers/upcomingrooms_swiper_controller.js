import { Controller } from "stimulus";

export default class extends Controller {

  connect() {var swiper = new Swiper(".upcomingroomsSwiper", {
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
  });
  }
}
