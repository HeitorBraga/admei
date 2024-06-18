//= require jquery.maskMoney
//= require jquery.mask

import { Controller } from 'stimulus'

export default class extends Controller {

  connect() {
    this.maskInputs()
  }

  maskInputs() {
    $('#costs').on("cocoon:after-insert", function(e, insertedItem) {
      $(insertedItem).find("[data-mask='money']").maskMoney({
        prefix: "R$ ",
        decimal: ",",
        thousands: "",
        allowZero: true
      });
      $(insertedItem).find("[data-mask=integer]").mask("000000000000000")
    })
  }
}
