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
        this.navbarTarget.classList.remove("navbar-animate-two");
        setTimeout(() => {
          this.navbarTarget.classList.remove("navbar-animate-three");
          setTimeout(() => {
            this.navbarTarget.classList.remove("navbar-animate-four");
          }, 300);
        }, 300);
      }, 300);
    }, 1500);
    console.log("Home Animation Controller Connected!");

  }

  disconnect() {
    // Anytime the controller is disconnected from the DOM
    console.log("Home Animation Controller Disconnected!");
  }

}
