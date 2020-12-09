import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'count', 'id', 'class' ];

  refresh() {

    fetch('/products', { headers: { accept: "application/json" } })
          .then(response => response.json())
          .then((data) => {
            let object = data.products.filter(obj => {
              return obj.id == this.idTarget.innerText
            });
            if (object[0].stock <= 10) {
              if (object[0].stock === 1) {
                this.classTarget.classList.value = 'add-to-cart-disable';
                this.classTarget.hidden = true;
                this.classTarget.disabled = true;
                this.countTarget.classList.value = 'out-stock';
                this.countTarget.innerText = 'You got the last one 😉';
              } else {
                this.countTarget.innerText = `Last ${object[0].stock - 1}`;
              }
            }else{
              console.log('Hi there hacker!');
            }
          });
  }
}

