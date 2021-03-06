import { Controller } from "stimulus"
// import capitalize
import { capitalizeFirstLetter } from '../packs/capitalize.js';


export default class extends Controller {


  static targets = [ 'graduateForm', 'newGraduateButton', 'cancelGraduateButton', 'positionForm', 'newPositionButton', 'cancelPositionButton', 'profilForm', 'newProfilButton', 'cancelProfilButton']

  toggleShow(event) {
    const model = event.target.dataset.model
    if (this.[model + 'FormTarget'].classList.contains('hidden')) {
      this.[model + 'FormTarget'].classList.replace( 'hidden', 'display' )
      this.['cancel' + capitalizeFirstLetter(model) + 'ButtonTarget'].classList.replace( 'hidden', 'display' )
      this.['new' + capitalizeFirstLetter(model) + 'ButtonTarget'].classList.toggle('hidden')
      scroll({ top: this.[model + 'FormTarget'].offsetTop, behavior: "smooth" });
    } else if (this.[model + 'FormTarget'].classList.contains('display')) {
      this.[model + 'FormTarget'].classList.replace( 'display', 'hidden' )
      this.['cancel' + capitalizeFirstLetter(model) + 'ButtonTarget'].classList.toggle('hidden')
      this.['new' + capitalizeFirstLetter(model) + 'ButtonTarget'].classList.toggle('hidden')
    }
  }
}
