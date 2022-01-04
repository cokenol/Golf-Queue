// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
//import { getGeoLocation, setGeoCookie } from "components/currentcoords";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import "glider-js/glider.min.js";

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
});



import "controllers"

window.addEventListener('load', () => {
  document.querySelectorAll('.glider').forEach((s) => {
    new Glider(s, {
      // Mobile-first defaults
      slidesToShow: 1,
      slidesToScroll: 1,
      scrollLock: true,
      draggable: true,
      dots: s.parentNode.querySelector('.glider-dots'),
    });
  })
})
