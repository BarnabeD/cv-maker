import { Controller } from "stimulus"


export default class extends Controller {
  static targets = [ 'submitButton' ]

  toggle(event) {
    if (event.currentTarget.value == "") {
      this.submitButtonTarget.disabled = true
    } else {
      this.submitButtonTarget.classList.contains('hidden') ? this.submitButtonTarget.classList.remove('hidden') : console.log('faux')
      this.submitButtonTarget.disabled =false
    }
  }
}
