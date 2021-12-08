/**
 * Stimulus controller
 * Documentation: https://stimulus.hotwired.dev/
 * read more about lifecyles at https://stimulus.hotwired.dev/reference/lifecycle-callbacks
 */

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["filledLikeBtn", "emptyLikeBtn", "upcounter", "downcounter", "emptyDislikeBtn", "filledDislikeBtn", "alertNotif"];

  like(event) {
    // let currentUser = this.emptyLikeBtn.dataset.current_user
    // if (currentUser === 'null') {
    //   this.showToast();
    // }
    // make a post request with the like
    // check the response
    // If the user is unathorised - status = 422 | 403
      // show a modal asking to log in
    // If the request is successful
      // update the UI with the right class
    if (this.emptyLikeBtnTarget.getAttribute("value") === 'false') {
      this.alertNotifTarget.classList.remove("d-none");
      setTimeout(() => { this.alertNotifTarget.classList.add("d-none"); }, 5000);
    }
    else {
      this.emptyLikeBtnTarget.className = "";
      this.emptyLikeBtnTarget.setAttribute("style", "color:green;");
      this.emptyLikeBtnTarget.classList.add("fas", "fa-thumbs-up", "p-2");
      this.upcounterTarget.innerText = parseInt(this.upcounterTarget.getAttribute("value")) + 1;
      this.filledDislikeBtnTarget.className = "";
      this.filledDislikeBtnTarget.classList.add("far", "fa-thumbs-down", "p-2");
      this.filledDislikeBtnTarget.setAttribute("style", "color:black;");
      this.downcounterTarget.innerText = parseInt(this.downcounterTarget.getAttribute("value")) - 1;
    }
  }

  dislike(event) {
    if (this.emptyDislikeBtnTarget.getAttribute("value") === 'false') {
      this.alertNotifTarget.classList.remove("d-none");
      setTimeout(() => { this.alertNotifTarget.classList.add("d-none"); }, 5000);
    }
    else {
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

  // showToast() {
  //   // logic for asking the user to sign in / up
  // }
}
