import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["nameInput", "phoneInput"]

  connect() {
    this.hideInputs()
  }

  changeInputs(e) {
    if (e.target.checked == true) {
      this.showInputs()
    } else {
      this.hideInputs()
    }
  }

  showInputs() {
    $(this.nameInputTarget).removeClass("is-hidden")
    $(this.phoneInputTarget).removeClass("is-hidden")
  }

  hideInputs() {
    $(this.nameInputTarget).addClass("is-hidden")
    $(this.phoneInputTarget).addClass('is-hidden')
  }
}
