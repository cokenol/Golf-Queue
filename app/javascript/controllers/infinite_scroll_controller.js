/**
 * Stimulus controller
 * Documentation: https://stimulus.hotwired.dev/
 * read more about lifecyles at https://stimulus.hotwired.dev/reference/lifecycle-callbacks
 */


import { Controller } from "stimulus";

import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = ["entries", "pagination"];

  connect() {
    // Anytime the controller is connected to the DOM
    console.log("Infinite scrolling Controller Connected!");
  }

  scroll() {
    // console.log(window.pageYOffset);
    let url = this.paginationTarget.querySelector("a[rel='next']").href

    var body = document.body,
      html = document.documentElement

    var height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight)

    if(window.pageYOffset >= height - window.innerHeight) {
      // console.log("bottom");
      this.loadMore(url);
    }
  }

  loadMore(url) {
    Rails.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      success: (data) => {
        this.entriesTarget.insertAdjacentHTML('beforeend', data.entries );
        console.log(this.paginationTarget);
        console.log(data.pagination);
        this.paginationTarget.innerHTML = data.pagination;
      }
    })
  }
}
