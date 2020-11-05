import { Controller } from 'stimulus'

export default class extends Controller {
 static targets = ["query", "button", "worker", "site", "position", "company", "user", "workerCounter", "siteCounter", "positionCounter", "companyCounter", "userCounter"] 

 reset(event) {
    const model = event.target.dataset.model

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
    const model = this.buttonTarget.dataset.model
    const value = this.queryTarget.value;
    const queryName = this.queryTarget.name
    fetch(`admin?${queryName}=${value}`, {
          headers: { accept: 'application/json'}
        }).then((response) => response.json())
        .then(data => { 
     const idToDisplay = []
     data.[model + 's'].forEach((jsonWorker) => {
         idToDisplay.push(jsonWorker.id.toString())
        })
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