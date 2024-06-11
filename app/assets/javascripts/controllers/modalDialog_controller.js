import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["dialog"]

  connect() {
    document.addEventListener(
      "turbo:submit-end",
      this.focusTableNumber.bind(this)
    )
  }

  focusTableNumber() {
    setTimeout(() => {
      const input = this.dialogTarget.querySelector("input[type=text]")
      input.setSelectionRange(0, input.value.length)
      input.focus()
    }, 50)
  }

  show() {
    this.dialogTarget.classList.add("is-active")
    this.focusTableNumber()
  }

  close() {
    this.dialogTarget.classList.remove("is-active")
  }
}
