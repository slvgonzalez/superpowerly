// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { add, Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))

const modal = document.querySelector(".modal");

if ((location.pathname + location.search).includes('/bookings?no=')) {
  document.addEventListener("DOMContentLoaded", function() {
    modal.style.display = "block";
    modal.classList.add("show");
  });

  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
  modal.onclick = function() {
    this.style.display = "none";
  }
}
