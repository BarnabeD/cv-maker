import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'form' ]

  toggleShow() {
    if (this.formTarget.classList.contains('hidden'))
      this.formTarget.classList.replace( 'hidden', 'display' )
    else if (this.formTarget.classList.contains('display')){
      this.formTarget.classList.replace( 'display', 'hidden' )
    }
  }
}
