/**
 * Stimulus controller
 * Documentation: https://stimulus.hotwired.dev/
 * read more about lifecyles at https://stimulus.hotwired.dev/reference/lifecycle-callbacks
 */

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['notification'];

  initialize() {
    // Once, when the controller is first instantiated
    console.log("Notification Controller Initialized!");
  }

  connect() {
    // Anytime the controller is connected to the DOM
    console.log("Notification Controller Connected!");
    setTimeout(() => {
      fetch('/notifications/mark_read')
        .then(response => response.json())
        .then((data) => {
          console.log(data);
          this.notificationTarget.classList.remove('unread');
        });
    }, 4000);
  }

  disconnect() {
    // Anytime the controller is disconnected from the DOM
    console.log("Notification Controller Disconnected!");
  }
  // click(event) {
  //   debugger;
  // }
}
