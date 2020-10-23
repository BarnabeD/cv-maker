import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'graduateForm', 'positionForm', 'newPositionButton', 'newGraduateButton','cancelPositionButton', 'cancelGraduateButton' ]

  togglePositionShow() {
    if (this.positionFormTarget.classList.contains('hidden')) {
      this.positionFormTarget.classList.replace( 'hidden', 'display' )
      this.cancelPositionButtonTarget.classList.replace( 'hidden', 'display' )
      this.newPositionButtonTarget.classList.toggle('hidden')
    } else if (this.positionFormTarget.classList.contains('display')) {
      this.positionFormTarget.classList.replace( 'display', 'hidden' )
      this.cancelPositionButtonTarget.classList.toggle('hidden')
      this.newPositionButtonTarget.classList.toggle('hidden')
    }
  }

  toggleGraduateShow() {
    if (this.graduateFormTarget.classList.contains('hidden')) {
      this.graduateFormTarget.classList.replace( 'hidden', 'display' )
      this.cancelGraduateButtonTarget.classList.replace( 'hidden', 'display' )
      this.newGraduateButtonTarget.classList.toggle('hidden')
    } else if (this.graduateFormTarget.classList.contains('display')) {
      this.graduateFormTarget.classList.replace( 'display', 'hidden' )
      this.cancelGraduateButtonTarget.classList.toggle('hidden')
      this.newGraduateButtonTarget.classList.toggle('hidden')
    }
  }
}
