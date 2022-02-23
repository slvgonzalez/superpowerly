import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "form"];

  toggleForm() {
    console.log("yaay")
    this.buttonTarget.classList.add('d-none');
    this.formTarget.classList.remove('d-none');
  }
}
