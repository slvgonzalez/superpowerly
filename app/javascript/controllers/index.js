// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { add, Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))

// Get the modal
const modal = document.querySelector(".modal");

// // Get the button that opens the modal
// var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
// const span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
window.onload = function() {
  modal.style.display = "block";
  modal.classList.add("show");
}

// When the user clicks on <span> (x), close the modal
modal.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
