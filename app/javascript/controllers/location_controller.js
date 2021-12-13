/**
 * Stimulus controller
 * Documentation: https://stimulus.hotwired.dev/
 * read more about lifecyles at https://stimulus.hotwired.dev/reference/lifecycle-callbacks
 */

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [];

  initialize() {
    // Once, when the controller is first instantiated
    console.log("Location Controller Initialized!");
  }

  connect() {
    // Anytime the controller is connected to the DOM
    console.log("Location Controller Connected!");
  }

  disconnect() {
    // Anytime the controller is disconnected from the DOM
    console.log("Location Controller Disconnected!");
  }

  allow() {
    console.log("clicked");
    navigator.permissions.query({ name: 'geolocation' }).then(function (result) {
      if (result.state === 'granted') {
        // debugger;
        console.log("connected");
        navigator.geolocation.getCurrentPosition(setGeoCookie);
        // showMap();
      } else if (result.state === 'prompt') {
        console.log("Not allowed");
        showButtonToEnableMap();
        navigator.geolocation.getCurrentPosition(setGeoCookie);
      }
    });

    function setGeoCookie(position) {
      var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
      document.cookie = "lat_lng=" + escape(cookie_val);
    }
  }
}
