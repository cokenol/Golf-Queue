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
    // console.log("Generated Controller Initialized!");
  }

  connect() {
    // Anytime the controller is connected to the DOM
    console.log("Generated Controller Connected!");
    if (document.cookie === "") {
      navigator.geolocation.getCurrentPosition((position) => {
        var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
        document.cookie = "lat_lng=" + escape(cookie_val);
        location.reload();
      });
    }
  }

  // disconnect() {
  //   // Anytime the controller is disconnected from the DOM
  //   console.log("Generated Controller Disconnected!");
  // }
}
