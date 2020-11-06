import { Controller } from 'stimulus'

export default class extends Controller {
 static targets = ["button", "workerQuery", "siteQuery", "positionQuery", "companyQuery", "userQuery", "worker", "site", "position", "company", "user", "workerCounter", "siteCounter", "positionCounter", "companyCounter", "userCounter"] 

 reset(event) {
    let model = event.target.dataset.model

    if (this.[model + 'Targets']) {
        this.[model + 'Targets'].forEach((target) => {
            target.classList.remove('hidden') 
        })
    } else {
        this.[model + 'Target'].forEach((target) => {
            target.classList.remove('hidden') 
            })
    }
    this.[model + 'CounterTarget'].innerText = `${this.[model + 'Targets'].length} salariés`
 }

 submit(event) {
 	event.preventDefault()
    let model = this.buttonTarget.dataset.model
    let value = this.[model + 'QueryTarget'].value;
    fetch(`admin?query_${model}=${value}`, {
          headers: { accept: 'application/json'}
        }).then((response) => response.json())
        .then(data => { 
     const idToDisplay = []
     if (model == 'company'){
          data.companies.forEach((result) => {
              idToDisplay.push(result.id.toString())
             })
      } else {
        console.log(model)
        console.log(data)
        data.[model + 's'].forEach((result) => {
            idToDisplay.push(result.id.toString())
           })
      }
     if (idToDisplay.length > 1) {
        this.[model + 'CounterTarget'].innerText = `${idToDisplay.length} résultats`
     } else if (idToDisplay.length == 1) {
        this.[model + 'CounterTarget'].innerText = `${idToDisplay.length} résultat`
     } else {
        this.[model + 'CounterTarget'].innerText = 'aucun résultat'
     }
     this.[model + 'Targets'].forEach((target) => {
        target.classList.add('hidden')     
        if (idToDisplay.includes(target.dataset.id)) {
         target.classList.remove('hidden')     
        }
         })
    })

}
}