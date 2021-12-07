/**
 * Stimulus controller
 * Documentation: https://stimulus.hotwired.dev/
 * read more about lifecyles at https://stimulus.hotwired.dev/reference/lifecycle-callbacks
 */

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["filledLikeBtn", "emptyLikeBtn", "upcounter", "downcounter", "emptyDislikeBtn", "filledDislikeBtn"];

  like(event) {
    this.emptyLikeBtnTarget.className = "";
    this.emptyLikeBtnTarget.setAttribute("style", "color:green;");
    this.emptyLikeBtnTarget.classList.add("fas", "fa-thumbs-up", "p-2");
    this.upcounterTarget.innerText = parseInt(this.upcounterTarget.getAttribute("value")) + 1;
    this.filledDislikeBtnTarget.className = "";
    this.filledDislikeBtnTarget.classList.add("far", "fa-thumbs-down", "p-2");
    this.filledDislikeBtnTarget.setAttribute("style", "color:black;");
    this.downcounterTarget.innerText = parseInt(this.downcounterTarget.getAttribute("value")) - 1;
  }

  dislike(event) {
    this.emptyDislikeBtnTarget.className = "";
    this.emptyDislikeBtnTarget.setAttribute("style", "color:red;");
    this.emptyDislikeBtnTarget.classList.add("fas", "fa-thumbs-down", "p-2");
    this.downcounterTarget.innerText = parseInt(this.downcounterTarget.getAttribute("value")) - 1;
    this.filledLikeBtnTarget.className = "";
    this.filledLikeBtnTarget.classList.add("far", "fa-thumbs-up", "p-2");
    this.filledLikeBtnTarget.setAttribute("style", "color:black;");
    this.upcounterTarget.innerText = parseInt(this.upcounterTarget.getAttribute("value")) - 1;
  }

}
