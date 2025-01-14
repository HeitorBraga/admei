import { Controller } from "stimulus"

export default class extends Controller {

  static targets = [
    "modal",
    "cashRegisterInputsContainer",
    "walletContainer"
  ]

  connect() {
  }

  activeModal() {
    $(this.modalTarget).addClass("is-active")
  }

  closeModal() {
    $(this.modalTarget).removeClass("is-active")
  }

  showInputs() {
    $(this.cashRegisterInputsContainerTarget).removeClass("is-hidden")
    $(this.walletContainerTarget).addClass("is-hidden")
  }

  hiddeInputs() {
    $(this.cashRegisterInputsContainerTarget).addClass("is-hidden")
    $(this.walletContainerTarget).removeClass("is-hidden")
  }
}
