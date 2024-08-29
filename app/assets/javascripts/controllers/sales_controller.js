import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["payLaterContainer", "collaboratorContainer", "payLater", "forCollaborator"]

  connect() {
  }

  payLater() {
    if (this.payLaterTarget.checked == true) {
      if (!this.forCollaboratorTarget.checked == true ) {
        $(this.payLaterContainerTarget).removeClass("is-hidden")
      }
    } else {
      $(this.payLaterContainerTarget).addClass("is-hidden")
    }
  }

  forCollaborator(e) {
    if (this.forCollaboratorTarget.checked == true) {
      $(this.collaboratorContainerTarget).removeClass("is-hidden")
      if (this.payLaterTarget.checked == true) {
      $(this.payLaterContainerTarget).addClass("is-hidden")
    }
    } else {
      $(this.collaboratorContainerTarget).addClass("is-hidden")
      if (this.payLaterTarget.checked == true) {
        $(this.payLaterContainerTarget).removeClass("is-hidden")
      }
    }
  }
}
