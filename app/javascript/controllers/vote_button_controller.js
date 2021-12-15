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
      this.alertNotifTarget.classList.add("animate__fadeInUp");
      setTimeout(() => { this.alertNotifTarget.classList.add("animate__fadeOutDown"); }, 5000);
    }
    else if (this.hasEmptyLikeBtnTarget && this.emptyLikeBtnTarget.classList.contains("disabled")) {
      this.emptyLikeBtnTarget.setAttribute("href", "");
    }
    else {
      this.emptyLikeBtnTarget.className = "";
      this.emptyLikeBtnTarget.setAttribute("style", "color:green;");
      this.emptyLikeBtnTarget.classList.add("fas", "fa-thumbs-up", "p-2");
      this.emptyLikeBtnTarget.setAttribute("data-vote-button-target", "filledLikeBtn");
      this.upcounterTarget.innerText = parseInt(this.upcounterTarget.getAttribute("value")) + 1;

      if (this.hasEmptyDislikeBtnTarget) {
        this.disableemptydislike();
      }
      else {
        this.filledtoemptydislike();
        this.downcounterTarget.innerText = parseInt(this.downcounterTarget.getAttribute("value")) - 1;
      }
    }
  }

  dislike(event) {
    if (this.emptyDislikeBtnTarget.getAttribute("value") === 'false') {
      this.alertNotifTarget.classList.remove("d-none");
      this.alertNotifTarget.classList.add("animate__fadeInUp");
      setTimeout(() => { this.alertNotifTarget.classList.add("animate__fadeOutDown"); }, 5000);
    }
    else if (this.hasEmptyDislikeBtnTarget && this.emptyDislikeBtnTarget.classList.contains("disabled")) {
      this.emptyDislikeBtnTarget.setAttribute("href", "");
    }
    else {
      this.emptyDislikeBtnTarget.className = "";
      this.emptyDislikeBtnTarget.setAttribute("style", "color:red;");
      this.emptyDislikeBtnTarget.classList.add("fas", "fa-thumbs-down", "p-2");
      this.emptyDislikeBtnTarget.setAttribute("data-vote-button-target", "filledDislikeBtn")
      this.downcounterTarget.innerText = parseInt(this.downcounterTarget.getAttribute("value")) - 1;
      if (this.hasEmptyLikeBtnTarget) {
        this.disableemptylike()
      } else {
        this.filledtoemptylike()
        this.upcounterTarget.innerText = parseInt(this.upcounterTarget.getAttribute("value")) - 1;
      }
    }
  }

  disableemptydislike(){
    this.emptyDislikeBtnTarget.classList.add("disabled");
  }

  disableemptylike(){
    this.emptyLikeBtnTarget.classList.add("disabled");
  }

  filledtoemptydislike(){
    this.filledDislikeBtnTarget.className = "";
    this.filledDislikeBtnTarget.classList.add("far", "fa-thumbs-down", "p-2");
    this.filledDislikeBtnTarget.setAttribute("style", "color:black;");
    this.filledDislikeBtnTarget.setAttribute("href", "");
    this.filledDislikeBtnTarget.setAttribute("data-vote-button-target", "emptyDislikeBtn")
  }

  filledtoemptylike(){
    this.filledLikeBtnTarget.className = "";
    this.filledLikeBtnTarget.classList.add("far", "fa-thumbs-up", "p-2");
    this.filledLikeBtnTarget.setAttribute("style", "color:black;");
    this.filledLikeBtnTarget.setAttribute("href", "");
    this.filledLikeBtnTarget.setAttribute("data-vote-button-target", "emptyLikeBtn")
  }
  // showToast() {
  //   // logic for asking the user to sign in / up
  // }
}
