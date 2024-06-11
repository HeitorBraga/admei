import { Controller } from "stimulus"

export default class extends Controller {
  toggle() {
    this.element.classList.toggle("is-active")
  }

  mainFrameId() {
    return this.element.parentElement.getAttribute("id")
  }

  close(e) {
    if (
      this.element.classList.contains("is-active") &&
      e.target.dataset.turboFrame !== `${this.mainFrameId()}_items`
    ) {
      this.element.classList.remove("is-active")
    }
  }
}
