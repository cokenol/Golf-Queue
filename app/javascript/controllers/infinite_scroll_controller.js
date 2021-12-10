/**
 * Stimulus controller
 * Documentation: https://stimulus.hotwired.dev/
 * read more about lifecyles at https://stimulus.hotwired.dev/reference/lifecycle-callbacks
 */


import { Controller } from "stimulus";

import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = ["entries", "pagination"];

  initialize() {
    let options = {
      rootMargin: '200px',
    }

    this.intersectionObserver = new IntersectionObserver(entries => this.processIntersectionEntries(entries), options)
    console.log(this.intersectionObserver);
  }

  connect() {
    // Anytime the controller is connected to the DOM
    console.log("Infinite scrolling Controller Connected!");
    this.intersectionObserver.observe(this.paginationTarget)
  }

  disconnect() {
    this.intersectionObserver.unobserve(this.paginationTarget)
  }

  // scroll() {
  //   // console.log(window.pageYOffset);
  //   let url = this.paginationTarget.querySelector("a[rel='next']").href

  //   var body = document.body,
  //     html = document.documentElement

  //   var height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight)

  //   if(window.pageYOffset >= height - window.innerHeight) {
  //     // console.log("bottom");
  //     this.loadMore(url);
  //   }
  // }


  processIntersectionEntries(entries) {
    console.log('hello intersection');
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        console.log('hitting the intersection');
        this.loadMore()
      }
    })
  }

  loadMore() {
    let next_page = this.paginationTarget.querySelector("a[rel='next']")
    if (next_page == null) { return }
    let url = next_page.href

    Rails.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      success: (data) => {
        this.entriesTarget.insertAdjacentHTML('beforeend', data.entries );
        console.log(this.paginationTarget);
        console.log(data.pagination);
        this.paginationTarget.innerHTML = data.pagination;
      },
      error: (e) => { console.log(`something went wrong: ${e}`)}
    })
  }
}
