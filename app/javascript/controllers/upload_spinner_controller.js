/**
 * Stimulus controller
 * Documentation: https://stimulus.hotwired.dev/
 * read more about lifecyles at https://stimulus.hotwired.dev/reference/lifecycle-callbacks
 */

import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";
// import swal from "sweetalert";


export default class extends Controller {
  static targets = ['submit', 'loading', 'form', 'photo'];

  initialize() {
    this.loadingMarkup = `<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                          <span class="sr-only" > Loading...</span >`
    // Once, when the controller is first instantiated
    console.log("Loading animation Controller Initialized!");
  }

  connect() {
    // Anytime the controller is connected to the DOM
    console.log("Loading animation Controller Connected!");
  }

  send(e) {
    e.preventDefault();

    console.log('sending')
    // this.submitTarget.innerHTML = this.loadingMarkup;
    this.submitTarget.classList.add("d-none")
    this.loadingTarget.classList.remove("d-none")
    //  'Accept': "application/json",
    // console.log(this.photoTarget);
    // debugger;
    fetch(this.formTarget.action, {
      method: 'POST',
      headers: {'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)
     })
      .then(response => response.json())
      .then(data => {
        if (data.status === 'success') {
          if (window.location.href )
          window.location = data.location
        } else if (data.status === 'failure') {
          this.loadingTarget.classList.add("d-none");
          this.submitTarget.classList.remove("d-none");
          alert("You need to be near the golf range to post!");
        };
      })
      .catch(error => {
        console.warn('Errorr:', error);
        this.loadingTarget.classList.add("d-none");
        this.submitTarget.classList.remove("d-none");
        alert("Form missing inputs!/ Not near selected location!");
      });
  }
}
