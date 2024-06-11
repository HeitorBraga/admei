import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    setTimeout(this.hide.bind(this), 3 * 1000)
  }

  hide() {
    this.element.classList.add("hidden")
  }
}
