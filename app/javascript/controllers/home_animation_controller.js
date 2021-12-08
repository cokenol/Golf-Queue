/**
 * Stimulus controller
 * Documentation: https://stimulus.hotwired.dev/
 * read more about lifecyles at https://stimulus.hotwired.dev/reference/lifecycle-callbacks
 */

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["navbar", "text", "golf", "queue", "avatar", "icon", "login"];

  initialize() {
    // Once, when the controller is first instantiated
    console.log("Generated Controller Initialized!");
  }

  connect() {
    // set the timeout
    setTimeout(() => {
      this.navbarTarget.classList.remove("navbar-animate-one");
      setTimeout(() => {
        this.navbarTarget.classList.remove("navbar-animate-two")
      }, 800);
    }, 800);
    /**
     * CLEAN THIS SHIT
     */
    // Anytime the controller is connected to the DOM
    console.log("Home Animation Controller Connected!");

  }

  disconnect() {
    // Anytime the controller is disconnected from the DOM
    console.log("Home Animation Controller Disconnected!");
  }

}
