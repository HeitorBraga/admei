import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["payLatterContainer", "collaboratorContainer"]

  connect() {
  }

  changeInputs(e) {
    if (e.target.checked == true) {
      this.showInputs(e)
    } else {
      this.hideInputs(e)
    }
  }

  showInputs(e) {
    if (e.target.id == "sale_pay_latter") {
      $(this.payLatterContainerTarget).removeClass("is-hidden")
    } else {
      $(this.collaboratorContainerTarget).removeClass("is-hidden")
    }
  }

  hideInputs(e) {
    if (e.target.id == "sale_pay_latter") {
      $(this.payLatterContainerTarget).addClass("is-hidden")
    } else {
      $(this.collaboratorContainerTarget).addClass("is-hidden")
    }
  }
}
