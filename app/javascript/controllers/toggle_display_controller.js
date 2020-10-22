import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'form', 'newButton', 'cancelButton' ]

  toggleShow() {
    if (this.formTarget.classList.contains('hidden')) {
      this.formTarget.classList.replace( 'hidden', 'display' )
      this.cancelButtonTarget.classList.replace( 'hidden', 'display' )
      this.newButtonTarget.classList.toggle('hidden')
    } else if (this.formTarget.classList.contains('display')) {
      this.formTarget.classList.replace( 'display', 'hidden' )
      this.cancelButtonTarget.classList.toggle('hidden')
      this.newButtonTarget.classList.toggle('hidden')
    }
  }
}
