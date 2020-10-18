import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'form', 'button' ]

  toggleShow() {
    if (this.formTarget.classList.contains('hidden')) {
      this.formTarget.classList.replace( 'hidden', 'display' )
      this.buttonTarget.classList.toggle('hidden')
    } else if (this.formTarget.classList.contains('display')) {
      this.formTarget.classList.replace( 'display', 'hidden' )
    }
  }
}
