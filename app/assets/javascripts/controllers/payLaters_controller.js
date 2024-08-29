import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["payLaterData", "collaboratorContainer", "forCollaborator"]

  connect() {}

  forCollaborator() {
    if (this.forCollaboratorTarget.checked == true) {
      $(this.collaboratorContainerTarget).removeClass("is-hidden")
      $(this.payLaterDataTarget).addClass("is-hidden")
    } else {
      $(this.collaboratorContainerTarget).addClass("is-hidden")
      $(this.payLaterDataTarget).removeClass("is-hidden")
    }
  }
}
