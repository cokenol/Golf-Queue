/**
 * Stimulus controller
 * Documentation: https://stimulus.hotwired.dev/
 * read more about lifecyles at https://stimulus.hotwired.dev/reference/lifecycle-callbacks
 */

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "likebtn", "unlikebtn", "counter"];


  like(event) {
    this.likebtnTarget.className = "";
    this.likebtnTarget.classList.add("far", "fa-heart", "fa-lg");
    this.counterTarget.innerText = parseInt(this.counterTarget.getAttribute("value")) - 1;
  }

  unlike(event) {
    this.unlikebtnTarget.className = "";
    this.unlikebtnTarget.classList.add("fas", "fa-heart", "fa-lg", "text-danger");
    this.counterTarget.innerText = parseInt(this.counterTarget.getAttribute("value")) + 1;
  }
}
