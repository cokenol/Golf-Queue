/**
 * Stimulus controller
 * Documentation: https://stimulus.hotwired.dev/
 * read more about lifecyles at https://stimulus.hotwired.dev/reference/lifecycle-callbacks
 */

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["status", "friend", "stats", "statuscontent", "friendcontent", "statscontent"];

  // initialize() {
  //   // Once, when the controller is first instantiated
  //   //console.log("Generated Controller Initialized!");
  // }

  // connect() {
  //   // Anytime the controller is connected to the DOM
  //   //console.log("Generated Controller Connected!");
  // }

  statustab(e){
    e.preventDefault();
    console.log("hello status");
    this.removeactive();
    this.statusTarget.classList.add("active");
    this.removecontent();
    this.statuscontentTarget.classList.remove("d-none");
  }

  friendtab(e){
    e.preventDefault();
    console.log("hello friend");
    this.removeactive();
    this.friendTarget.classList.add("active");
    this.removecontent();
    this.friendcontentTarget.classList.remove("d-none");
  }

  statstab(e){
    e.preventDefault();
    console.log("hello stats");
    this.removeactive();
    this.statsTarget.classList.add("active");
    this.removecontent();
    this.statscontentTarget.classList.remove("d-none");
  }

  removeactive(){
    this.statusTarget.classList.remove("active");
    this.friendTarget.classList.remove("active");
    this.statsTarget.classList.remove("active");
  }

  removecontent(){
    this.statuscontentTarget.classList.add("d-none");
    this.friendcontentTarget.classList.add("d-none");
    this.statscontentTarget.classList.add("d-none");
  }
}
