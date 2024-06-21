//= require jquery.maskMoney
//= require jquery.mask

import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    this.maskInputs()
  }

  maskInputs() {
    $(document).on("cocoon:after-insert", function(e, insertedItem) {
      $(insertedItem).find("[data-mask='money']").maskMoney({
        prefix: "R$ ",
        decimal: ",",
        allowZero: false
      });
      $(insertedItem).find("[data-mask=integer]").maskMoney("000000000000000")
    })
  }
}
