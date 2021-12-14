/**
 * Stimulus controller
 * Documentation: https://stimulus.hotwired.dev/
 * read more about lifecyles at https://stimulus.hotwired.dev/reference/lifecycle-callbacks
 */

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["navbar"];

  connect() {
    if (window.location.href == "http://localhost:3000/" || window.location.href == "https://golf-queue.herokuapp.com/") {
      this.navbarTarget.classList.add("animate-action");
    }

    setTimeout(() => {
      this.navbarTarget.classList.remove("animate-initial", "animate-action")
    }, 2000);

    //console.log(this.navbarTarget.classList);
  }

}
