import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["item"]
  static values = { initState: String }

  connect() {
    this.setInitState()
  }

  setInitState() {
    if (this.initStateValue === "disabled") {
      this.disable()
    } else if (this.initStateValue === "enabled") {
      this.enable()
    }
  }

  toggle() {
    this.itemTargets.forEach((item) => {
      if (item.attributes["disabled"]) {
        item.removeAttribute("disabled")
      } else {
        item.setAttribute("disabled", "disabled")
      }
    })
  }

  enable() {
    this.itemTargets.forEach((item) => {
      item.removeAttribute("disabled")
    })
  }

  disable() {
    this.itemTargets.forEach((item) => {
      item.setAttribute("disabled", "disabled")
    })
  }
}
