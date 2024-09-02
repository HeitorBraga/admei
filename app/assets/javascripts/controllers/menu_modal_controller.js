import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {

  }

  activeModal() {
    $(this.modalTarget).addClass("is-active")
  }

  closeModal() {
    $(this.modalTarget).removeClass("is-active")
  }
}
