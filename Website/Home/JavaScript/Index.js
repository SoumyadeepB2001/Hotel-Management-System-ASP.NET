// // Header Scroll
// let nav = document.querySelector(".navbar");
// window.onscroll = function () {
//   if (document.documentElement.scrollTop > 50) {
//     nav.classList.add("header-scrolled");
//   } else {
//     nav.classList.remove("header-scrolled");
//   }
// };

// // Nav Hide
// let navbar = document.querySelectorAll(".nav-link");
// let navCollaspe = document.querySelector(".navbar-collapse.collapse");
// navbar.forEach(function (a) {
//   a.addEventListener("click", function () {
//     navCollaspe.classList.remove("show");
//   });
// });

// Slider
var swiper = new Swiper(".mySwiper", {
  direction: "vertical",
  loop: true,
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },
  autoplay: {
    delay: 3500,
  },
});

// Rooms Slide
var swiper = new Swiper(".room-slider", {
  spaceBetween: 20,
  grabCursor: true,
  loop: true,
  centeredSlides: true,
  autoplay: {
    delay: 7500,
    disableOnInteraction: false,
  },
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },
  breakpoints: {
    0: {
      slidesPerView: 1,
    },
    768: {
      slidesPerView: 2,
    },
    991: {
      slidesPerView: 3,
    },
  },
});

// Accounts
let subMenu = document.getElementById("subMenu");

function toggleMenu() {
  subMenu.classList.toggle("open-menu");
}

// Bar
let menu = document.querySelector("#menu-icons");
let navbar = document.querySelector(".navbar");

menu.onclick = () => {
  menu.classList.toggle("bx-x");
  navbar.classList.toggle("open");
};

window.onscroll = () => {
  menu.classList.remove("bx-x");
  navbar.classList.remove("open");
};

let darkmode = document.querySelector("#darkmode");

darkmode.onclick = () => {
  if (darkmode.classList.contains("bx-moon")) {
    darkmode.classList.replace("bx-moon", "bx-sun");
    document.body.classList.add("dark");
  } else {
    darkmode.classList.replace("bx-sun", "bx-moon");
    document.body.classList.remove("dark");
  }
};
