/**
 * Stimulus controller
 * Documentation: https://stimulus.hotwired.dev/
 * read more about lifecyles at https://stimulus.hotwired.dev/reference/lifecycle-callbacks
 */

import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";
// import swal from "sweetalert";


export default class extends Controller {
  static targets = ['submit', 'loading', 'form'];

  initialize() {
    this.loadingMarkup = `<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                          <span class="sr-only" > Loading...</span >`
    // Once, when the controller is first instantiated
    console.log("Generated Controller Initialized!");
  }

  connect() {
    // Anytime the controller is connected to the DOM
    console.log("Generated Controller Connected!");
  }

  send(e) {
    e.preventDefault();

    console.log('sending')
    // this.submitTarget.innerHTML = this.loadingMarkup;
    this.submitTarget.classList.add("d-none")
    this.loadingTarget.classList.remove("d-none")
    //  'Accept': "application/json",
    fetch(this.formTarget.action, {
      method: 'POST',
      headers: {'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)
     })
      .then(response => response.json())
      .then(data => {
        if (data.status === 'success') {
          window.location = '/playwall_posts'
        };
      })
      .catch(error => {
        console.warn('Errorrrrrrrrrrrrr:', error);
        this.loadingTarget.classList.add("d-none");
        this.submitTarget.classList.remove("d-none");
        alert("Form missing inputs!");
      });
  }
}