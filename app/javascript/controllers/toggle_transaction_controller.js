import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-transaction"
export default class extends Controller {
  static targets = ['myForm']
  initialize() {
    this.toggle = true;
    this.myFormTarget.classList.add('hidden');
  }
  toggleShow() {
    this.toggle ?
        (this.myFormTarget.classList.remove('hidden'), this.toggle = false) :
        (this.myFormTarget.classList.add('hidden'), this.toggle = true)

  }
}
