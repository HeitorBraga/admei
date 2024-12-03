import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [
    "payLaterContainer",
    "collaboratorContainer",
    "sellerContainer",
    "payLater",
    "forCollaborator",
    "forSeller"
  ]

  connect() {
    this.payLater()
    this.forCollaborator()
    this.forSeller()
  }

  payLater() {
    if (this.payLaterTarget.checked == true && this.forSellerTarget.checked == false) {
      if (!this.forCollaboratorTarget.checked == true ) {
        $(this.payLaterContainerTarget).removeClass("is-hidden")
      }
    } else {
      $(this.payLaterContainerTarget).addClass("is-hidden")
      $(this.payLaterTarget).prop('checked', false)
    }
  }

  forCollaborator() {
    if (this.forCollaboratorTarget.checked == true && this.forSellerTarget.checked == false) {
      $(this.collaboratorContainerTarget).removeClass("is-hidden")
      if (this.payLaterTarget.checked == true) {
      $(this.payLaterContainerTarget).addClass("is-hidden")
    }
    } else {
      $(this.collaboratorContainerTarget).addClass("is-hidden")
      $(this.forCollaboratorTarget).prop('checked', false)

      if (this.payLaterTarget.checked == true) {
        $(this.payLaterContainerTarget).removeClass("is-hidden")
      }
    }
  }

  forSeller(){
    if (this.forSellerTarget.checked == true) {
      $(this.sellerContainerTarget).removeClass("is-hidden")

      $(this.payLaterTarget).prop('checked', false)
      this.payLater()

      $(this.forCollaboratorTarget).prop('checked', false)
      this.forCollaborator()
    } else {
      $(this.sellerContainerTarget).addClass("is-hidden")
    }
  }
}
