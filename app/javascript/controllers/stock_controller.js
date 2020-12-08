import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'count', 'id' ];

  refresh() {

    fetch('/products', { headers: { accept: "application/json" } })
          .then(response => response.json())
          .then((data) => {
            let object = data.products.filter(obj => {
              return obj.id == this.idTarget.innerText
            });
            this.countTarget.innerText = `Last ${object[0].stock - 1}`;
          });
  }
}

