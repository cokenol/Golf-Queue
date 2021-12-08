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
    // Anytime the controller is connected to the DOM
    console.log("Home Animation Controller Connected!");
    console.log(window.location.href);
    setTimeout(() => {
      console.log( (window.location.href == "http://localhost:3000/") || (window.location.href == "https://golf-queue.herokuapp.com/")  );
      if ((window.location.href == "http://localhost:3000/") || (window.location.href == "https://golf-queue.herokuapp.com/")) {
        this.navbarTarget.classList.add("navbar-full");
        this.textTarget.classList.add("nav-text-center");
        this.golfTarget.classList.add("nav-text-large");
        this.queueTarget.classList.add("nav-display-none");
        this.avatarTarget.classList.add("nav-display-none");
        this.loginTarget.classList.add("nav-display-none");
        this.iconTarget.classList.add("nav-display-true");
        // Add transition to items
        setTimeout(() => {
          this.navbarTarget.classList.add("nav-transition");
          this.textTarget.classList.add("nav-transition");
          this.golfTarget.classList.add("nav-transition");
          this.queueTarget.classList.add("nav-transition");
          this.avatarTarget.classList.add("nav-transition");
          this.loginTarget.classList.add("nav-transition");
          this.iconTarget.classList.add("nav-transition");
        }, 500)
        // Golf become smaller
        setTimeout(() => {
          this.golfTarget.classList.remove("nav-text-large");
        }, 1000)
        // golf to left, queue appear, avatar button appear.
        setTimeout(() => {
          this.textTarget.classList.remove("nav-text-center");
          this.queueTarget.classList.remove("nav-display-none");
          this.avatarTarget.classList.remove("nav-display-none");
          this.loginTarget.classList.remove("nav-display-none");
        }, 1500)
        //navigation bar shrink to top in position.
        setTimeout(() => {
          this.navbarTarget.classList.remove("navbar-full");
          this.iconTarget.classList.remove("nav-display-true");
        }, 2000)
      }
    } , 0);

  }

  disconnect() {
    // Anytime the controller is disconnected from the DOM
    console.log("Home Animation Controller Disconnected!");
  }

}
